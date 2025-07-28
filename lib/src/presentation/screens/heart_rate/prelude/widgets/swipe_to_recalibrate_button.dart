import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';
import 'heart_rate_type_dialog.dart';
import 'session_duration_dialog.dart';
import 'session_recording_widget.dart';

// Controller to manage swipe button state from outside
class SwipeButtonController {
  _SwipeToRecalibrateButtonState? _state;

  void _attach(_SwipeToRecalibrateButtonState state) {
    _state = state;
  }

  void _detach() {
    _state = null;
  }

  void reset() {
    _state?.resetButton();
  }
}

class SwipeToRecalibrateButton extends StatefulWidget {
  final VoidCallback onRecalibrate;
  final bool isLoading;
  final VoidCallback? onSwipeCompleted;
  final SwipeButtonController? controller;
  final Future<void> Function(HeartRateSession)? onSessionSaved;
  final VoidCallback? onDashboardUpdate;

  const SwipeToRecalibrateButton({
    super.key,
    required this.onRecalibrate,
    this.isLoading = false,
    this.onSwipeCompleted,
    this.controller,
    this.onSessionSaved,
    this.onDashboardUpdate,
  });

  @override
  State<SwipeToRecalibrateButton> createState() =>
      _SwipeToRecalibrateButtonState();
}

class _SwipeToRecalibrateButtonState extends State<SwipeToRecalibrateButton>
    with TickerProviderStateMixin {
  late AnimationController _swipeController;
  late AnimationController _pulseController;
  late Animation<double> _swipeAnimation;
  late Animation<double> _pulseAnimation;

  double _dragStartPosition = 0;
  double _currentPosition = 0;
  bool _isDragging = false;
  bool _isCompleted = false;
  HeartRateType? _selectedHeartRateType;
  Duration? _selectedDuration;

  static const double _buttonHeight = 60.0;
  static const double _thumbSize = 52.0;
  static const double _completeThreshold = 0.8;

  @override
  void initState() {
    super.initState();
    widget.controller?._attach(this);
    _setupAnimations();
  }

  void _setupAnimations() {
    _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _swipeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _swipeController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Start pulse animation
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    widget.controller?._detach();
    _swipeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    if (widget.isLoading || _isCompleted) return;

    setState(() {
      _isDragging = true;
      _dragStartPosition = details.localPosition.dx;
    });
    _pulseController.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (widget.isLoading || _isCompleted) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final containerWidth =
        renderBox.size.width -
        _thumbSize -
        8; // Account for padding on both sides
    final dragDistance = details.localPosition.dx - _dragStartPosition;
    final normalizedPosition = (dragDistance / containerWidth).clamp(0.0, 1.0);

    setState(() {
      _currentPosition = normalizedPosition;
    });

    // Provide haptic feedback when nearing completion
    if (normalizedPosition > _completeThreshold &&
        _currentPosition <= _completeThreshold) {
      HapticFeedback.lightImpact();
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (widget.isLoading || _isCompleted) return;

    if (_currentPosition >= _completeThreshold) {
      _completeSwipe();
    } else {
      _resetSwipe();
    }
  }

  void _completeSwipe() {
    setState(() {
      _isCompleted = true;
      _currentPosition = 1.0;
    });

    HapticFeedback.heavyImpact();

    // Animate to completion
    _swipeController.forward().then((_) {
      // Start the flow: Heart Rate Type Selection
      _showHeartRateTypeDialog();
    });
  }

  void _showHeartRateTypeDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => HeartRateTypeDialog(
        onTypeSelected: (HeartRateType selectedType) {
          _selectedHeartRateType = selectedType;
          _showDurationSelectionDialog();
        },
      ),
    ).then((_) {
      // If dialog was dismissed without selection, reset the button
      if (_selectedHeartRateType == null) {
        resetButton();
      }
    });
  }

  void _showDurationSelectionDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => SessionDurationDialog(
        onDurationSelected: (Duration selectedDuration) {
          _selectedDuration = selectedDuration;
          _startSessionRecording();
        },
      ),
    ).then((_) {
      // If dialog was dismissed without selection, reset the button
      if (_selectedDuration == null) {
        resetButton();
      }
    });
  }

  void _startSessionRecording() {
    if (_selectedHeartRateType == null || _selectedDuration == null) {
      resetButton();
      return;
    }

    // Show session recording widget
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SessionRecordingWidget(
        sessionDuration: _selectedDuration!,
        heartRateType: _selectedHeartRateType!,
        onSessionCompleted: () {
          Navigator.of(context).pop();
          _handleSessionCompleted();
        },
        onSessionCancelled: () {
          Navigator.of(context).pop();
          resetButton();
        },
        onSessionSaved: (HeartRateSession session) async {
          // Save session to database via callback
          await widget.onSessionSaved?.call(session);
        },
      ),
    );
  }

  void _handleSessionCompleted() {
    // Reset all state
    setState(() {
      _selectedHeartRateType = null;
      _selectedDuration = null;
    });

    // Call the original recalibrate callback
    widget.onRecalibrate();

    // Call the completion callback
    widget.onSwipeCompleted?.call();

    // Update dashboard with new data
    widget.onDashboardUpdate?.call();

    // Reset the button
    resetButton();
  }

  // New method to manually reset the button from parent
  void resetButton() {
    if (mounted) {
      setState(() {
        _isCompleted = false;
        _currentPosition = 0.0;
        _isDragging = false;
        _selectedHeartRateType = null;
        _selectedDuration = null;
      });
      _swipeController.reset();
      _pulseController.repeat(reverse: true);
    }
  }

  void _resetSwipe() {
    setState(() {
      _isDragging = false;
      _currentPosition = 0.0;
    });

    _swipeController.reverse().then((_) {
      _pulseController.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: AnimatedBuilder(
        animation: Listenable.merge([_swipeAnimation, _pulseAnimation]),
        builder: (context, child) {
          return GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: Container(
              height: _buttonHeight,
              decoration: BoxDecoration(
                color: _isCompleted
                    ? const Color(0xFF4CAF50)
                    : (isDarkMode
                          ? theme.colorScheme.surfaceContainerHighest
                          : Colors.grey[100]),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: _isCompleted
                      ? const Color(0xFF4CAF50)
                      : (_isDragging
                            ? theme.colorScheme.primary.withValues(alpha: 0.3)
                            : theme.colorScheme.outline.withValues(alpha: 0.2)),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: isDarkMode ? 0.3 : 0.1,
                    ),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Progress fill
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: _isDragging
                          ? Duration.zero
                          : const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [_currentPosition, _currentPosition],
                          colors: [
                            const Color(0xFFE91E63).withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Background text
                  Center(
                    child: AnimatedOpacity(
                      opacity: _isCompleted ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        widget.isLoading
                            ? 'Re-calibrating...'
                            : 'Swipe to Re-calibrate',
                        style: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: _isDragging ? 0.4 : 0.6,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Completion text
                  if (_isCompleted)
                    Center(
                      child: AnimatedOpacity(
                        opacity: _isCompleted ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Re-calibrating...',
                              style: GoogleFonts.inter(
                                textStyle: theme.textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Draggable thumb
                  AnimatedPositioned(
                    duration: _isDragging || _isCompleted
                        ? Duration.zero
                        : const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left:
                        4 +
                        (_currentPosition *
                            (MediaQuery.of(context).size.width -
                                48 -
                                _thumbSize)), // 48 = margin (20*2) + padding (4*2)
                    top: 4,
                    child: Container(
                      width: _thumbSize,
                      height: _thumbSize,
                      decoration: BoxDecoration(
                        color: _isCompleted
                            ? Colors.white
                            : const Color(0xFFE91E63),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Pulse effect
                          if (!_isDragging &&
                              !_isCompleted &&
                              !widget.isLoading)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFE91E63).withValues(
                                      alpha: 0.3 * (1 - _pulseAnimation.value),
                                    ),
                                    width: 2 + (4 * _pulseAnimation.value),
                                  ),
                                ),
                              ),
                            ),

                          // Icon
                          Center(
                            child: widget.isLoading || _isCompleted
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        _isCompleted
                                            ? const Color(0xFF4CAF50)
                                            : Colors.white,
                                      ),
                                    ),
                                  )
                                : SvgPicture.asset(
                                    KIcons.arrowRight,
                                    width: 20,
                                    height: 20,
                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
