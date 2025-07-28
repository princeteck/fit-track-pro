import 'package:freezed_annotation/freezed_annotation.dart';

part 'heart_rate.freezed.dart';

enum HeartRateType {
  @JsonValue('resting')
  resting,
  @JsonValue('active')
  active,
  @JsonValue('exercise')
  exercise,
  @JsonValue('recovery')
  recovery,
}

@freezed
class HeartRate with _$HeartRate {
  const factory HeartRate({
    required String id,
    required String userId,
    required int bpm,
    required DateTime timestamp,
    @Default(HeartRateType.resting) HeartRateType type,
    String? notes,
    required DateTime createdAt,
    DateTime? updatedAt,
    // Session-based monitoring data
    String? sessionId,
    int? sessionDurationSeconds,
    @Default([]) List<HeartRateReading> readings,
  }) = _HeartRate;
}

@freezed
class HeartRateReading with _$HeartRateReading {
  const factory HeartRateReading({
    required int bpm,
    required DateTime timestamp,
    required double intervalMs,
  }) = _HeartRateReading;
}

@freezed
class HeartRateSession with _$HeartRateSession {
  const factory HeartRateSession({
    required String id,
    required String userId,
    required HeartRateType type,
    required DateTime startTime,
    DateTime? endTime,
    required int durationSeconds,
    @Default([]) List<HeartRateReading> readings,
    int? averageBpm,
    int? minBpm,
    int? maxBpm,
    String? notes,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _HeartRateSession;

  const HeartRateSession._();

  bool get isOngoing => endTime == null;
  Duration get sessionDuration => Duration(seconds: durationSeconds);
}

@freezed
class HeartRateStats with _$HeartRateStats {
  const factory HeartRateStats({
    required double averageBpm,
    required int minBpm,
    required int maxBpm,
    int? restingBpm,
    required CustomDateTimeRange dateRange,
    required int readingsCount,
  }) = _HeartRateStats;
}

@freezed
class CustomDateTimeRange with _$CustomDateTimeRange {
  const factory CustomDateTimeRange({
    required DateTime start,
    required DateTime end,
  }) = _CustomDateTimeRange;

  const CustomDateTimeRange._();

  Duration get duration => end.difference(start);

  bool contains(DateTime dateTime) {
    return dateTime.isAfter(start) && dateTime.isBefore(end);
  }
}

enum HeartRateTimeRange {
  oneDay('1 Day'),
  oneWeek('1 Week'),
  oneMonth('1 Month'),
  threeMonths('3 Months'),
  sixMonths('6 Months'),
  twelveMonths('12 Months');

  const HeartRateTimeRange(this.label);

  final String label;

  CustomDateTimeRange get dateRange {
    final now = DateTime.now();
    switch (this) {
      case HeartRateTimeRange.oneDay:
        return CustomDateTimeRange(
          start: DateTime(now.year, now.month, now.day),
          end: now,
        );
      case HeartRateTimeRange.oneWeek:
        return CustomDateTimeRange(
          start: now.subtract(const Duration(days: 7)),
          end: now,
        );
      case HeartRateTimeRange.oneMonth:
        return CustomDateTimeRange(
          start: DateTime(now.year, now.month - 1, now.day),
          end: now,
        );
      case HeartRateTimeRange.threeMonths:
        return CustomDateTimeRange(
          start: DateTime(now.year, now.month - 3, now.day),
          end: now,
        );
      case HeartRateTimeRange.sixMonths:
        return CustomDateTimeRange(
          start: DateTime(now.year, now.month - 6, now.day),
          end: now,
        );
      case HeartRateTimeRange.twelveMonths:
        return CustomDateTimeRange(
          start: DateTime(now.year - 1, now.month, now.day),
          end: now,
        );
    }
  }
}
