import 'package:flutter/material.dart' show Locale;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/locale/l10n.dart';
import '../../../domain/repositories/locale_repository.dart';
import '../base/base_cubit_wrapper.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

@lazySingleton
class LocaleCubit extends BaseCubitWrapper<LocaleState> {
  late LocaleRepository _repository;

  LocaleCubit() : super(const LocaleState()) {
    initialize();
  }

  void initialize() {
    _repository = injector<LocaleRepository>();
    Future.microtask(() async => await _loadSavedLocale());
  }

  /// Load the saved locale from persistent storage
  Future<void> _loadSavedLocale() async {
    try {
      final savedLocale = await _repository.getSavedLocale();

      if (savedLocale != null && _repository.isLocaleSupported(savedLocale)) {
        emit(state.copyWith(locale: savedLocale));
      } else {
        // Use system locale as fallback
        final systemLocale = _repository.getSystemLocale();
        emit(state.copyWith(locale: systemLocale));
        // Save the system locale for future use
        await _repository.saveLocale(systemLocale);
      }
    } catch (e) {
      // If anything fails, use system locale
      final systemLocale = _repository.getSystemLocale();
      emit(state.copyWith(locale: systemLocale));
    }
  }

  /// Set a new locale and persist it
  Future<void> setLocale(Locale locale) async {
    if (!_repository.isLocaleSupported(locale)) {
      throw ArgumentError('Locale $locale is not supported');
    }

    try {
      await _repository.saveLocale(locale);
      emit(state.copyWith(locale: locale));
    } catch (e) {
      // Handle error - could emit an error state or log it
      rethrow;
    }
  }

  /// Reset to system locale
  Future<void> resetToSystemLocale() async {
    final systemLocale = _repository.getSystemLocale();
    await setLocale(systemLocale);
  }

  /// Clear saved locale preferences
  Future<void> clearLocalePreferences() async {
    await _repository.clearLocale();
    await resetToSystemLocale();
  }

  /// Get all supported locales
  List<Locale> get supportedLocales => L10n.supportedLocales;
}
