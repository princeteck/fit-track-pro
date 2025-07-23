import 'dart:ui' as ui;

import 'package:fittrack_pro/src/core/di/di.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:injectable/injectable.dart';

import '../../core/locale/l10n.dart';
import '../../core/storage/local_storage.dart';
import '../../domain/repositories/locale_repository.dart';

@Injectable(as: LocaleRepository)
class LocaleRepositoryImpl implements LocaleRepository {
  static const String _localeKey = 'app_locale';

  LocaleRepositoryImpl();

  @override
  Future<Locale?> getSavedLocale() async {
    final localeCode = await locator<LocalStorage>().read(_localeKey);

    if (localeCode != null) {
      final parts = localeCode.split('_');
      if (parts.length == 2) {
        return Locale(parts[0], parts[1]);
      } else {
        return Locale(parts[0]);
      }
    }

    return null;
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    final localeCode = locale.countryCode != null
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
    await locator<LocalStorage>().write(_localeKey, localeCode);
  }

  @override
  Future<void> clearLocale() async {
    await locator<LocalStorage>().delete(_localeKey);
  }

  @override
  Locale getSystemLocale() {
    final systemLocale = ui.PlatformDispatcher.instance.locale;

    // Check if system locale is supported, otherwise return default
    if (isLocaleSupported(systemLocale)) {
      return systemLocale;
    }

    // Check if the language code is supported (without country code)
    final languageOnlyLocale = Locale(systemLocale.languageCode);
    if (isLocaleSupported(languageOnlyLocale)) {
      return languageOnlyLocale;
    }

    // Return default locale (first in supported list)
    return L10n.supportedLocales.first;
  }

  @override
  bool isLocaleSupported(Locale locale) {
    return L10n.supportedLocales.any(
      (supportedLocale) =>
          supportedLocale.languageCode == locale.languageCode &&
          (supportedLocale.countryCode == locale.countryCode ||
              supportedLocale.countryCode == null),
    );
  }
}
