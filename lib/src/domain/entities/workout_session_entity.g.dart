// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSessionEntityImpl _$$WorkoutSessionEntityImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutSessionEntityImpl(
  id: json['id'] as String,
  workoutPlanId: json['workoutPlanId'] as String,
  workoutPlanName: json['workoutPlanName'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  totalDurationSeconds: (json['totalDurationSeconds'] as num).toInt(),
  caloriesBurned: (json['caloriesBurned'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  sensorData: (json['sensorData'] as List<dynamic>)
      .map((e) => WorkoutSensorData.fromJson(e as Map<String, dynamic>))
      .toList(),
  exercisesCompleted:
      (json['exercisesCompleted'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  setsCompleted: (json['setsCompleted'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$WorkoutSessionEntityImplToJson(
  _$WorkoutSessionEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'workoutPlanId': instance.workoutPlanId,
  'workoutPlanName': instance.workoutPlanName,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime.toIso8601String(),
  'durationSeconds': instance.durationSeconds,
  'totalDurationSeconds': instance.totalDurationSeconds,
  'caloriesBurned': instance.caloriesBurned,
  'progress': instance.progress,
  'sensorData': instance.sensorData,
  'exercisesCompleted': instance.exercisesCompleted,
  'setsCompleted': instance.setsCompleted,
};

_$WorkoutSensorDataImpl _$$WorkoutSensorDataImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutSensorDataImpl(
  timestamp: DateTime.parse(json['timestamp'] as String),
  elapsedSeconds: (json['elapsedSeconds'] as num).toInt(),
  heartRate: (json['heartRate'] as num).toInt(),
  calories: (json['calories'] as num).toDouble(),
  progress: (json['progress'] as num).toDouble(),
  isPaused: json['isPaused'] as bool? ?? false,
);

Map<String, dynamic> _$$WorkoutSensorDataImplToJson(
  _$WorkoutSensorDataImpl instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp.toIso8601String(),
  'elapsedSeconds': instance.elapsedSeconds,
  'heartRate': instance.heartRate,
  'calories': instance.calories,
  'progress': instance.progress,
  'isPaused': instance.isPaused,
};
