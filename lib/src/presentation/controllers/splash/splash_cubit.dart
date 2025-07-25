import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../base/base_cubit_wrapper.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@singleton
class SplashCubit extends BaseCubitWrapper<SplashState> {
  Timer? _logoTimer;
  Timer? _appNameTimer;
  Timer? _navigationTimer;

  SplashCubit() : super(const SplashState());

  void initializeSplash() {
    _startAnimationSequence();
    _initializeDependencies();
  }

  void _startAnimationSequence() {
    // Show logo after initial delay
    _logoTimer = Timer(const Duration(milliseconds: 200), () {
      if (!isClosed) {
        emit(state.copyWith(showLogo: true));
      }
    });

    // Show app name after logo with additional delay
    _appNameTimer = Timer(const Duration(milliseconds: 1800), () {
      if (!isClosed) {
        emit(state.copyWith(showAppName: true));
      }
    });

    // Complete splash after full duration AND dependencies are ready
    _navigationTimer = Timer(const Duration(seconds: 4), () {
      _checkAndCompleteIfReady();
    });
  }

  void _checkAndCompleteIfReady() {
    if (!isClosed && state.dependenciesReady && !state.hasError) {
      emit(state.copyWith(isComplete: true));
    } else if (!state.hasError) {
      // If dependencies aren't ready yet, check again in 500ms
      _navigationTimer?.cancel();
      _navigationTimer = Timer(const Duration(milliseconds: 500), () {
        _checkAndCompleteIfReady();
      });
    }
  }

  Future<void> _initializeDependencies() async {
    try {
      showLog('Initializing dependencies...');
      await injector.allReady();

      if (!isClosed) {
        emit(state.copyWith(dependenciesReady: true));
        showLog('Dependencies initialized successfully');
      }
    } catch (e) {
      showLog('Error initializing dependencies: $e');
      if (!isClosed) {
        emit(
          state.copyWith(
            hasError: true,
            errorMessage: 'Failed to initialize dependencies: $e',
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _logoTimer?.cancel();
    _appNameTimer?.cancel();
    _navigationTimer?.cancel();
    return super.close();
  }
}
