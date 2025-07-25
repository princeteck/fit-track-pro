part of 'walkthrough_cubit.dart';

@freezed
class WalkthroughState with _$WalkthroughState {
  const factory WalkthroughState({
    @Default(0) int currentIndex,
    @Default(false) bool isLastSlide,
    @Default(false) bool hasSkipped,
    @Default(0.0) double backgroundGradientPosition,
  }) = _WalkthroughState;
}
