import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/native_sensor_service.dart';
import '../../../data/repositories/workout_session_repository.dart';
import '../../../domain/entities/workout_session_entity.dart';
import '../base/base_cubit_wrapper.dart';

part 'workout_session_state.dart';
part 'workout_session_cubit.freezed.dart';

@injectable
class WorkoutSessionCubit extends BaseCubitWrapper<WorkoutSessionState> {
  final NativeSensorService _nativeSensorService;
  final WorkoutSessionRepository _sessionRepository;

  Timer? _workoutTimer;
  Timer? _heartRateTimer;
  final List<WorkoutSensorData> _sensorDataRecords = [];
  String? _workoutPlanId;
  String? _workoutPlanName;

  WorkoutSessionCubit(this._nativeSensorService, this._sessionRepository)
    : super(const WorkoutSessionState());

  void setWorkoutDetails({
    required String workoutPlanId,
    required String workoutPlanName,
  }) {
    _workoutPlanId = workoutPlanId;
    _workoutPlanName = workoutPlanName;
  }

  void setWorkoutDuration(Duration duration) {
    emit(state.copyWith(totalDurationSeconds: duration.inSeconds));
  }

  void startWorkout() {
    emit(
      state.copyWith(
        isActive: true,
        isPaused: false,
        startTime: DateTime.now(),
      ),
    );

    _startWorkoutTimer();
    _startHeartRateMonitoring();
    _nativeSensorService.startWorkoutSession();
  }

  void togglePause() {
    if (state.isPaused) {
      emit(state.copyWith(isPaused: false));
      _startWorkoutTimer();
    } else {
      emit(state.copyWith(isPaused: true));
      _pauseWorkoutTimer();
    }

    _nativeSensorService.toggleWorkoutPause();
  }

  void skipExercise() {
    final nextExerciseIndex = math.min(
      state.currentExerciseIndex + 1,
      state.exercises.length - 1,
    );

    emit(
      state.copyWith(currentExerciseIndex: nextExerciseIndex, currentSet: 1),
    );

    _updateProgress();
  }

  void previousExercise() {
    final prevExerciseIndex = math.max(state.currentExerciseIndex - 1, 0);

    emit(
      state.copyWith(currentExerciseIndex: prevExerciseIndex, currentSet: 1),
    );

    _updateProgress();
  }

  void nextSet() {
    if (state.currentSet < state.totalSets) {
      emit(state.copyWith(currentSet: state.currentSet + 1));
    } else {
      skipExercise();
    }

    _updateProgress();
  }

  void completeWorkout() {
    _stopTimers();
    final endTime = DateTime.now();

    emit(
      state.copyWith(
        isActive: false,
        isSessionComplete: true,
        endTime: endTime,
      ),
    );

    // Save the workout session
    _saveWorkoutSession(endTime);

    _nativeSensorService.stopWorkoutSession();
  }

  void _saveWorkoutSession(DateTime endTime) async {
    if (_workoutPlanId == null ||
        _workoutPlanName == null ||
        state.startTime == null) {
      return;
    }

    final session = WorkoutSessionEntity(
      id: const Uuid().v4(),
      workoutPlanId: _workoutPlanId!,
      workoutPlanName: _workoutPlanName!,
      startTime: state.startTime!,
      endTime: endTime,
      durationSeconds: state.elapsedTime,
      totalDurationSeconds: state.totalDurationSeconds,
      caloriesBurned: state.caloriesBurned,
      progress: state.progress,
      sensorData: List.from(_sensorDataRecords),
      exercisesCompleted: List.from(
        state.exercises.take(state.currentExerciseIndex + 1),
      ),
      setsCompleted: state.currentSet,
    );

    try {
      await _sessionRepository.saveSession(session);
    } catch (e) {
      debugPrint('Failed to save workout session: $e');
    }
  }

  void _startWorkoutTimer() {
    _workoutTimer?.cancel();
    _workoutTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!state.isPaused && state.isActive) {
        final newElapsedTime = state.elapsedTime + 1;
        emit(
          state.copyWith(
            elapsedTime: newElapsedTime,
            caloriesBurned: _calculateCaloriesBurned(),
          ),
        );

        // Record sensor data every second
        _recordSensorData();

        _updateProgress();

        // Check if workout time is complete
        if (state.elapsedTime >= state.totalDurationSeconds) {
          completeWorkout();
        }
      }
    });
  }

  void _recordSensorData() {
    final sensorData = WorkoutSensorData(
      timestamp: DateTime.now(),
      elapsedSeconds: state.elapsedTime,
      heartRate: state.heartRate,
      calories: state.caloriesBurned.toDouble(),
      progress: state.progress,
      isPaused: state.isPaused,
    );

    _sensorDataRecords.add(sensorData);
  }

  void _pauseWorkoutTimer() {
    _workoutTimer?.cancel();
  }

  void _startHeartRateMonitoring() {
    _heartRateTimer?.cancel();
    _heartRateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (state.isActive && !state.isPaused) {
        // Simulate heart rate data
        final baseHeartRate = 75;
        final workoutIntensity =
            (state.elapsedTime / 60) * 0.5; // Increases over time
        final randomVariation = (math.Random().nextDouble() - 0.5) * 10;
        final newHeartRate =
            (baseHeartRate + workoutIntensity * 50 + randomVariation).round();

        emit(
          state.copyWith(heartRate: math.max(60, math.min(200, newHeartRate))),
        );
      }
    });
  }

  void _updateProgress() {
    // Calculate progress based on time elapsed vs total duration
    final timeProgress = state.elapsedTime / state.totalDurationSeconds;

    // Also calculate exercise progress as a secondary metric
    final exerciseProgress =
        state.currentExerciseIndex / state.exercises.length;
    final setProgress =
        (state.currentSet - 1) / state.totalSets / state.exercises.length;
    final exerciseBasedProgress = exerciseProgress + setProgress;

    // Use time progress as primary, but ensure we don't go backwards when skipping exercises
    final newProgress = math.max(timeProgress, exerciseBasedProgress);

    emit(state.copyWith(progress: math.min(1.0, newProgress)));
  }

  int _calculateCaloriesBurned() {
    // Simplified calorie calculation
    final timeInMinutes = state.elapsedTime / 60;
    final averageCaloriesPerMinute = 8; // Moderate intensity
    return (timeInMinutes * averageCaloriesPerMinute).round();
  }

  void _stopTimers() {
    _workoutTimer?.cancel();
    _heartRateTimer?.cancel();
  }

  @override
  Future<void> close() {
    _stopTimers();
    return super.close();
  }
}
