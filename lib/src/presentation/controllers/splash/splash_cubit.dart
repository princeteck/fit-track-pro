import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../base/base_cubit_wrapper.dart';
import '../auth/auth_cubit.dart';
import '../../../core/di/di.dart';
import '../../../core/services/app_startup_service.dart';
import '../../../core/services/memory_manager_service.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@singleton
class SplashCubit extends BaseCubitWrapper<SplashState> {
  final AppStartupService _appStartupService;
  final MemoryManagerService _memoryManager;
  Timer? _logoTimer;
  Timer? _appNameTimer;
  Timer? _navigationTimer;

  SplashCubit(this._appStartupService, this._memoryManager)
    : super(const SplashState());

  void initializeSplash() {
    // Start dependencies initialization immediately but asynchronously
    _initializeDependencies();

    // Delay animation sequence to reduce initial load
    Future.delayed(const Duration(milliseconds: 100), () {
      _startAnimationSequence();
    });
  }

  void _startAnimationSequence() {
    // Show logo after initial delay
    _logoTimer = Timer(const Duration(milliseconds: 200), () {
      if (!isClosed) {
        emit(state.copyWith(showLogo: true));
      }
    });
    _memoryManager.registerTimer('splash_logo', _logoTimer!);

    // Show app name after logo with additional delay
    _appNameTimer = Timer(const Duration(milliseconds: 1800), () {
      if (!isClosed) {
        emit(state.copyWith(showAppName: true));
      }
    });
    _memoryManager.registerTimer('splash_app_name', _appNameTimer!);

    // Complete splash after full duration AND dependencies are ready
    _navigationTimer = Timer(const Duration(seconds: 4), () {
      _checkAndCompleteIfReady();
    });
    _memoryManager.registerTimer('splash_navigation', _navigationTimer!);
  }

  void _checkAndCompleteIfReady() {
    if (!isClosed && state.dependenciesReady && !state.hasError) {
      _determineNextRoute();
    } else if (!state.hasError) {
      // If dependencies aren't ready yet, check again in 500ms
      _navigationTimer?.cancel();
      _memoryManager.disposeTimer('splash_navigation');
      _navigationTimer = Timer(const Duration(milliseconds: 500), () {
        _checkAndCompleteIfReady();
      });
      _memoryManager.registerTimer(
        'splash_navigation_retry',
        _navigationTimer!,
      );
    }
  }

  Future<void> _determineNextRoute() async {
    try {
      final result = await _appStartupService.determineInitialRoute();

      // If user has valid authentication, initialize user data in AuthCubit
      if (result == AppStartupResult.dashboard) {
        try {
          locator<AuthCubit>().initializeUserFromStorage();
        } catch (e) {
          // Silent fail - don't prevent navigation if user data loading fails
          showLog('Failed to initialize user data: $e');
        }
      }

      if (!isClosed) {
        emit(state.copyWith(isComplete: true, initialRoute: result));
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            hasError: true,
            errorMessage: 'Failed to determine initial route: $e',
          ),
        );
      }
    }
  }

  Future<void> _initializeDependencies() async {
    try {
      showLog('Initializing dependencies...');

      // Use compute or isolate for heavy initialization to avoid blocking main thread
      await Future.microtask(() async {
        await injector.allReady();
      });

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
    _memoryManager.disposeTimer('splash_logo');
    _memoryManager.disposeTimer('splash_app_name');
    _memoryManager.disposeTimer('splash_navigation');
    _memoryManager.disposeTimer('splash_navigation_retry');
    return super.close();
  }
}
