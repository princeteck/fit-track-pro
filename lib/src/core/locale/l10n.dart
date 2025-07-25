import 'dart:io';
import 'package:flutter/widgets.dart';

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

  /// Cache for ARB file existence checks to avoid repeated file system operations
  static final Map<String, bool> _arbFileCache = {};

  /// Flag to track if cache has been initialized
  static bool _cacheInitialized = false;

  /// Get all supported locales (derived from locale infos)
  static List<Locale> get supportedLocales {
    return _localeInfos.map((info) => info.locale).toList();
  }

  /// Initialize the cache by checking all locales asynchronously
  static Future<void> _initializeCache() async {
    if (_cacheInitialized) return;

    final futures = _localeInfos.map((info) async {
      final hasFile = await _hasArbFileAsync(info.locale);
      _arbFileCache[info.locale.languageCode] = hasFile;
    });

    await Future.wait(futures);
    _cacheInitialized = true;
  }

  /// Get only operational locales (those with .arb files) - async version
  static Future<List<Locale>> getOperationalLocales() async {
    await _initializeCache();
    return _localeInfos
        .where((info) => _arbFileCache[info.locale.languageCode] == true)
        .map((info) => info.locale)
        .toList();
  }

  /// Get only operational locales synchronously using cache (for backward compatibility)
  /// This should only be called after initialization
  static List<Locale> get operationalLocales {
    if (!_cacheInitialized) {
      debugPrint(
        'Warning: L10n cache not initialized. Consider using getOperationalLocales() instead.',
      );
      // Fallback to synchronous check for backward compatibility
      return _localeInfos
          .where((info) => _hasArbFileSync(info.locale))
          .map((info) => info.locale)
          .toList();
    }
    return _localeInfos
        .where((info) => _arbFileCache[info.locale.languageCode] == true)
        .map((info) => info.locale)
        .toList();
  }

  /// Get all locale information
  static List<LocaleInfo> get supportedLocaleInfos => _localeInfos;

  /// Get only operational locale information - async version
  static Future<List<LocaleInfo>> getOperationalLocaleInfos() async {
    await _initializeCache();
    return _localeInfos
        .where((info) => _arbFileCache[info.locale.languageCode] == true)
        .toList();
  }

  /// Get only operational locale information synchronously using cache
  static List<LocaleInfo> get operationalLocaleInfos {
    if (!_cacheInitialized) {
      debugPrint(
        'Warning: L10n cache not initialized. Consider using getOperationalLocaleInfos() instead.',
      );
      return _localeInfos
          .where((info) => _hasArbFileSync(info.locale))
          .toList();
    }
    return _localeInfos
        .where((info) => _arbFileCache[info.locale.languageCode] == true)
        .toList();
  }

  /// Asynchronous helper method to check if .arb file exists for a locale
  static Future<bool> _hasArbFileAsync(Locale locale) async {
    try {
      // Use Platform.script to get the location of this file
      // and derive the project root from it
      final scriptUri = Uri.base;
      final projectRoot = scriptUri.toFilePath();

      // Construct the path to the .arb file
      final arbFilePath =
          '$projectRoot/lib/src/core/locale/l10n/app_${locale.languageCode}.arb';
      final arbFile = File(arbFilePath);
      bool result = await arbFile.exists();
      return result;
    } catch (e) {
      // Fallback: try relative paths from current working directory
      try {
        const basePath = String.fromEnvironment(
          'ARB_BASE_PATH',
          defaultValue: 'lib/src/core/locale/l10n',
        );
        final relativePath = '$basePath/app_${locale.languageCode}.arb';

        final file = File(relativePath);
        return await file.exists();
      } catch (e2) {
        debugPrint('Error checking ARB file for locale $locale: $e2');
        return false;
      }
    }
  }

  /// Synchronous helper method to check if .arb file exists for a locale (for backward compatibility)
  static bool _hasArbFileSync(Locale locale) {
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
        const basePath = String.fromEnvironment(
          'ARB_BASE_PATH',
          defaultValue: 'lib/src/core/locale/l10n',
        );
        final relativePath = '$basePath/app_${locale.languageCode}.arb';

        final file = File(relativePath);
        if (file.existsSync()) {
          return true;
        }
        return false;
      } catch (e2) {
        debugPrint('Error checking ARB file for locale $locale: $e2');
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

  /// Get the list of supported language codes (only operational) - async version
  static Future<List<String>> getSupportedLanguageCodes() async {
    final locales = await getOperationalLocales();
    return locales.map((locale) => locale.languageCode).toList();
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

  /// Check if a locale is operational (has .arb file) - async version
  static Future<bool> isOperationalAsync(Locale locale) async {
    await _initializeCache();
    return _arbFileCache[locale.languageCode] == true;
  }

  /// Check if a locale is operational (has .arb file) - sync version using cache
  static bool isOperational(Locale locale) {
    if (!_cacheInitialized) {
      debugPrint(
        'Warning: L10n cache not initialized. Consider using isOperationalAsync() instead.',
      );
      return _hasArbFileSync(locale);
    }
    return _arbFileCache[locale.languageCode] == true;
  }

  /// Check if a language code is operational (has .arb file) - async version
  static Future<bool> isLanguageOperationalAsync(String languageCode) async {
    return await isOperationalAsync(Locale(languageCode));
  }

  /// Check if a language code is operational (has .arb file) - sync version using cache
  static bool isLanguageOperational(String languageCode) {
    return isOperational(Locale(languageCode));
  }

  /// Initialize L10n by checking all ARB files asynchronously
  /// Call this during app initialization for better performance
  static Future<void> initialize() async {
    await _initializeCache();
  }

  /// Get the default locale (first in the operational locales list) - async version
  static Future<Locale> getDefaultLocale() async {
    final locales = await getOperationalLocales();
    return locales.isNotEmpty ? locales.first : const Locale('en');
  }

  /// Get the default locale (first in the operational locales list) - sync version
  static Locale get defaultLocale {
    final locales = operationalLocales;
    return locales.isNotEmpty ? locales.first : const Locale('en');
  }

  /// Get the fallback locale for unsupported locales - async version
  static Future<Locale> getFallbackLocale() async {
    return await getDefaultLocale();
  }

  /// Get the fallback locale for unsupported locales - sync version
  static Locale get fallbackLocale => defaultLocale;

  /// Clear the cache (useful for testing or if file system changes)
  static void clearCache() {
    _arbFileCache.clear();
    _cacheInitialized = false;
  }
}
