// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeartRateModelImpl _$$HeartRateModelImplFromJson(Map<String, dynamic> json) =>
    _$HeartRateModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      bpm: (json['bpm'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      type:
          $enumDecodeNullable(_$HeartRateTypeEnumMap, json['type']) ??
          HeartRateType.resting,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      sessionId: json['sessionId'] as String?,
      sessionDurationSeconds: (json['sessionDurationSeconds'] as num?)?.toInt(),
      readings:
          (json['readings'] as List<dynamic>?)
              ?.map((e) => HeartRateReading.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chartData:
          (json['chartData'] as List<dynamic>?)
              ?.map((e) => ChartDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HeartRateModelImplToJson(
  _$HeartRateModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'bpm': instance.bpm,
  'timestamp': instance.timestamp.toIso8601String(),
  'type': _$HeartRateTypeEnumMap[instance.type]!,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'sessionId': instance.sessionId,
  'sessionDurationSeconds': instance.sessionDurationSeconds,
  'readings': instance.readings,
  'chartData': instance.chartData,
};

const _$HeartRateTypeEnumMap = {
  HeartRateType.resting: 'resting',
  HeartRateType.active: 'active',
  HeartRateType.exercise: 'exercise',
  HeartRateType.recovery: 'recovery',
};

_$HeartRateReadingImpl _$$HeartRateReadingImplFromJson(
  Map<String, dynamic> json,
) => _$HeartRateReadingImpl(
  bpm: (json['bpm'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  intervalMs: (json['intervalMs'] as num).toDouble(),
);

Map<String, dynamic> _$$HeartRateReadingImplToJson(
  _$HeartRateReadingImpl instance,
) => <String, dynamic>{
  'bpm': instance.bpm,
  'timestamp': instance.timestamp.toIso8601String(),
  'intervalMs': instance.intervalMs,
};

_$ChartDataPointImpl _$$ChartDataPointImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataPointImpl(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$ChartDataPointImplToJson(
  _$ChartDataPointImpl instance,
) => <String, dynamic>{'x': instance.x, 'y': instance.y};

_$HeartRateSessionImpl _$$HeartRateSessionImplFromJson(
  Map<String, dynamic> json,
) => _$HeartRateSessionImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  type: $enumDecode(_$HeartRateTypeEnumMap, json['type']),
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: json['endTime'] == null
      ? null
      : DateTime.parse(json['endTime'] as String),
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  readings:
      (json['readings'] as List<dynamic>?)
          ?.map((e) => HeartRateReading.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  averageBpm: (json['averageBpm'] as num?)?.toInt(),
  minBpm: (json['minBpm'] as num?)?.toInt(),
  maxBpm: (json['maxBpm'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$HeartRateSessionImplToJson(
  _$HeartRateSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'type': _$HeartRateTypeEnumMap[instance.type]!,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime?.toIso8601String(),
  'durationSeconds': instance.durationSeconds,
  'readings': instance.readings,
  'averageBpm': instance.averageBpm,
  'minBpm': instance.minBpm,
  'maxBpm': instance.maxBpm,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_$HeartRateStatsModelImpl _$$HeartRateStatsModelImplFromJson(
  Map<String, dynamic> json,
) => _$HeartRateStatsModelImpl(
  averageBpm: (json['averageBpm'] as num).toDouble(),
  minBpm: (json['minBpm'] as num).toInt(),
  maxBpm: (json['maxBpm'] as num).toInt(),
  restingBpm: (json['restingBpm'] as num?)?.toInt(),
  dateRange: CustomDateTimeRange.fromJson(
    json['dateRange'] as Map<String, dynamic>,
  ),
  readingsCount: (json['readingsCount'] as num).toInt(),
);

Map<String, dynamic> _$$HeartRateStatsModelImplToJson(
  _$HeartRateStatsModelImpl instance,
) => <String, dynamic>{
  'averageBpm': instance.averageBpm,
  'minBpm': instance.minBpm,
  'maxBpm': instance.maxBpm,
  'restingBpm': instance.restingBpm,
  'dateRange': instance.dateRange,
  'readingsCount': instance.readingsCount,
};

_$CustomDateTimeRangeImpl _$$CustomDateTimeRangeImplFromJson(
  Map<String, dynamic> json,
) => _$CustomDateTimeRangeImpl(
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
  type: json['type'] as String? ?? 'custom',
);

Map<String, dynamic> _$$CustomDateTimeRangeImplToJson(
  _$CustomDateTimeRangeImpl instance,
) => <String, dynamic>{
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
  'type': instance.type,
};
