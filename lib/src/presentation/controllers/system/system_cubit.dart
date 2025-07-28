import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../domain/entities/theme_mode_enum.dart';
import '../../../domain/repositories/theme_repository.dart';
import '../base/base_cubit_wrapper.dart';

part 'system_state.dart';
part 'system_cubit.freezed.dart';

@singleton
class SystemCubit extends BaseCubitWrapper<SystemState> {
  ThemeRepository? _themeRepository;

  SystemCubit() : super(const SystemState()) {
    initialize();
  }

  void initialize() {
    _loadAppInfo();
    // Don't load theme during initialization - it will be loaded later
  }

  /// Initialize theme after all dependencies are ready
  Future<void> initializeTheme() async {
    await _loadSavedTheme();
  }

  ThemeRepository get _getThemeRepository {
    _themeRepository ??= injector<ThemeRepository>();
    return _themeRepository!;
  }

  Future<void> init({required BuildContext context}) async {}

  Future<void> _loadAppInfo() async {
    emit(state.copyWith(isLoading: true));

    try {
      final packageInfo = await PackageInfo.fromPlatform();

      emit(
        state.copyWith(
          appName: packageInfo.appName,
          appVersion: packageInfo.version,
          buildNumber: packageInfo.buildNumber,
          isLoading: false,
        ),
      );
    } catch (e) {
      // Fallback values if package info fails to load
      emit(
        state.copyWith(
          appName: 'Fit Track Pro',
          appVersion: '0.0.1',
          buildNumber: '1',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _loadSavedTheme() async {
    try {
      final savedTheme = await _getThemeRepository.getSavedThemeMode();

      final effectiveTheme = savedTheme != null
          ? (savedTheme == AppThemeMode.system
                ? _getThemeRepository.getSystemThemeMode()
                : savedTheme)
          : AppThemeMode.system;

      emit(
        state.copyWith(
          themeMode: savedTheme ?? AppThemeMode.system,
          currentEffectiveTheme: effectiveTheme,
        ),
      );

      if (savedTheme == null) {
        final systemTheme = _getThemeRepository.getSystemThemeMode();
        await _getThemeRepository.saveThemeMode(AppThemeMode.system);
        emit(
          state.copyWith(
            themeMode: AppThemeMode.system,
            currentEffectiveTheme: systemTheme,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error loading saved theme: $e');
      final systemTheme = _getThemeRepository.getSystemThemeMode();
      emit(
        state.copyWith(
          themeMode: AppThemeMode.system,
          currentEffectiveTheme: systemTheme,
        ),
      );
    }
  }

  /// Set theme mode and persist it
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    try {
      await _getThemeRepository.saveThemeMode(themeMode);

      final effectiveTheme = themeMode == AppThemeMode.system
          ? _getThemeRepository.getSystemThemeMode()
          : themeMode;

      emit(
        state.copyWith(
          themeMode: themeMode,
          currentEffectiveTheme: effectiveTheme,
        ),
      );
    } catch (e) {
      debugPrint('Error setting theme mode: $e');
    }
  }

  /// Update effective theme when system theme changes
  void updateSystemTheme() {
    if (state.themeMode == AppThemeMode.system) {
      final systemTheme = _getThemeRepository.getSystemThemeMode();
      emit(state.copyWith(currentEffectiveTheme: systemTheme));
    }
  }

  /// Get current theme mode display name
  String get currentThemeDisplayName {
    return state.themeMode.displayName;
  }

  String get appDisplayVersion {
    if (state.appName.isEmpty || state.appVersion.isEmpty) {
      return 'Fit Track Pro v0.0.1';
    }
    return '${state.appName} v${state.appVersion}';
  }
}
