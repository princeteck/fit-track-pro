import 'package:flutter/material.dart' show Locale;

abstract class LocaleRepository {
  /// Get the saved locale from persistent storage
  Future<Locale?> getSavedLocale();

  /// Save the locale to persistent storage
  Future<void> saveLocale(Locale locale);

  /// Clear the saved locale
  Future<void> clearLocale();

  /// Get the system default locale
  Locale getSystemLocale();

  /// Validate if the given locale is supported
  bool isLocaleSupported(Locale locale);
}
