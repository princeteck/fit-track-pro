import 'package:freezed_annotation/freezed_annotation.dart';

part 'heart_rate_model.freezed.dart';
part 'heart_rate_model.g.dart';

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
class HeartRateModel with _$HeartRateModel {
  const factory HeartRateModel({
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
    // Chart data for visualization
    @Default([]) List<ChartDataPoint> chartData,
  }) = _HeartRateModel;

  factory HeartRateModel.fromJson(Map<String, dynamic> json) =>
      _$HeartRateModelFromJson(json);
}

@freezed
class HeartRateReading with _$HeartRateReading {
  const factory HeartRateReading({
    required int bpm,
    required DateTime timestamp,
    required double intervalMs, // Interval between this and previous reading
  }) = _HeartRateReading;

  factory HeartRateReading.fromJson(Map<String, dynamic> json) =>
      _$HeartRateReadingFromJson(json);
}

@freezed
class ChartDataPoint with _$ChartDataPoint {
  const factory ChartDataPoint({
    required double x, // Time in seconds from session start
    required double y, // BPM value
  }) = _ChartDataPoint;

  factory ChartDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ChartDataPointFromJson(json);
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

  factory HeartRateSession.fromJson(Map<String, dynamic> json) =>
      _$HeartRateSessionFromJson(json);

  const HeartRateSession._();

  List<ChartDataPoint> get chartData {
    return readings.asMap().entries.map((entry) {
      final index = entry.key;
      final reading = entry.value;
      final timeInSeconds = index * (reading.intervalMs / 1000);
      return ChartDataPoint(x: timeInSeconds, y: reading.bpm.toDouble());
    }).toList();
  }

  bool get isOngoing => endTime == null;

  Duration get sessionDuration => Duration(seconds: durationSeconds);
}

@freezed
class HeartRateStatsModel with _$HeartRateStatsModel {
  const factory HeartRateStatsModel({
    required double averageBpm,
    required int minBpm,
    required int maxBpm,
    int? restingBpm,
    required CustomDateTimeRange dateRange,
    required int readingsCount,
  }) = _HeartRateStatsModel;

  factory HeartRateStatsModel.fromJson(Map<String, dynamic> json) =>
      _$HeartRateStatsModelFromJson(json);
}

@freezed
class CustomDateTimeRange with _$CustomDateTimeRange {
  const factory CustomDateTimeRange({
    required DateTime start,
    required DateTime end,
    @Default('custom') String type,
  }) = _CustomDateTimeRange;

  factory CustomDateTimeRange.fromJson(Map<String, dynamic> json) =>
      _$CustomDateTimeRangeFromJson(json);

  const CustomDateTimeRange._();

  Duration get duration => end.difference(start);

  bool contains(DateTime dateTime) {
    return dateTime.isAfter(start) && dateTime.isBefore(end);
  }

  // Factory constructors for common time ranges
  factory CustomDateTimeRange.day() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));
    return CustomDateTimeRange(start: start, end: end, type: 'day');
  }

  factory CustomDateTimeRange.week() {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeek = DateTime(start.year, start.month, start.day);
    final end = startOfWeek.add(const Duration(days: 7));
    return CustomDateTimeRange(start: startOfWeek, end: end, type: 'week');
  }

  factory CustomDateTimeRange.month() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 1);
    return CustomDateTimeRange(start: start, end: end, type: 'month');
  }

  factory CustomDateTimeRange.threeMonths() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month - 2, 1);
    final end = DateTime(now.year, now.month + 1, 1);
    return CustomDateTimeRange(start: start, end: end, type: 'threeMonths');
  }

  factory CustomDateTimeRange.sixMonths() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month - 5, 1);
    final end = DateTime(now.year, now.month + 1, 1);
    return CustomDateTimeRange(start: start, end: end, type: 'sixMonths');
  }

  factory CustomDateTimeRange.year() {
    final now = DateTime.now();
    final start = DateTime(now.year - 1, now.month, now.day);
    final end = DateTime(now.year, now.month, now.day);
    return CustomDateTimeRange(start: start, end: end, type: 'year');
  }
}
