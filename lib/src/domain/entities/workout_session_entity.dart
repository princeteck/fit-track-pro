import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_session_entity.freezed.dart';
part 'workout_session_entity.g.dart';

@freezed
class WorkoutSessionEntity with _$WorkoutSessionEntity {
  const factory WorkoutSessionEntity({
    required String id,
    required String workoutPlanId,
    required String workoutPlanName,
    required DateTime startTime,
    required DateTime endTime,
    required int durationSeconds,
    required int totalDurationSeconds,
    required int caloriesBurned,
    required double progress,
    required List<WorkoutSensorData> sensorData,
    @Default([]) List<String> exercisesCompleted,
    @Default(0) int setsCompleted,
  }) = _WorkoutSessionEntity;

  factory WorkoutSessionEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionEntityFromJson(json);
}

@freezed
class WorkoutSensorData with _$WorkoutSensorData {
  const factory WorkoutSensorData({
    required DateTime timestamp,
    required int elapsedSeconds,
    required int heartRate,
    required double calories,
    required double progress,
    @Default(false) bool isPaused,
  }) = _WorkoutSensorData;

  factory WorkoutSensorData.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSensorDataFromJson(json);
}
