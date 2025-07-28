import '../entities/theme_mode_enum.dart';

abstract class ThemeRepository {
  /// Get the saved theme mode from persistent storage
  Future<AppThemeMode?> getSavedThemeMode();

  /// Save the theme mode to persistent storage
  Future<void> saveThemeMode(AppThemeMode themeMode);

  /// Clear the saved theme mode
  Future<void> clearThemeMode();

  /// Get the system default theme mode
  AppThemeMode getSystemThemeMode();
}
