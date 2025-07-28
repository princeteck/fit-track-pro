import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';

class SessionRecordingBottomSheet extends StatefulWidget {
  final Duration sessionDuration;
  final HeartRateType heartRateType;
  final VoidCallback onSessionCompleted;
  final VoidCallback onSessionCancelled;
  final Future<void> Function(HeartRateSession) onSessionSaved;

  const SessionRecordingBottomSheet({
    super.key,
    required this.sessionDuration,
    required this.heartRateType,
    required this.onSessionCompleted,
    required this.onSessionCancelled,
    required this.onSessionSaved,
  });

  @override
  State<SessionRecordingBottomSheet> createState() => _SessionRecordingBottomSheetState();
}

class _SessionRecordingBottomSheetState extends State<SessionRecordingBottomSheet>
    with TickerProviderStateMixin {
  late Timer _sessionTimer;
  late AnimationController _pulseController;
  late AnimationController _progressController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _progressAnimation;

  Duration _remainingTime = Duration.zero;
  int _currentBpm = 0;
  String _sessionId = '';
  final List<HeartRateReading> _readings = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.sessionDuration;
    _sessionId = 'session_${DateTime.now().millisecondsSinceEpoch}';
    _setupAnimations();
    _startSession();
  }

  void _setupAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: widget.sessionDuration,
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.linear),
    );

    _pulseController.repeat(reverse: true);
    _progressController.forward();
  }

  void _startSession() {
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds <= 0) {
        _completeSession();
        return;
      }

      setState(() {
        _remainingTime = _remainingTime - const Duration(seconds: 1);
        _currentBpm = _generateMockHeartRate();
      });

      // Add reading to session data
      _readings.add(HeartRateReading(
        bpm: _currentBpm,
        timestamp: DateTime.now(),
        intervalMs: 1000.0, // 1 second intervals
      ));
    });
  }

  @override
  void dispose() {
    _sessionTimer.cancel();
    _pulseController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  int _generateMockHeartRate() {
    // Generate realistic heart rate based on type
    int baseBpm;
    int variability;

    switch (widget.heartRateType) {
      case HeartRateType.resting:
        baseBpm = 70;
        variability = 10;
        break;
      case HeartRateType.active:
        baseBpm = 90;
        variability = 15;
        break;
      case HeartRateType.exercise:
        baseBpm = 140;
        variability = 25;
        break;
      case HeartRateType.recovery:
        baseBpm = 100;
        variability = 20;
        break;
    }

    return baseBpm + _random.nextInt(variability * 2) - variability;
  }

  Future<void> _completeSession() async {
    _sessionTimer.cancel();

    // Calculate session statistics
    final avgBpm = _readings.isNotEmpty
        ? _readings.map((r) => r.bpm).reduce((a, b) => a + b) ~/
              _readings.length
        : 0;
    final minBpm = _readings.isNotEmpty
        ? _readings.map((r) => r.bpm).reduce((a, b) => a < b ? a : b)
        : 0;
    final maxBpm = _readings.isNotEmpty
        ? _readings.map((r) => r.bpm).reduce((a, b) => a > b ? a : b)
        : 0;

    // Create session object
    final session = HeartRateSession(
      id: _sessionId,
      userId: 'current_user_id', // Match the user ID used in cubit
      type: widget.heartRateType,
      startTime: DateTime.now().subtract(widget.sessionDuration),
      endTime: DateTime.now(),
      durationSeconds: widget.sessionDuration.inSeconds,
      readings: _readings,
      averageBpm: avgBpm,
      minBpm: minBpm,
      maxBpm: maxBpm,
      notes: 'Heart rate monitoring session completed',
      createdAt: DateTime.now(),
    );

    // Save session
    await widget.onSessionSaved(session);

    // Complete session
    widget.onSessionCompleted();
  }

  void _cancelSession() {
    _sessionTimer.cancel();
    widget.onSessionCancelled();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final progress = _progressAnimation.value;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        border: Border.all(
          color: const Color(0xFFE91E63).withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE91E63).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            KIcons.heartSolid,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFE91E63),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recording Session',
                              style: GoogleFonts.inter(
                                textStyle: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _getTypeDisplayName(widget.heartRateType),
                              style: GoogleFonts.inter(
                                textStyle: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Cancel button
                      IconButton(
                        onPressed: _cancelSession,
                        style: IconButton.styleFrom(
                          backgroundColor: theme.colorScheme.surface,
                          foregroundColor: theme.colorScheme.onSurface,
                        ),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Progress indicator
                  Container(
                    width: double.infinity,
                    height: 8,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.transparent,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFE91E63),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Heart rate display with pulse animation
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulseAnimation.value,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFFE91E63).withValues(
                                      alpha: 0.1,
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFE91E63),
                                      width: 3,
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '$_currentBpm',
                                          style: GoogleFonts.inter(
                                            textStyle: theme.textTheme.displaySmall?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: const Color(0xFFE91E63),
                                              height: 1.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'BPM',
                                          style: GoogleFonts.inter(
                                            textStyle: theme.textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: theme.colorScheme.onSurface.withValues(
                                                alpha: 0.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 32),

                          // Timer display
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  KIcons.infinite,
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    theme.colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _formatTime(_remainingTime),
                                  style: GoogleFonts.inter(
                                    textStyle: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            'Keep still and breathe normally',
                            style: GoogleFonts.inter(
                              textStyle: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _getTypeDisplayName(HeartRateType type) {
    switch (type) {
      case HeartRateType.resting:
        return 'Resting Heart Rate';
      case HeartRateType.active:
        return 'Active Heart Rate';
      case HeartRateType.exercise:
        return 'Exercise Heart Rate';
      case HeartRateType.recovery:
        return 'Recovery Heart Rate';
    }
  }
}
