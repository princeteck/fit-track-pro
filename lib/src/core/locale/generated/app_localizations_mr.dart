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
  String get profileDarkMode => 'थीम';

  @override
  String get profileLinkedDevices => 'लिंक केलेली डिव्हाइसेस';

  @override
  String get profileLinkedDevicesValue => 'Apple Watch';

  @override
  String get themeTitle => 'थीम';

  @override
  String get themeDescription => 'तुमची आवडती थीम मोड निवडा';

  @override
  String get themeLightTitle => 'हलकी';

  @override
  String get themeLightSubtitle => 'हलकी थीम वापरा';

  @override
  String get themeDarkTitle => 'गडद';

  @override
  String get themeDarkSubtitle => 'गडद थीम वापरा';

  @override
  String get themeSystemTitle => 'सिस्टम';

  @override
  String get themeSystemSubtitle => 'सिस्टम सेटिंग फॉलो करा';

  @override
  String get themeLight => 'हलकी';

  @override
  String get themeDark => 'गडद';

  @override
  String get themeSystem => 'सिस्टम';

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

  @override
  String get fitnessMetricsTitle => 'फिटनेस मेट्रिक्स';

  @override
  String get viewAllText => 'सर्व पाहा';

  @override
  String get stepsLabel => 'कदम';

  @override
  String get hydrationLabel => 'जलयोजन';

  @override
  String get caloriesLabel => 'कैलोरी';

  @override
  String get distanceLabel => 'दूरी';

  @override
  String get scoreLabel => 'स्कोर';

  @override
  String get sleepLabel => 'नींद';

  @override
  String get bmiLabel => 'बीएमआई';

  @override
  String get bpmLabel => 'बीपीएम';

  @override
  String get calorieLabel => 'कैलोरी';

  @override
  String get stats => 'आँकड़े';

  @override
  String get heartRateLabel => 'दिल की धड़कन';

  @override
  String get workoutStatsTitle => 'वर्कआउट आँकड़े';

  @override
  String get duration => 'कालावधी';

  @override
  String get exercises => 'व्यायाम';

  @override
  String get difficulty => 'कठिनाई';

  @override
  String get description => 'वर्णन';

  @override
  String get startWorkout => 'वर्कआउट सुरू करा';

  @override
  String get clearData => 'डेटा साफ करा';

  @override
  String get checkDatabase => 'डेटाबेस तपासा';

  @override
  String get close => 'बंद करा';

  @override
  String get failedToLoadWorkoutPlans => 'वर्कआउट योजना लोड करण्यात अयशस्वी';

  @override
  String get initializeMockData => 'मॉक डेटा प्रारंभ करा';

  @override
  String get notes => 'टिपा';

  @override
  String get failedToChangeTheme => 'थीम बदलण्यात अयशस्वी';

  @override
  String get resetToSystemDefault => 'सिस्टम डिफॉल्टवर रीसेट करा';

  @override
  String get clearSavedPreferences => 'जतन केलेली प्राधान्ये साफ करा';

  @override
  String get signOutFailed => 'साइन आउट अयशस्वी';

  @override
  String get home => 'होम';

  @override
  String get categories => 'श्रेणी';

  @override
  String get profile => 'प्रोफाइल';

  @override
  String get currentHeartRate => 'सध्याचा हृदयाची धड़पड';

  @override
  String get preWorkoutStretch => 'वर्कआउट पूर्व स्ट्रेच';

  @override
  String get lowerBodyTraining => 'खालच्या शरीराचे प्रशिक्षण';

  @override
  String get hiitCardioInterval => 'HIIT कार्डिओ इंटर्व्हल';

  @override
  String get recoverySession => 'रिकव्हरी सेशन';

  @override
  String get progress => 'प्रगती';

  @override
  String get startWeight => 'सुरुवातीचे वजन';

  @override
  String get good => 'चांगले';

  @override
  String get dailyCalories => 'दैनिक कॅलरी';

  @override
  String get goBack => 'परत जा';

  @override
  String get passwordResetIcon => 'पासवर्ड रीसेट आयकन';

  @override
  String get navigateToSignUp => 'साइन अपवर नेव्हिगेट करा';

  @override
  String get profileStatisticsOverview => 'प्रोफाइल सांख्यिकी विहंगावलोकन';

  @override
  String get profilePageHeader => 'प्रोफाइल पेज हेडर';

  @override
  String get profileSettings => 'प्रोफाइल सेटिंग्ज';

  @override
  String get tapToAccessProfileSettings =>
      'प्रोफाइल सेटिंग्जमध्ये प्रवेश करण्यासाठी टॅप करा';

  @override
  String get profilePictureForSandraGram => 'Sandra Gram साठी प्रोफाइल चित्र';

  @override
  String get userName => 'वापरकर्ता नाव';

  @override
  String get userLocationDenmarkCopenhagen =>
      'वापरकर्ता स्थान: डेन्मार्क, कोपनहेगन';

  @override
  String get userStatisticsAndActions => 'वापरकर्ता सांख्यिकी आणि क्रिया';

  @override
  String get exportProfileData => 'प्रोफाइल डेटा एक्सपोर्ट करा';

  @override
  String get tapToExportYourProfileInformation =>
      'तुमची प्रोफाइल माहिती एक्सपोर्ट करण्यासाठी टॅप करा';

  @override
  String get editProfile => 'प्रोफाइल संपादित करा';

  @override
  String get tapToEditYourProfileInformation =>
      'तुमची प्रोफाइल माहिती संपादित करण्यासाठी टॅप करा';

  @override
  String get navigateToSignIn => 'साइन इनवर नेव्हिगेट करा';

  @override
  String get onboardingSlides => 'ऑनबोर्डिंग स्लाइड्स';

  @override
  String get sandraGram => 'Sandra Gram';

  @override
  String get denmarkCopenhagen => 'डेन्मार्क, कोपनहेगन';

  @override
  String get welcomeToFitTrackPro => 'Fit Track Pro मध्ये\nस्वागत आहे';

  @override
  String get welcomeDescription =>
      'आमच्या व्यापक ट्रॅकिंग अॅपसह तुमचा फिटनेस प्रवास वैयक्तिकृत करा.';

  @override
  String get personalizedFitnessGoals => 'वैयक्तिक फिटनेस लक्ष्ये';

  @override
  String get personalizedFitnessGoalsDescription =>
      'वैयक्तिक फिटनेस लक्ष्ये तयार करा आणि निरोगी जीवनाकडे तुमची प्रगती ट्रॅक करा.';

  @override
  String get trackYourWorkouts => 'तुमचे वर्कआउट ट्रॅक करा';

  @override
  String get trackYourWorkoutsDescription =>
      'अंतर्दृष्टी मिळवा, स्मरणपत्रे मिळवा आणि वाटेत तुमच्या यशाचा उत्सव साजरा करा.';

  @override
  String get healthMetricsAndFitnessAnalytics =>
      'आरोग्य मेट्रिक्स आणि फिटनेस अॅनालिटिक्स';

  @override
  String get healthMetricsDescription =>
      'सहजतेने तुमच्या आरोग्य प्रोफाइलचे निरीक्षण करा.';

  @override
  String get nutritionAndDietGuidance => 'पोषण आणि आहार\nमार्गदर्शन';

  @override
  String get nutritionDescription =>
      'Fit Track Pro सह वजन कमी करा आणि तंदुरुस्त व्हा.';

  @override
  String get virtualAiCoachMentoring => 'व्हर्च्युअल AI कोच\nमेंटरिंग';

  @override
  String get virtualAiCoachDescription => 'मॅन्युअल कोचिंगला निरोप द्या.';

  @override
  String get upperStrength2 => 'वरची शक्ती 2';

  @override
  String get eightSeriesWorkout => '8 मालिका वर्कआउट';

  @override
  String get corePower => 'कोर पॉवर';

  @override
  String get sixSeriesWorkout => '6 मालिका वर्कआउट';

  @override
  String get cardioBlast => 'कार्डिओ ब्लास्ट';

  @override
  String get tenSeriesWorkout => '10 मालिका वर्कआउट';

  @override
  String get workouts => 'वर्कआउट';

  @override
  String durationWithMinutes(int minutes) {
    return 'कालावधी: $minutes मिनिटे';
  }

  @override
  String exercisesWithCount(int count) {
    return 'व्यायाम ($count)';
  }

  @override
  String get totalWorkouts => 'एकूण वर्कआउट';

  @override
  String get sessions => 'सेशन';

  @override
  String get caloriesBurned => 'जळालेल्या कॅलरी';

  @override
  String get kcal => 'kcal';

  @override
  String get activeMinutes => 'सक्रिय मिनिटे';

  @override
  String get min => 'मिनिट';

  @override
  String get thisWeek => 'या आठवड्यात';

  @override
  String get workoutsUnit => 'वर्कआउट';

  @override
  String get oneDay => '1 दिवस';

  @override
  String get oneWeek => '1 आठवडा';

  @override
  String get oneMonth => '1 महिना';

  @override
  String get threeMonths => '3 महिने';

  @override
  String get sixMonths => '6 महिने';

  @override
  String get twelveMonths => '12 महिने';

  @override
  String get percentageUnit => ' %';

  @override
  String get rateUnit => ' दर';

  @override
  String get mlUnit => ' ml';

  @override
  String get kcalUnit => ' kcal';

  @override
  String get kmUnit => ' km';

  @override
  String get recentWorkouts => 'अलीकडील वर्कआउट';

  @override
  String get workoutPlans => 'वर्कआउट योजना';

  @override
  String get viewAll => 'सर्व पाहा';

  @override
  String workoutsWithCount(int count) {
    return 'वर्कआउट ($count)';
  }

  @override
  String durationMinutes(int minutes) {
    return 'कालावधी: $minutes मिनिटे';
  }

  @override
  String get follow => 'फॉलो करा';

  @override
  String get followers => 'फॉलोअर्स';

  @override
  String get following => 'फॉलोइंग';

  @override
  String signOutFailedWithError(String error) {
    return 'साइन आउट अयशस्वी: $error';
  }
}
