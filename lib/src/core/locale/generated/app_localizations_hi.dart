// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get hello => 'नमस्ते';

  @override
  String greetUser(Object username) {
    return 'स्वागत है, $username!';
  }

  @override
  String get appTitle => 'Fit Track Pro';

  @override
  String get appDescription => 'आपका व्यक्तिगत फिटनेस ट्रैकर';

  @override
  String get loginButton => 'लॉगिन';

  @override
  String get signUpButton => 'साइन अप';

  @override
  String get logoutButton => 'लॉगआउट';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get profileTitle => 'प्रोफ़ाइल';

  @override
  String get notificationsTitle => 'सूचनाएँ';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get errorNetwork => 'नेटवर्क त्रुटि, कृपया बाद में पुनः प्रयास करें।';

  @override
  String get errorInvalidCredentials => 'अमान्य उपयोगकर्ता नाम या पासवर्ड।';

  @override
  String get errorUserNotFound => 'उपयोगकर्ता नहीं मिला।';

  @override
  String get errorGeneric => 'एक त्रुटि हुई, कृपया पुनः प्रयास करें।';

  @override
  String get localeSettingsTitle => 'भाषा सेटिंग्स';

  @override
  String get localeSettingsDescription => 'ऐप के लिए अपनी पसंदीदा भाषा चुनें।';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get walkthroughTitle1 => 'अपनी फिटनेस ट्रैक करें';

  @override
  String get walkthroughDescription1 =>
      'अपनी दैनिक गतिविधियों, वर्कआउट और स्वास्थ्य मेट्रिक्स को एक ही स्थान पर मॉनिटर करें।';

  @override
  String get walkthroughTitle2 => 'लक्ष्य निर्धारित करें और हासिल करें';

  @override
  String get walkthroughDescription2 =>
      'व्यक्तिगत फिटनेस लक्ष्य बनाएं और स्वस्थ जीवन की दिशा में अपनी प्रगति को ट्रैक करें।';

  @override
  String get walkthroughTitle3 => 'प्रेरित रहें';

  @override
  String get walkthroughDescription3 =>
      'अंतर्दृष्टि प्राप्त करें, रिमाइंडर पाएं और अपनी उपलब्धियों का जश्न मनाएं।';

  @override
  String get skipButton => 'छोड़ें';

  @override
  String get nextButton => 'आगे';

  @override
  String get letsGetStartedButton => 'चलिए शुरू करते हैं';

  @override
  String get finishButton => 'समाप्त';
}
