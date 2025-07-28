import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';

class SessionRecordingWidget extends StatefulWidget {
  final Duration sessionDuration;
  final HeartRateType heartRateType;
  final VoidCallback onSessionCompleted;
  final VoidCallback onSessionCancelled;
  final Future<void> Function(HeartRateSession) onSessionSaved;

  const SessionRecordingWidget({
    super.key,
    required this.sessionDuration,
    required this.heartRateType,
    required this.onSessionCompleted,
    required this.onSessionCancelled,
    required this.onSessionSaved,
  });

  @override
  State<SessionRecordingWidget> createState() => _SessionRecordingWidgetState();
}

class _SessionRecordingWidgetState extends State<SessionRecordingWidget>
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

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
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

        // Generate mock heart rate data
        _currentBpm = _generateMockHeartRate();

        // Add reading to list
        _readings.add(
          HeartRateReading(
            bpm: _currentBpm,
            timestamp: DateTime.now(),
            intervalMs: 1000.0, // 1 second interval
          ),
        );
      });
    });
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
      createdAt: DateTime.now(),
    );

    // Save session and wait for completion
    await widget.onSessionSaved(session);
    widget.onSessionCompleted();
  }

  void _cancelSession() {
    _sessionTimer.cancel();
    widget.onSessionCancelled();
  }

  @override
  void dispose() {
    _sessionTimer.cancel();
    _pulseController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final progress = _progressAnimation.value;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE91E63).withValues(alpha: 0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.3 : 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                    const SizedBox(height: 2),
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
              IconButton(
                onPressed: _cancelSession,
                icon: Icon(
                  Icons.close,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Circular progress with heart rate
          AnimatedBuilder(
            animation: Listenable.merge([_progressAnimation, _pulseAnimation]),
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background circle
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: 1.0,
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.outline.withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                      // Progress circle
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 8,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFE91E63),
                          ),
                        ),
                      ),
                      // Center content
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$_currentBpm',
                            style: GoogleFonts.inter(
                              textStyle: theme.textTheme.displayMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFE91E63),
                                  ),
                            ),
                          ),
                          Text(
                            'BPM',
                            style: GoogleFonts.inter(
                              textStyle: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _formatRemainingTime(),
                            style: GoogleFonts.inter(
                              textStyle: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 32),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(
                'Readings',
                _readings.length.toString(),
                Icons.data_usage_outlined,
                theme,
              ),
              _buildStatItem(
                'Avg BPM',
                _readings.isNotEmpty
                    ? (_readings.map((r) => r.bpm).reduce((a, b) => a + b) ~/
                              _readings.length)
                          .toString()
                    : '0',
                Icons.trending_up_outlined,
                theme,
              ),
              _buildStatItem(
                'Progress',
                '${(progress * 100).toInt()}%',
                Icons.timer_outlined,
                theme,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Cancel button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: _cancelSession,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Cancel Session',
                style: GoogleFonts.inter(
                  textStyle: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    ThemeData theme,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }

  String _formatRemainingTime() {
    final minutes = _remainingTime.inMinutes;
    final seconds = _remainingTime.inSeconds % 60;
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
