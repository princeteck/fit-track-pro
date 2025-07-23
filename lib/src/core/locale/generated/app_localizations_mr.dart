// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get hello => 'नमस्कार';

  @override
  String greetUser(Object username) {
    return 'स्वागत आहे, $username!';
  }

  @override
  String get appTitle => 'FitTrack Pro';

  @override
  String get appDescription => 'आपला वैयक्तिक फिटनेस ट्रॅकर';

  @override
  String get loginButton => 'लॉगिन';

  @override
  String get signUpButton => 'साइन अप';

  @override
  String get logoutButton => 'लॉगआउट';

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get notificationsTitle => 'सूचनाएँ';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get termsOfService => 'सेवा अटी';

  @override
  String get errorNetwork => 'नेटवर्क त्रुटी, कृपया नंतर पुन्हा प्रयत्न करा.';

  @override
  String get errorInvalidCredentials => 'अवैध वापरकर्ता नाव किंवा पासवर्ड.';

  @override
  String get errorUserNotFound => 'वापरकर्ता सापडला नाही.';

  @override
  String get errorGeneric => 'एक त्रुटी झाली, कृपया पुन्हा प्रयत्न करा.';

  @override
  String get localeSettingsTitle => 'भाषा सेटिंग्ज';

  @override
  String get localeSettingsDescription => 'ऐपसाठी आपली आवडती भाषा निवडा.';

  @override
  String get selectLanguage => 'भाषा निवडा';
}
