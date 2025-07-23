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
  ];

  /// Get all supported locales (derived from locale infos)
  static List<Locale> get supportedLocales {
    return _localeInfos.map((info) => info.locale).toList();
  }

  /// Get all locale information
  static List<LocaleInfo> get supportedLocaleInfos => _localeInfos;

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

  /// Get the list of supported language codes
  static List<String> get supportedLanguageCodes {
    return supportedLocales.map((locale) => locale.languageCode).toList();
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

  /// Get the default locale (first in the supported locales list)
  static Locale get defaultLocale => supportedLocales.first;

  /// Get the fallback locale for unsupported locales
  static Locale get fallbackLocale => supportedLocales.first;
}
