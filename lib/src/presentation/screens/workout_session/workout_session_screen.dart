import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../../../data/services/workout_api_service.dart';
import '../../controllers/workout_session/workout_session_cubit.dart';
import '../../widgets/custom_painters/progress_ring_painter.dart';
import '../../widgets/workout_session/workout_controls_bottom_sheet.dart';
import '../../widgets/workout_session/workout_progress_notification.dart';

class WorkoutSessionScreen extends StatefulWidget {
  final Duration workoutDuration;
  final WorkoutPlan? workoutPlan;

  const WorkoutSessionScreen({
    super.key,
    this.workoutDuration = const Duration(minutes: 30),
    this.workoutPlan,
  });
  static const String name = 'workout-session';
  static const String path = '/workout-session';

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen>
    with TickerProviderStateMixin {
  late final AnimationController _progressAnimationController;
  late final AnimationController _heartRateAnimationController;
  late final AnimationController _backgroundAnimationController;
  late final AnimationController _notificationController;

  late final Animation<double> _progressAnimation;
  late final Animation<double> _heartRatePulseAnimation;
  late final Animation<double> _backgroundAnimation;
  late final Animation<Offset> _notificationSlideAnimation;
  late final WorkoutSessionCubit _cubit;

  bool _showNotification = false;

  @override
  void initState() {
    super.initState();
    _cubit = locator<WorkoutSessionCubit>();
    _setupAnimations();
    _startBackgroundAnimation();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_cubit.isClosed) {
        _cubit.setWorkoutDuration(widget.workoutDuration);

        if (widget.workoutPlan != null) {
          _cubit.setWorkoutDetails(
            workoutPlanId: widget.workoutPlan!.id,
            workoutPlanName: widget.workoutPlan!.title,
          );
        }

        _cubit.startWorkout();
      }
    });
  }

  void _setupAnimations() {
    _progressAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _heartRateAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _backgroundAnimationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _notificationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _progressAnimation = CurvedAnimation(
      parent: _progressAnimationController,
      curve: Curves.easeInOutCubic,
    );

    _heartRatePulseAnimation = CurvedAnimation(
      parent: _heartRateAnimationController,
      curve: Curves.easeInOut,
    );

    _backgroundAnimation = CurvedAnimation(
      parent: _backgroundAnimationController,
      curve: Curves.linear,
    );

    _notificationSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _notificationController,
            curve: Curves.easeOutCubic,
          ),
        );
  }

  void _startBackgroundAnimation() {
    _backgroundAnimationController.repeat();
    _heartRateAnimationController.repeat(reverse: true);
  }

  void _showWorkoutNotification() {
    setState(() {
      _showNotification = true;
    });

    _notificationController.forward().then((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          _notificationController.reverse().then((_) {
            if (mounted) {
              setState(() {
                _showNotification = false;
              });
            }
          });
        }
      });
    });
  }

  void _onSwipeLeft() {
    context.read<WorkoutSessionCubit>().skipExercise();
    _showWorkoutNotification();
  }

  void _onSwipeRight() {
    context.read<WorkoutSessionCubit>().previousExercise();
  }

  void _onSwipeUp() {
    _showBottomSheet();
  }

  void _onSwipeDown() {
    context.read<WorkoutSessionCubit>().togglePause();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const WorkoutControlsBottomSheet(),
    );
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _heartRateAnimationController.dispose();
    _backgroundAnimationController.dispose();
    _notificationController.dispose();

    if (!_cubit.isClosed) {
      _cubit.completeWorkout();
      _cubit.close();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: BlocListener<WorkoutSessionCubit, WorkoutSessionState>(
        listener: (context, state) {
          if (state.isSessionComplete) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }

          _progressAnimationController.animateTo(state.progress);
        },
        child: Scaffold(
          body: Stack(
            children: [
              _buildGradientBackground(),
              _buildMainContent(),
              if (_showNotification) _buildNotification(),
              _buildTopControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientBackground() {
    return AnimatedBuilder(
      animation: _backgroundAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.6),
                Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.4),
              ],
              stops: [
                0.0,
                0.5 + 0.3 * math.sin(_backgroundAnimation.value * 2 * math.pi),
                1.0,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainContent() {
    return GestureDetector(
      onPanUpdate: (details) {
        final velocity = details.delta;
        final threshold = 10.0;

        if (velocity.dx.abs() > velocity.dy.abs()) {
          if (velocity.dx > threshold) {
            _onSwipeRight();
          } else if (velocity.dx < -threshold) {
            _onSwipeLeft();
          }
        } else {
          if (velocity.dy > threshold) {
            _onSwipeDown();
          } else if (velocity.dy < -threshold) {
            _onSwipeUp();
          }
        }
      },
      child: BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProgressRing(state),
                const SizedBox(height: 40),
                _buildHeartRateDisplay(state),
                const SizedBox(height: 60),
                _buildWorkoutInfo(state),
                const SizedBox(height: 40),
                _buildSwipeInstructions(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressRing(WorkoutSessionState state) {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(280, 280),
                painter: ProgressRingPainter(
                  progress: state.progress,
                  animationValue: _progressAnimation.value,
                  segments: [
                    ProgressSegment(
                      percentage: 100,
                      startColor: Theme.of(context).colorScheme.primary,
                      endColor: Theme.of(context).colorScheme.secondary,
                      label: 'Progress',
                    ),
                  ],
                  strokeWidth: 12,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(state.progress * 100).round()}%',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Complete',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeartRateDisplay(WorkoutSessionState state) {
    return AnimatedBuilder(
      animation: _heartRatePulseAnimation,
      builder: (context, child) {
        final scale = 1.0 + (_heartRatePulseAnimation.value * 0.1);

        return Transform.scale(
          scale: scale,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red.withValues(
                    alpha: 0.8 + 0.2 * _heartRatePulseAnimation.value,
                  ),
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  '${state.heartRate} BPM',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWorkoutInfo(WorkoutSessionState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            state.currentExercise,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoItem(
                'Time Left',
                _formatTime(state.totalDurationSeconds - state.elapsedTime),
                Icons.timer,
              ),
              _buildInfoItem(
                'Calories',
                '${state.caloriesBurned}',
                Icons.local_fire_department,
              ),
              _buildInfoItem(
                'Sets',
                '${state.currentSet}/${state.totalSets}',
                Icons.repeat,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withValues(alpha: 0.8), size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildSwipeInstructions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '← Previous • ↑ Controls • ↓ Pause • Next →',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.white.withValues(alpha: 0.8),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNotification() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _notificationSlideAnimation,
        child: const WorkoutProgressNotification(),
      ),
    );
  }

  Widget _buildTopControls() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
          BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
            builder: (context, state) {
              return IconButton(
                color: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  state.isPaused ? Icons.play_arrow : Icons.pause,
                  color: Colors.black,
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  context.read<WorkoutSessionCubit>().togglePause();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final validSeconds = math.max(0, seconds);
    final minutes = validSeconds ~/ 60;
    final remainingSeconds = validSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
