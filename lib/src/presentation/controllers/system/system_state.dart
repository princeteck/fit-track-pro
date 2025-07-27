part of 'system_cubit.dart';

@freezed
abstract class SystemState with _$SystemState {
  const factory SystemState({
    @Default('') String appName,
    @Default('') String appVersion,
    @Default('') String buildNumber,
    @Default(false) bool isLoading,
  }) = _SystemState;
}
