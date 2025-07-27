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
  String get appTitle => 'Fit Track Pro';

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

  @override
  String get walkthroughTitle1 => 'तुमचे फिटनेस ट्रॅक करा';

  @override
  String get walkthroughDescription1 =>
      'तुमच्या दैनंदिन क्रियाकलाप, व्यायाम आणि आरोग्य मेट्रिक्स एकाच ठिकाणी मॉनिटर करा.';

  @override
  String get walkthroughTitle2 => 'ध्येय ठरवा आणि साध्य करा';

  @override
  String get walkthroughDescription2 =>
      'वैयक्तिक फिटनेस ध्येये तयार करा आणि निरोगी तुमच्या दिशेने प्रगती ट्रॅक करा.';

  @override
  String get walkthroughTitle3 => 'प्रेरित राहा';

  @override
  String get walkthroughDescription3 =>
      'अंतर्दृष्टी मिळवा, स्मरणपत्रे घ्या आणि तुमच्या यशाचा उत्सव साजरा करा.';

  @override
  String get skipButton => 'वगळा';

  @override
  String get nextButton => 'पुढे';

  @override
  String get letsGetStartedButton => 'चला सुरुवात करूया';

  @override
  String get finishButton => 'समाप्त';

  @override
  String get forgotPasswordTitle => 'पासवर्ड विसरलात?';

  @override
  String get forgotPasswordSubtitle =>
      'तुमचा ईमेल पत्ता टाका आणि आम्ही तुम्हाला तुमचा पासवर्ड रीसेट करण्यासाठी एक लिंक पाठवू';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get emailHint => 'तुमचा ईमेल पत्ता टाका';

  @override
  String get emailRequired => 'ईमेल आवश्यक आहे';

  @override
  String get emailInvalid => 'कृपया वैध ईमेल टाका';

  @override
  String get sendResetLinkButton => 'रीसेट लिंक पाठवा';

  @override
  String get backToSignInButton => 'साइन इन वर परत जा';

  @override
  String get passwordResetEmailSent =>
      'पासवर्ड रीसेट ईमेल पाठवला! तुमचा इनबॉक्स तपासा.';

  @override
  String get passwordResetEmailFailed => 'रीसेट ईमेल पाठवण्यात अयशस्वी';

  @override
  String get welcomeBackTitle => 'परत स्वागत आहे!';

  @override
  String get signInSubtitle =>
      'तुमचा फिटनेस प्रवास सुरू ठेवण्यासाठी साइन इन करा';

  @override
  String get dontHaveAccountText => 'खाते नाही? ';

  @override
  String get signInButtonText => 'साइन इन';

  @override
  String get createAccountTitle => 'खाते तयार करा';

  @override
  String get signUpSubtitle =>
      'आमच्यात सामील व्हा आणि आजच तुमचा फिटनेस प्रवास सुरू करा';

  @override
  String get alreadyHaveAccountText => 'आधीच खाते आहे? ';

  @override
  String get signUpButtonText => 'साइन अप';

  @override
  String get passwordLabel => 'पासवर्ड';

  @override
  String get passwordHint => 'तुमचा पासवर्ड टाका';

  @override
  String get passwordRequired => 'पासवर्ड आवश्यक आहे';

  @override
  String get passwordMinLength => 'पासवर्ड कमीत कमी 6 अक्षरांचा असावा';

  @override
  String get passwordStrong => 'पासवर्ड कमीत कमी 8 अक्षरांचा असावा';

  @override
  String get passwordComplexity =>
      'पासवर्डमध्ये मोठे, लहान अक्षर आणि संख्या असावी';

  @override
  String get confirmPasswordLabel => 'पासवर्डची पुष्टी करा';

  @override
  String get confirmPasswordHint => 'तुमच्या पासवर्डची पुष्टी करा';

  @override
  String get confirmPasswordRequired => 'कृपया तुमच्या पासवर्डची पुष्टी करा';

  @override
  String get passwordsDoNotMatch => 'पासवर्ड जुळत नाहीत';

  @override
  String get forgotPasswordLink => 'पासवर्ड विसरलात?';

  @override
  String get orText => 'किंवा';

  @override
  String get appleSignInSoon => 'Apple साइन इन लवकरच येत आहे';

  @override
  String get loginFailed => 'लॉगिन अयशस्वी';

  @override
  String get signUpFailed => 'साइन अप अयशस्वी';

  @override
  String get accountCreatedSuccess => 'खाते यशस्वीरित्या तयार झाले!';

  @override
  String get createAccountButton => 'खाते तयार करा';

  @override
  String get enterYourEmail => 'तुमचा ईमेल टाका';

  @override
  String get enterYourPassword => 'तुमचा पासवर्ड टाका';

  @override
  String get createStrongPassword => 'मजबूत पासवर्ड तयार करा';

  @override
  String get termsAndConditions =>
      'खाते तयार करून, तुम्ही आमच्या सेवा अटी आणि गोपनीयता धोरणाशी सहमत आहात';

  @override
  String get profileGeneral => 'सामान्य';

  @override
  String get profileNotifications => 'सूचना';

  @override
  String get profilePersonalInfo => 'वैयक्तिक माहिती';

  @override
  String get profileCoachContact => 'प्रशिक्षक संपर्क';

  @override
  String get profileLanguage => 'भाषा';

  @override
  String get profileLanguageValue => 'मराठी (MR)';

  @override
  String get profileDarkMode => 'डार्क मोड';

  @override
  String get profileLinkedDevices => 'जोडलेली उपकरणे';

  @override
  String get profileLinkedDevicesValue => 'Apple Watch';

  @override
  String get profileSecurityPrivacy => 'सुरक्षा आणि गोपनीयता';

  @override
  String get profileMainSecurity => 'मुख्य सुरक्षा';

  @override
  String get profileEnableBiometric => 'बायोमेट्रिक सक्षम करा';

  @override
  String get profilePrivacyPolicy => 'गोपनीयता धोरण';

  @override
  String get profileHelpSupport => 'मदत आणि समर्थन';

  @override
  String get profileAboutUs => 'आमच्याबद्दल';

  @override
  String get profileHelpCenter => 'मदत केंद्र';

  @override
  String get profileSubmitFeedback => 'अभिप्राय पाठवा';

  @override
  String get profileDangerZone => 'धोकादायक क्षेत्र';

  @override
  String get profileCloseAccount => 'खाते बंद करा';

  @override
  String get profileLogOut => 'लॉग आउट';

  @override
  String get profileSignOut => 'साइन आउट';

  @override
  String get profileSignOutTitle => 'साइन आउट';

  @override
  String get profileSignOutMessage => 'तुम्हाला खरोखर साइन आउट करायचे आहे का?';

  @override
  String get profileCancel => 'रद्द करा';

  @override
  String get profileSignOutFailed => 'साइन आउट अयशस्वी';

  @override
  String get profileBeta => 'बीटा';

  @override
  String get profileWarning => 'चेतावणी';

  @override
  String profileRightsReserved(Object year) {
    return '© $year सर्व हक्क राखीव';
  }

  @override
  String profileLoading(Object loadingIndication) {
    return 'लोड होत आहे$loadingIndication';
  }
}
