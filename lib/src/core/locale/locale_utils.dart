import 'package:flutter/material.dart';

import 'l10n.dart';

class LocaleUtils {
  /// Get all supported language codes from L10n
  static List<String> get supportedLanguageCodes => L10n.supportedLanguageCodes;

  /// Check if a language code is supported
  static bool isLanguageSupported(String languageCode) =>
      L10n.isLanguageSupported(languageCode);

  /// Get the display name for a locale
  static String getDisplayName(Locale locale) {
    final localeInfo =
        L10n.getLocaleInfo(locale) ??
        L10n.getLocaleInfoByLanguage(locale.languageCode);

    return localeInfo?.displayName ?? locale.languageCode.toUpperCase();
  }

  /// Get the native display name for a locale
  static String getNativeDisplayName(Locale locale) {
    final localeInfo =
        L10n.getLocaleInfo(locale) ??
        L10n.getLocaleInfoByLanguage(locale.languageCode);

    return localeInfo?.nativeDisplayName ?? locale.languageCode.toUpperCase();
  }

  /// Get all supported locales with their display names
  static Map<Locale, String> getSupportedLocalesWithDisplayNames() {
    final Map<Locale, String> result = {};
    for (final localeInfo in L10n.supportedLocaleInfos) {
      result[localeInfo.locale] = localeInfo.displayName;
    }
    return result;
  }

  /// Get all supported locales with their native display names
  static Map<Locale, String> getSupportedLocalesWithNativeDisplayNames() {
    final Map<Locale, String> result = {};
    for (final localeInfo in L10n.supportedLocaleInfos) {
      result[localeInfo.locale] = localeInfo.nativeDisplayName;
    }
    return result;
  }

  /// Get complete locale information for all supported locales
  static List<LocaleInfo> getAllLocaleInfo() => L10n.supportedLocaleInfos;

  /// Check if a locale is RTL (Right-to-Left)
  static bool isRTL(Locale locale) {
    final localeInfo =
        L10n.getLocaleInfo(locale) ??
        L10n.getLocaleInfoByLanguage(locale.languageCode);

    return localeInfo?.isRTL ?? false;
  }

  /// Get all RTL locales from supported locales
  static List<Locale> getRTLLocales() {
    return L10n.supportedLocaleInfos
        .where((info) => info.isRTL)
        .map((info) => info.locale)
        .toList();
  }

  /// Get all LTR (Left-to-Right) locales from supported locales
  static List<Locale> getLTRLocales() {
    return L10n.supportedLocaleInfos
        .where((info) => !info.isRTL)
        .map((info) => info.locale)
        .toList();
  }

  /// Get the closest supported locale
  static Locale? getClosestSupportedLocale(Locale locale) {
    // First try exact match using L10n's isSupported method
    if (L10n.isSupported(locale)) {
      return locale;
    }

    // Then try language-only match
    for (final supportedLocale in L10n.supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }

    // Return null if no match found
    return null;
  }

  /// Create a locale from language code and optional country code
  /// Only creates locales for supported languages
  static Locale? createLocale(String languageCode, [String? countryCode]) {
    // Check if the language is supported
    if (!L10n.isLanguageSupported(languageCode)) {
      return null;
    }

    return countryCode != null
        ? Locale(languageCode, countryCode)
        : Locale(languageCode);
  }

  /// Create a locale from language code and optional country code (unsafe)
  /// This creates a locale regardless of whether it's supported
  static Locale createLocaleUnsafe(String languageCode, [String? countryCode]) {
    return countryCode != null
        ? Locale(languageCode, countryCode)
        : Locale(languageCode);
  }

  /// Convert locale to string representation
  static String localeToString(Locale locale) {
    return locale.countryCode != null
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
  }

  /// Parse locale from string representation
  /// Only returns supported locales
  static Locale? localeFromString(String localeString) {
    final parts = localeString.split('_');
    if (parts.isEmpty) return null;

    final locale = parts.length == 2
        ? Locale(parts[0], parts[1])
        : Locale(parts[0]);

    // Return the locale only if it's supported or has a supported language
    return getClosestSupportedLocale(locale);
  }

  /// Parse locale from string representation (unsafe)
  /// Returns locale regardless of whether it's supported
  static Locale? localeFromStringUnsafe(String localeString) {
    final parts = localeString.split('_');
    if (parts.isEmpty) return null;

    return parts.length == 2 ? Locale(parts[0], parts[1]) : Locale(parts[0]);
  }
}
