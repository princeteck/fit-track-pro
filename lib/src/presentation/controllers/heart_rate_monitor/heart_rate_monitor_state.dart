part of 'heart_rate_monitor_cubit.dart';

@freezed
class HeartRateMonitorState with _$HeartRateMonitorState {
  const factory HeartRateMonitorState.initial() = HeartRateMonitorStateInitial;

  const factory HeartRateMonitorState.typeSelected({
    required HeartRateType type,
  }) = HeartRateMonitorStateTypeSelected;

  const factory HeartRateMonitorState.durationSelected({
    required int durationSeconds,
    required HeartRateType type,
  }) = HeartRateMonitorStateDurationSelected;

  const factory HeartRateMonitorState.monitoring({
    required String sessionId,
    required HeartRateType type,
    required int durationSeconds,
    required List<HeartRateReading> readings,
    required int remainingSeconds,
    required double progress, // 0.0 to 1.0
  }) = HeartRateMonitorStateMonitoring;

  const factory HeartRateMonitorState.completed({
    required String sessionId,
    required HeartRateType type,
    required List<HeartRateReading> readings,
    required int averageBpm,
  }) = HeartRateMonitorStateCompleted;

  const factory HeartRateMonitorState.error({required String message}) =
      HeartRateMonitorStateError;
}

extension HeartRateMonitorStateX on HeartRateMonitorState {
  bool get isInitial => this is HeartRateMonitorStateInitial;
  bool get isTypeSelected => this is HeartRateMonitorStateTypeSelected;
  bool get isDurationSelected => this is HeartRateMonitorStateDurationSelected;
  bool get isMonitoring => this is HeartRateMonitorStateMonitoring;
  bool get isCompleted => this is HeartRateMonitorStateCompleted;
  bool get isError => this is HeartRateMonitorStateError;

  HeartRateType? get selectedType => maybeWhen(
    typeSelected: (type) => type,
    durationSelected: (_, type) => type,
    monitoring: (_, type, __, ___, ____, _____) => type,
    completed: (_, type, __, ___) => type,
    orElse: () => null,
  );

  int? get selectedDuration => maybeWhen(
    durationSelected: (duration, _) => duration,
    monitoring: (_, __, duration, ___, ____, _____) => duration,
    orElse: () => null,
  );

  List<HeartRateReading> get readings => maybeWhen(
    monitoring: (_, __, ___, readings, ____, _____) => readings,
    completed: (_, __, readings, ___) => readings,
    orElse: () => <HeartRateReading>[],
  );

  double get progress => maybeWhen(
    monitoring: (_, __, ___, ____, _____, progress) => progress,
    orElse: () => 0.0,
  );

  int get remainingSeconds => maybeWhen(
    monitoring: (_, __, ___, ____, remaining, _____) => remaining,
    orElse: () => 0,
  );
}
