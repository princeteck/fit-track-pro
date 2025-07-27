import 'package:fittrack_pro/src/presentation/controllers/base/base_cubit_wrapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/app_startup_service.dart';

part 'walkthrough_state.dart';
part 'walkthrough_cubit.freezed.dart';

@singleton
class WalkthroughCubit extends BaseCubitWrapper<WalkthroughState> {
  final AppStartupService _appStartupService;

  WalkthroughCubit(this._appStartupService) : super(const WalkthroughState());

  static const int totalSlides = 3;

  void nextSlide() {
    if (state.currentIndex < totalSlides - 1) {
      final newIndex = state.currentIndex + 1;
      emit(
        state.copyWith(
          currentIndex: newIndex,
          isLastSlide: newIndex == totalSlides - 1,
          backgroundGradientPosition: (newIndex / (totalSlides - 1)),
        ),
      );
    }
  }

  void previousSlide() {
    if (state.currentIndex > 0) {
      final newIndex = state.currentIndex - 1;
      emit(
        state.copyWith(
          currentIndex: newIndex,
          isLastSlide: false,
          backgroundGradientPosition: (newIndex / (totalSlides - 1)),
        ),
      );
    }
  }

  void skipToEnd() {
    emit(
      state.copyWith(
        currentIndex: totalSlides - 1,
        isLastSlide: true,
        hasSkipped: true,
        backgroundGradientPosition: 1.0,
      ),
    );
  }

  void goToSlide(int index) {
    if (index >= 0 && index < totalSlides) {
      emit(
        state.copyWith(
          currentIndex: index,
          isLastSlide: index == totalSlides - 1,
          backgroundGradientPosition: (index / (totalSlides - 1)),
        ),
      );
    }
  }

  void updateGradientPosition(double position) {
    emit(state.copyWith(backgroundGradientPosition: position.clamp(0.0, 1.0)));
  }

  /// Mark onboarding as completed
  Future<void> completeOnboarding() async {
    try {
      await _appStartupService.markOnboardingCompleted();
    } catch (e) {
      // Handle error silently for now
    }
  }
}
