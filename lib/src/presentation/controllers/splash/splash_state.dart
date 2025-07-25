part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool showLogo,
    @Default(false) bool showAppName,
    @Default(false) bool isComplete,
    @Default(false) bool dependenciesReady,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
  }) = _SplashState;
}
