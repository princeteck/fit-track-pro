import 'dart:ui' as ui;

import 'package:flutter/material.dart' show Brightness;
import 'package:injectable/injectable.dart';

import '../../core/di/di.dart';
import '../../core/storage/local_storage.dart';
import '../../domain/entities/theme_mode_enum.dart';
import '../../domain/repositories/theme_repository.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  static const String _themeKey = 'app_theme_mode';

  ThemeRepositoryImpl();

  @override
  Future<AppThemeMode?> getSavedThemeMode() async {
    final themeString = await locator<LocalStorage>().read(_themeKey);

    if (themeString != null) {
      return AppThemeMode.fromString(themeString);
    }

    return null;
  }

  @override
  Future<void> saveThemeMode(AppThemeMode themeMode) async {
    await locator<LocalStorage>().write(_themeKey, themeMode.toString());
  }

  @override
  Future<void> clearThemeMode() async {
    await locator<LocalStorage>().delete(_themeKey);
  }

  @override
  AppThemeMode getSystemThemeMode() {
    final systemBrightness = ui.PlatformDispatcher.instance.platformBrightness;

    return systemBrightness == Brightness.dark
        ? AppThemeMode.dark
        : AppThemeMode.light;
  }
}
