import 'dart:io';
import 'package:flutter/material.dart' show Locale;

/// Locale information class to hold metadata about each locale
class LocaleInfo {
  final Locale locale;
  final String displayName;
  final String nativeDisplayName;
  final bool isRTL;

  const LocaleInfo({
    required this.locale,
    required this.displayName,
    required this.nativeDisplayName,
    this.isRTL = false,
  });
}

class L10n {
  /// Comprehensive locale information including display names and RTL info
  static const List<LocaleInfo> _localeInfos = [
    LocaleInfo(
      locale: Locale('en'),
      displayName: 'English',
      nativeDisplayName: 'English',
      isRTL: false,
    ),
    LocaleInfo(
      locale: Locale('mr'),
      displayName: 'Marathi',
      nativeDisplayName: 'मराठी',
      isRTL: false,
    ),
    LocaleInfo(
      locale: Locale('hi'),
      displayName: 'Hindi',
      nativeDisplayName: 'हिन्दी',
      isRTL: false,
    ),
    LocaleInfo(
      locale: Locale('es'),
      displayName: 'Spanish',
      nativeDisplayName: 'Español',
      isRTL: false,
    ),
    // Example of how easy it is to add RTL languages:
    LocaleInfo(
      locale: Locale('ar'),
      displayName: 'Arabic',
      nativeDisplayName: 'العربية',
      isRTL: true,
    ),
    LocaleInfo(
      locale: Locale('gu'),
      displayName: 'Gujarati',
      nativeDisplayName: 'ગુજરાતી',
      isRTL: false,
    ),
    LocaleInfo(
      locale: Locale('de'),
      displayName: 'German',
      nativeDisplayName: 'Deutsch',
      isRTL: false,
    ),
  ];

  /// Get all supported locales (derived from locale infos)
  static List<Locale> get supportedLocales {
    return _localeInfos.map((info) => info.locale).toList();
  }

  /// Get only operational locales (those with .arb files)
  static List<Locale> get operationalLocales {
    return _localeInfos
        .where((info) => _hasArbFile(info.locale))
        .map((info) => info.locale)
        .toList();
  }

  /// Get all locale information
  static List<LocaleInfo> get supportedLocaleInfos => _localeInfos;

  /// Get only operational locale information
  static List<LocaleInfo> get operationalLocaleInfos {
    return _localeInfos.where((info) => _hasArbFile(info.locale)).toList();
  }

  /// Helper method to check if .arb file exists for a locale
  static bool _hasArbFile(Locale locale) {
    try {
      // Use Platform.script to get the location of this file
      // and derive the project root from it
      final scriptUri = Uri.base;
      final projectRoot = scriptUri.toFilePath();

      // Construct the path to the .arb file
      final arbFilePath =
          '$projectRoot/lib/src/core/locale/l10n/app_${locale.languageCode}.arb';
      final arbFile = File(arbFilePath);
      bool result = arbFile.existsSync();
      return result;
    } catch (e) {
      // Fallback: try relative paths from current working directory
      try {
        final possiblePaths = [
          'lib/src/core/locale/l10n/app_${locale.languageCode}.arb',
          './lib/src/core/locale/l10n/app_${locale.languageCode}.arb',
        ];

        for (final relativePath in possiblePaths) {
          final file = File(relativePath);
          if (file.existsSync()) {
            return true;
          }
        }
        return false;
      } catch (e2) {
        return false;
      }
    }
  }

  /// Get locale info for a specific locale
  static LocaleInfo? getLocaleInfo(Locale locale) {
    try {
      return _localeInfos.firstWhere(
        (info) =>
            info.locale.languageCode == locale.languageCode &&
            info.locale.countryCode == locale.countryCode,
      );
    } catch (e) {
      return null;
    }
  }

  /// Get locale info by language code (ignoring country code)
  static LocaleInfo? getLocaleInfoByLanguage(String languageCode) {
    try {
      return _localeInfos.firstWhere(
        (info) => info.locale.languageCode == languageCode,
      );
    } catch (e) {
      return null;
    }
  }

  /// Get the list of supported language codes (only operational)
  static List<String> get supportedLanguageCodes {
    return operationalLocales.map((locale) => locale.languageCode).toList();
  }

  /// Check if a locale is supported
  static bool isSupported(Locale locale) {
    return supportedLocales.any(
      (supportedLocale) =>
          supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode,
    );
  }

  /// Check if a language code is supported (ignoring country code)
  static bool isLanguageSupported(String languageCode) {
    return supportedLocales.any(
      (locale) => locale.languageCode == languageCode,
    );
  }

  /// Check if a locale is operational (has .arb file)
  static bool isOperational(Locale locale) {
    return _hasArbFile(locale);
  }

  /// Check if a language code is operational (has .arb file)
  static bool isLanguageOperational(String languageCode) {
    return _hasArbFile(Locale(languageCode));
  }

  /// Get the default locale (first in the operational locales list)
  static Locale get defaultLocale => operationalLocales.first;

  /// Get the fallback locale for unsupported locales
  static Locale get fallbackLocale => operationalLocales.first;
}
