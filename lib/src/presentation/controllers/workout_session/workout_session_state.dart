part of 'workout_session_cubit.dart';

@freezed
class WorkoutSessionState with _$WorkoutSessionState {
  const factory WorkoutSessionState({
    @Default(false) bool isActive,
    @Default(false) bool isPaused,
    @Default(false) bool isSessionComplete,
    @Default(0) int elapsedTime,
    @Default(1800) int totalDurationSeconds, // Default 30 minutes
    @Default(0) int heartRate,
    @Default(0) int caloriesBurned,
    @Default(0.0) double progress,
    @Default(0) int currentExerciseIndex,
    @Default(1) int currentSet,
    @Default(3) int totalSets,
    @Default(['Push-ups', 'Squats', 'Planks', 'Jumping Jacks', 'Burpees'])
    List<String> exercises,
    DateTime? startTime,
    DateTime? endTime,
  }) = _WorkoutSessionState;
}

extension WorkoutSessionStateExtension on WorkoutSessionState {
  String get currentExercise {
    if (currentExerciseIndex < exercises.length) {
      return exercises[currentExerciseIndex];
    }
    return 'Workout Complete';
  }
}
