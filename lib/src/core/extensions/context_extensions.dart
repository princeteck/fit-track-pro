import 'package:flutter/material.dart';

import '../locale/generated/app_localizations.dart';

/// Extension on BuildContext to provide easy access to common context-dependent objects
extension ContextExtensions on BuildContext {
  /// Easy access to AppLocalizations
  AppLocalizations? get l10n => AppLocalizations.of(this);

  /// return bool if l10n is RTL or not
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}
