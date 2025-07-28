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

  @override
  String get forgotPasswordTitle => 'पासवर्ड भूल गए?';

  @override
  String get forgotPasswordSubtitle =>
      'अपना ईमेल पता दर्ज करें और हम आपको अपना पासवर्ड रीसेट करने के लिए एक लिंक भेजेंगे';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get emailHint => 'अपना ईमेल पता दर्ज करें';

  @override
  String get emailRequired => 'ईमेल आवश्यक है';

  @override
  String get emailInvalid => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get sendResetLinkButton => 'रीसेट लिंक भेजें';

  @override
  String get backToSignInButton => 'साइन इन पर वापस जाएं';

  @override
  String get passwordResetEmailSent =>
      'पासवर्ड रीसेट ईमेल भेजा गया! अपना इनबॉक्स चेक करें।';

  @override
  String get passwordResetEmailFailed => 'रीसेट ईमेल भेजने में विफल';

  @override
  String get welcomeBackTitle => 'वापसी पर स्वागत है!';

  @override
  String get signInSubtitle =>
      'अपनी फिटनेस यात्रा जारी रखने के लिए साइन इन करें';

  @override
  String get dontHaveAccountText => 'कोई खाता नहीं है? ';

  @override
  String get signInButtonText => 'साइन इन';

  @override
  String get createAccountTitle => 'खाता बनाएं';

  @override
  String get signUpSubtitle =>
      'हमसे जुड़ें और आज ही अपनी फिटनेस यात्रा शुरू करें';

  @override
  String get alreadyHaveAccountText => 'पहले से खाता है? ';

  @override
  String get signUpButtonText => 'साइन अप';

  @override
  String get passwordLabel => 'पासवर्ड';

  @override
  String get passwordHint => 'अपना पासवर्ड दर्ज करें';

  @override
  String get passwordRequired => 'पासवर्ड आवश्यक है';

  @override
  String get passwordMinLength => 'पासवर्ड कम से कम 6 अक्षर का होना चाहिए';

  @override
  String get passwordStrong => 'पासवर्ड कम से कम 8 अक्षर का होना चाहिए';

  @override
  String get passwordComplexity =>
      'पासवर्ड में बड़े, छोटे अक्षर और संख्या होनी चाहिए';

  @override
  String get confirmPasswordLabel => 'पासवर्ड की पुष्टि करें';

  @override
  String get confirmPasswordHint => 'अपने पासवर्ड की पुष्टि करें';

  @override
  String get confirmPasswordRequired => 'कृपया अपने पासवर्ड की पुष्टि करें';

  @override
  String get passwordsDoNotMatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get forgotPasswordLink => 'पासवर्ड भूल गए?';

  @override
  String get orText => 'या';

  @override
  String get appleSignInSoon => 'Apple साइन इन जल्द आ रहा है';

  @override
  String get loginFailed => 'लॉगिन विफल';

  @override
  String get signUpFailed => 'साइन अप विफल';

  @override
  String get accountCreatedSuccess => 'खाता सफलतापूर्वक बनाया गया!';

  @override
  String get createAccountButton => 'खाता बनाएं';

  @override
  String get enterYourEmail => 'अपना ईमेल दर्ज करें';

  @override
  String get enterYourPassword => 'अपना पासवर्ड दर्ज करें';

  @override
  String get createStrongPassword => 'एक मजबूत पासवर्ड बनाएं';

  @override
  String get termsAndConditions =>
      'खाता बनाकर, आप हमारी सेवा की शर्तों और गोपनीयता नीति से सहमत हैं';

  @override
  String get profileGeneral => 'सामान्य';

  @override
  String get profileNotifications => 'सूचनाएं';

  @override
  String get profilePersonalInfo => 'व्यक्तिगत जानकारी';

  @override
  String get profileCoachContact => 'कोच संपर्क';

  @override
  String get profileLanguage => 'भाषा';

  @override
  String get profileLanguageValue => 'हिंदी (HI)';

  @override
  String get profileDarkMode => 'थीम';

  @override
  String get profileLinkedDevices => 'जुड़े हुए उपकरण';

  @override
  String get profileLinkedDevicesValue => 'Apple Watch';

  @override
  String get themeTitle => 'थीम';

  @override
  String get themeDescription => 'अपनी पसंदीदा थीम मोड चुनें';

  @override
  String get themeLightTitle => 'हल्का';

  @override
  String get themeLightSubtitle => 'हल्का थीम उपयोग करें';

  @override
  String get themeDarkTitle => 'गहरा';

  @override
  String get themeDarkSubtitle => 'गहरा थीम उपयोग करें';

  @override
  String get themeSystemTitle => 'सिस्टम';

  @override
  String get themeSystemSubtitle => 'सिस्टम सेटिंग का पालन करें';

  @override
  String get themeLight => 'हल्का';

  @override
  String get themeDark => 'गहरा';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get profileSecurityPrivacy => 'सुरक्षा और गोपनीयता';

  @override
  String get profileMainSecurity => 'मुख्य सुरक्षा';

  @override
  String get profileEnableBiometric => 'बायोमेट्रिक सक्षम करें';

  @override
  String get profilePrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get profileHelpSupport => 'सहायता और समर्थन';

  @override
  String get profileAboutUs => 'हमारे बारे में';

  @override
  String get profileHelpCenter => 'सहायता केंद्र';

  @override
  String get profileSubmitFeedback => 'फीडबैक भेजें';

  @override
  String get profileDangerZone => 'खतरा क्षेत्र';

  @override
  String get profileCloseAccount => 'खाता बंद करें';

  @override
  String get profileLogOut => 'लॉग आउट';

  @override
  String get profileSignOut => 'साइन आउट';

  @override
  String get profileSignOutTitle => 'साइन आउट';

  @override
  String get profileSignOutMessage => 'क्या आप वाकई साइन आउट करना चाहते हैं?';

  @override
  String get profileCancel => 'रद्द करें';

  @override
  String get profileSignOutFailed => 'साइन आउट विफल';

  @override
  String get profileBeta => 'बीटा';

  @override
  String get profileWarning => 'चेतावनी';

  @override
  String profileRightsReserved(Object year) {
    return '© $year सभी अधिकार सुरक्षित';
  }

  @override
  String profileLoading(Object loadingIndication) {
    return 'लोड हो रहा है$loadingIndication';
  }

  @override
  String get fitnessMetricsTitle => 'फिटनेस मेट्रिक्स';

  @override
  String get viewAllText => 'सभी देखें';

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
  String get duration => 'अवधि';

  @override
  String get exercises => 'व्यायाम';

  @override
  String get difficulty => 'कठिनाई';

  @override
  String get description => 'विवरण';

  @override
  String get startWorkout => 'वर्कआउट शुरू करें';

  @override
  String get clearData => 'डेटा साफ़ करें';

  @override
  String get checkDatabase => 'डेटाबेस जांचें';

  @override
  String get close => 'बंद करें';

  @override
  String get failedToLoadWorkoutPlans => 'वर्कआउट प्लान लोड करने में विफल';

  @override
  String get initializeMockData => 'मॉक डेटा प्रारंभ करें';

  @override
  String get notes => 'नोट्स';

  @override
  String get failedToChangeTheme => 'थीम बदलने में विफल';

  @override
  String get resetToSystemDefault => 'सिस्टम डिफ़ॉल्ट पर रीसेट करें';

  @override
  String get clearSavedPreferences => 'सहेजी गई प्राथमिकताएं साफ़ करें';

  @override
  String get signOutFailed => 'साइन आउट विफल';

  @override
  String get home => 'होम';

  @override
  String get categories => 'श्रेणियां';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get currentHeartRate => 'वर्तमान हृदय गति';

  @override
  String get preWorkoutStretch => 'वर्कआउट पूर्व स्ट्रेच';

  @override
  String get lowerBodyTraining => 'निचली शरीर प्रशिक्षण';

  @override
  String get hiitCardioInterval => 'HIIT कार्डियो इंटर्वल';

  @override
  String get recoverySession => 'रिकवरी सेशन';

  @override
  String get progress => 'प्रगति';

  @override
  String get startWeight => 'प्रारंभिक वजन';

  @override
  String get good => 'अच्छा';

  @override
  String get dailyCalories => 'दैनिक कैलोरी';

  @override
  String get goBack => 'वापस जाएं';

  @override
  String get passwordResetIcon => 'पासवर्ड रीसेट आइकन';

  @override
  String get navigateToSignUp => 'साइन अप पर नेविगेट करें';

  @override
  String get profileStatisticsOverview => 'प्रोफ़ाइल आंकड़े अवलोकन';

  @override
  String get profilePageHeader => 'प्रोफ़ाइल पृष्ठ हेडर';

  @override
  String get profileSettings => 'प्रोफ़ाइल सेटिंग्स';

  @override
  String get tapToAccessProfileSettings =>
      'प्रोफ़ाइल सेटिंग्स तक पहुंचने के लिए टैप करें';

  @override
  String get profilePictureForSandraGram =>
      'Sandra Gram के लिए प्रोफ़ाइल चित्र';

  @override
  String get userName => 'उपयोगकर्ता नाम';

  @override
  String get userLocationDenmarkCopenhagen =>
      'उपयोगकर्ता स्थान: डेनमार्क, कोपेनहेगन';

  @override
  String get userStatisticsAndActions => 'उपयोगकर्ता आंकड़े और क्रियाएं';

  @override
  String get exportProfileData => 'प्रोफ़ाइल डेटा एक्सपोर्ट करें';

  @override
  String get tapToExportYourProfileInformation =>
      'अपनी प्रोफ़ाइल जानकारी एक्सपोर्ट करने के लिए टैप करें';

  @override
  String get editProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String get tapToEditYourProfileInformation =>
      'अपनी प्रोफ़ाइल जानकारी संपादित करने के लिए टैप करें';

  @override
  String get navigateToSignIn => 'साइन इन पर नेविगेट करें';

  @override
  String get onboardingSlides => 'ऑनबोर्डिंग स्लाइड्स';

  @override
  String get sandraGram => 'Sandra Gram';

  @override
  String get denmarkCopenhagen => 'डेनमार्क, कोपेनहेगन';

  @override
  String get welcomeToFitTrackPro => 'Fit Track Pro में\nआपका स्वागत है';

  @override
  String get welcomeDescription =>
      'हमारे व्यापक ट्रैकिंग ऐप के साथ अपनी फिटनेस यात्रा को व्यक्तिगत बनाएं।';

  @override
  String get personalizedFitnessGoals => 'व्यक्तिगत फिटनेस लक्ष्य';

  @override
  String get personalizedFitnessGoalsDescription =>
      'व्यक्तिगत फिटनेस लक्ष्य बनाएं और स्वस्थ जीवन की दिशा में अपनी प्रगति को ट्रैक करें।';

  @override
  String get trackYourWorkouts => 'अपनी वर्कआउट ट्रैक करें';

  @override
  String get trackYourWorkoutsDescription =>
      'अंतर्दृष्टि प्राप्त करें, रिमाइंडर पाएं और अपनी उपलब्धियों का जश्न मनाएं।';

  @override
  String get healthMetricsAndFitnessAnalytics =>
      'स्वास्थ्य मेट्रिक्स और फिटनेस एनालिटिक्स';

  @override
  String get healthMetricsDescription =>
      'आसानी से अपनी स्वास्थ्य प्रोफ़ाइल की निगरानी करें।';

  @override
  String get nutritionAndDietGuidance => 'पोषण और आहार\nमार्गदर्शन';

  @override
  String get nutritionDescription =>
      'Fit Track Pro के साथ वजन कम करें और फिट हो जाएं।';

  @override
  String get virtualAiCoachMentoring => 'वर्चुअल AI कोच\nमेंटरिंग';

  @override
  String get virtualAiCoachDescription => 'मैन्युअल कोचिंग को अलविदा कहें।';

  @override
  String get upperStrength2 => 'ऊपरी शक्ति 2';

  @override
  String get eightSeriesWorkout => '8 सीरीज वर्कआउट';

  @override
  String get corePower => 'कोर पावर';

  @override
  String get sixSeriesWorkout => '6 सीरीज वर्कआउट';

  @override
  String get cardioBlast => 'कार्डियो ब्लास्ट';

  @override
  String get tenSeriesWorkout => '10 सीरीज वर्कआउट';

  @override
  String get workouts => 'वर्कआउट';

  @override
  String durationWithMinutes(int minutes) {
    return 'अवधि: $minutes मिनट';
  }

  @override
  String exercisesWithCount(int count) {
    return 'व्यायाम ($count)';
  }

  @override
  String get totalWorkouts => 'कुल वर्कआउट';

  @override
  String get sessions => 'सेशन';

  @override
  String get caloriesBurned => 'जली हुई कैलोरी';

  @override
  String get kcal => 'kcal';

  @override
  String get activeMinutes => 'सक्रिय मिनट';

  @override
  String get min => 'मिनट';

  @override
  String get thisWeek => 'इस सप्ताह';

  @override
  String get workoutsUnit => 'वर्कआउट';

  @override
  String get oneDay => '1 दिन';

  @override
  String get oneWeek => '1 सप्ताह';

  @override
  String get oneMonth => '1 महीना';

  @override
  String get threeMonths => '3 महीने';

  @override
  String get sixMonths => '6 महीने';

  @override
  String get twelveMonths => '12 महीने';

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
  String get recentWorkouts => 'हाल की वर्कआउट';

  @override
  String get workoutPlans => 'वर्कआउट योजनाएं';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String workoutsWithCount(int count) {
    return 'वर्कआउट ($count)';
  }

  @override
  String durationMinutes(int minutes) {
    return 'अवधि: $minutes मिनट';
  }

  @override
  String get follow => 'फॉलो करें';

  @override
  String get followers => 'फॉलोअर्स';

  @override
  String get following => 'फॉलोइंग';

  @override
  String signOutFailedWithError(String error) {
    return 'साइन आउट विफल: $error';
  }
}
