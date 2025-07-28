import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('mr'),
    Locale('hi'),
    Locale('ar'),
    Locale('es'),
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @greetUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}!'**
  String greetUser(Object username);

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fit Track Pro'**
  String get appTitle;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Your personal fitness tracker'**
  String get appDescription;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error, please try again later.'**
  String get errorNetwork;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password.'**
  String get errorInvalidCredentials;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found.'**
  String get errorUserNotFound;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again.'**
  String get errorGeneric;

  /// No description provided for @localeSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get localeSettingsTitle;

  /// No description provided for @localeSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language for the app.'**
  String get localeSettingsDescription;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @walkthroughTitle1.
  ///
  /// In en, this message translates to:
  /// **'Track Your Fitness'**
  String get walkthroughTitle1;

  /// No description provided for @walkthroughDescription1.
  ///
  /// In en, this message translates to:
  /// **'Monitor your daily activities, workouts, and health metrics all in one place.'**
  String get walkthroughDescription1;

  /// No description provided for @walkthroughTitle2.
  ///
  /// In en, this message translates to:
  /// **'Set Goals & Achieve'**
  String get walkthroughTitle2;

  /// No description provided for @walkthroughDescription2.
  ///
  /// In en, this message translates to:
  /// **'Create personalized fitness goals and track your progress towards a healthier you.'**
  String get walkthroughDescription2;

  /// No description provided for @walkthroughTitle3.
  ///
  /// In en, this message translates to:
  /// **'Stay Motivated'**
  String get walkthroughTitle3;

  /// No description provided for @walkthroughDescription3.
  ///
  /// In en, this message translates to:
  /// **'Get insights, reminders, and celebrate your achievements along the way.'**
  String get walkthroughDescription3;

  /// No description provided for @skipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipButton;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @letsGetStartedButton.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get letsGetStartedButton;

  /// No description provided for @finishButton.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishButton;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password'**
  String get forgotPasswordSubtitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get emailHint;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailInvalid;

  /// No description provided for @sendResetLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLinkButton;

  /// No description provided for @backToSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get backToSignInButton;

  /// No description provided for @passwordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent! Check your inbox.'**
  String get passwordResetEmailSent;

  /// No description provided for @passwordResetEmailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send reset email'**
  String get passwordResetEmailFailed;

  /// No description provided for @welcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBackTitle;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue your fitness journey'**
  String get signInSubtitle;

  /// No description provided for @dontHaveAccountText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccountText;

  /// No description provided for @signInButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInButtonText;

  /// No description provided for @createAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountTitle;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us and start your fitness journey today'**
  String get signUpSubtitle;

  /// No description provided for @alreadyHaveAccountText.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccountText;

  /// No description provided for @signUpButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButtonText;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordStrong.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordStrong;

  /// No description provided for @passwordComplexity.
  ///
  /// In en, this message translates to:
  /// **'Password must contain uppercase, lowercase and number'**
  String get passwordComplexity;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmPasswordHint;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @forgotPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordLink;

  /// No description provided for @orText.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get orText;

  /// No description provided for @appleSignInSoon.
  ///
  /// In en, this message translates to:
  /// **'Apple Sign In coming soon'**
  String get appleSignInSoon;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @signUpFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed'**
  String get signUpFailed;

  /// No description provided for @accountCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully!'**
  String get accountCreatedSuccess;

  /// No description provided for @createAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountButton;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @createStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Create a strong password'**
  String get createStrongPassword;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to our Terms of Service and Privacy Policy'**
  String get termsAndConditions;

  /// No description provided for @profileGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get profileGeneral;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotifications;

  /// No description provided for @profilePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get profilePersonalInfo;

  /// No description provided for @profileCoachContact.
  ///
  /// In en, this message translates to:
  /// **'Coach Contact'**
  String get profileCoachContact;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileLanguageValue.
  ///
  /// In en, this message translates to:
  /// **'English (EN)'**
  String get profileLanguageValue;

  /// No description provided for @profileDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get profileDarkMode;

  /// No description provided for @profileLinkedDevices.
  ///
  /// In en, this message translates to:
  /// **'Linked Devices'**
  String get profileLinkedDevices;

  /// No description provided for @profileLinkedDevicesValue.
  ///
  /// In en, this message translates to:
  /// **'Apple Watch'**
  String get profileLinkedDevicesValue;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme mode'**
  String get themeDescription;

  /// No description provided for @themeLightTitle.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLightTitle;

  /// No description provided for @themeLightSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use light theme'**
  String get themeLightSubtitle;

  /// No description provided for @themeDarkTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDarkTitle;

  /// No description provided for @themeDarkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get themeDarkSubtitle;

  /// No description provided for @themeSystemTitle.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystemTitle;

  /// No description provided for @themeSystemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow system setting'**
  String get themeSystemSubtitle;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @profileSecurityPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Security & Privacy'**
  String get profileSecurityPrivacy;

  /// No description provided for @profileMainSecurity.
  ///
  /// In en, this message translates to:
  /// **'Main Security'**
  String get profileMainSecurity;

  /// No description provided for @profileEnableBiometric.
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric'**
  String get profileEnableBiometric;

  /// No description provided for @profilePrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get profilePrivacyPolicy;

  /// No description provided for @profileHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileHelpSupport;

  /// No description provided for @profileAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get profileAboutUs;

  /// No description provided for @profileHelpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get profileHelpCenter;

  /// No description provided for @profileSubmitFeedback.
  ///
  /// In en, this message translates to:
  /// **'Submit Feedback'**
  String get profileSubmitFeedback;

  /// No description provided for @profileDangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get profileDangerZone;

  /// No description provided for @profileCloseAccount.
  ///
  /// In en, this message translates to:
  /// **'Close Account'**
  String get profileCloseAccount;

  /// No description provided for @profileLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profileLogOut;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOut;

  /// No description provided for @profileSignOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOutTitle;

  /// No description provided for @profileSignOutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get profileSignOutMessage;

  /// No description provided for @profileCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancel;

  /// No description provided for @profileSignOutFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign out failed'**
  String get profileSignOutFailed;

  /// No description provided for @profileBeta.
  ///
  /// In en, this message translates to:
  /// **'Beta'**
  String get profileBeta;

  /// No description provided for @profileWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get profileWarning;

  /// No description provided for @profileRightsReserved.
  ///
  /// In en, this message translates to:
  /// **'© {year} Rights Reserved'**
  String profileRightsReserved(Object year);

  /// No description provided for @profileLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading{loadingIndication}'**
  String profileLoading(Object loadingIndication);

  /// No description provided for @fitnessMetricsTitle.
  ///
  /// In en, this message translates to:
  /// **'Fitness Metrics'**
  String get fitnessMetricsTitle;

  /// No description provided for @viewAllText.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAllText;

  /// No description provided for @stepsLabel.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get stepsLabel;

  /// No description provided for @hydrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Hydration'**
  String get hydrationLabel;

  /// No description provided for @caloriesLabel.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get caloriesLabel;

  /// No description provided for @distanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distanceLabel;

  /// No description provided for @scoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get scoreLabel;

  /// No description provided for @sleepLabel.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get sleepLabel;

  /// No description provided for @bmiLabel.
  ///
  /// In en, this message translates to:
  /// **'bmi'**
  String get bmiLabel;

  /// No description provided for @bpmLabel.
  ///
  /// In en, this message translates to:
  /// **'bpm'**
  String get bpmLabel;

  /// No description provided for @calorieLabel.
  ///
  /// In en, this message translates to:
  /// **'Calorie'**
  String get calorieLabel;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @heartRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate'**
  String get heartRateLabel;

  /// No description provided for @workoutStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout Stats'**
  String get workoutStatsTitle;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @exercises.
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get exercises;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @startWorkout.
  ///
  /// In en, this message translates to:
  /// **'Start Workout'**
  String get startWorkout;

  /// No description provided for @clearData.
  ///
  /// In en, this message translates to:
  /// **'Clear Data'**
  String get clearData;

  /// No description provided for @checkDatabase.
  ///
  /// In en, this message translates to:
  /// **'Check Database'**
  String get checkDatabase;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @failedToLoadWorkoutPlans.
  ///
  /// In en, this message translates to:
  /// **'Failed to load workout plans'**
  String get failedToLoadWorkoutPlans;

  /// No description provided for @initializeMockData.
  ///
  /// In en, this message translates to:
  /// **'Initialize Mock Data'**
  String get initializeMockData;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @failedToChangeTheme.
  ///
  /// In en, this message translates to:
  /// **'Failed to change theme'**
  String get failedToChangeTheme;

  /// No description provided for @resetToSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'Reset to System Default'**
  String get resetToSystemDefault;

  /// No description provided for @clearSavedPreferences.
  ///
  /// In en, this message translates to:
  /// **'Clear Saved Preferences'**
  String get clearSavedPreferences;

  /// No description provided for @signOutFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign out failed'**
  String get signOutFailed;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @currentHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Current Heart Rate'**
  String get currentHeartRate;

  /// No description provided for @preWorkoutStretch.
  ///
  /// In en, this message translates to:
  /// **'Pre-Workout Stretch'**
  String get preWorkoutStretch;

  /// No description provided for @lowerBodyTraining.
  ///
  /// In en, this message translates to:
  /// **'Lower Body Training'**
  String get lowerBodyTraining;

  /// No description provided for @hiitCardioInterval.
  ///
  /// In en, this message translates to:
  /// **'HIIT Cardio Interval'**
  String get hiitCardioInterval;

  /// No description provided for @recoverySession.
  ///
  /// In en, this message translates to:
  /// **'Recovery Session'**
  String get recoverySession;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @startWeight.
  ///
  /// In en, this message translates to:
  /// **'Start Weight'**
  String get startWeight;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @dailyCalories.
  ///
  /// In en, this message translates to:
  /// **'Daily Calories'**
  String get dailyCalories;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @passwordResetIcon.
  ///
  /// In en, this message translates to:
  /// **'Password reset icon'**
  String get passwordResetIcon;

  /// No description provided for @navigateToSignUp.
  ///
  /// In en, this message translates to:
  /// **'Navigate to sign up'**
  String get navigateToSignUp;

  /// No description provided for @profileStatisticsOverview.
  ///
  /// In en, this message translates to:
  /// **'Profile statistics overview'**
  String get profileStatisticsOverview;

  /// No description provided for @profilePageHeader.
  ///
  /// In en, this message translates to:
  /// **'Profile page header'**
  String get profilePageHeader;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile settings'**
  String get profileSettings;

  /// No description provided for @tapToAccessProfileSettings.
  ///
  /// In en, this message translates to:
  /// **'Tap to access profile settings'**
  String get tapToAccessProfileSettings;

  /// No description provided for @profilePictureForSandraGram.
  ///
  /// In en, this message translates to:
  /// **'Profile picture for Sandra Gram'**
  String get profilePictureForSandraGram;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userName;

  /// No description provided for @userLocationDenmarkCopenhagen.
  ///
  /// In en, this message translates to:
  /// **'User location: Denmark, Copenhagen'**
  String get userLocationDenmarkCopenhagen;

  /// No description provided for @userStatisticsAndActions.
  ///
  /// In en, this message translates to:
  /// **'User statistics and actions'**
  String get userStatisticsAndActions;

  /// No description provided for @exportProfileData.
  ///
  /// In en, this message translates to:
  /// **'Export profile data'**
  String get exportProfileData;

  /// No description provided for @tapToExportYourProfileInformation.
  ///
  /// In en, this message translates to:
  /// **'Tap to export your profile information'**
  String get tapToExportYourProfileInformation;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @tapToEditYourProfileInformation.
  ///
  /// In en, this message translates to:
  /// **'Tap to edit your profile information'**
  String get tapToEditYourProfileInformation;

  /// No description provided for @navigateToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Navigate to sign in'**
  String get navigateToSignIn;

  /// No description provided for @onboardingSlides.
  ///
  /// In en, this message translates to:
  /// **'Onboarding Slides'**
  String get onboardingSlides;

  /// No description provided for @sandraGram.
  ///
  /// In en, this message translates to:
  /// **'Sandra Gram'**
  String get sandraGram;

  /// No description provided for @denmarkCopenhagen.
  ///
  /// In en, this message translates to:
  /// **'Denmark, Copenhagen'**
  String get denmarkCopenhagen;

  /// No description provided for @welcomeToFitTrackPro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to \nFit Track Pro'**
  String get welcomeToFitTrackPro;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Personalize your fitness journey with our comprehensive tracking app.'**
  String get welcomeDescription;

  /// No description provided for @personalizedFitnessGoals.
  ///
  /// In en, this message translates to:
  /// **'Personalized Fitness Goals'**
  String get personalizedFitnessGoals;

  /// No description provided for @personalizedFitnessGoalsDescription.
  ///
  /// In en, this message translates to:
  /// **'Create personalized fitness goals and track your progress towards a healthier you.'**
  String get personalizedFitnessGoalsDescription;

  /// No description provided for @trackYourWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Track Your Workouts'**
  String get trackYourWorkouts;

  /// No description provided for @trackYourWorkoutsDescription.
  ///
  /// In en, this message translates to:
  /// **'Get insights, reminders, and celebrate your achievements along the way.'**
  String get trackYourWorkoutsDescription;

  /// No description provided for @healthMetricsAndFitnessAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Health Metrics & Fitness Analytics'**
  String get healthMetricsAndFitnessAnalytics;

  /// No description provided for @healthMetricsDescription.
  ///
  /// In en, this message translates to:
  /// **'Monitor your health profile with ease.'**
  String get healthMetricsDescription;

  /// No description provided for @nutritionAndDietGuidance.
  ///
  /// In en, this message translates to:
  /// **'Nutrition & Diet\nGuidance'**
  String get nutritionAndDietGuidance;

  /// No description provided for @nutritionDescription.
  ///
  /// In en, this message translates to:
  /// **'Lose weight and get fit with Fit Track Pro.'**
  String get nutritionDescription;

  /// No description provided for @virtualAiCoachMentoring.
  ///
  /// In en, this message translates to:
  /// **'Virtual AI Coach \nMentoring'**
  String get virtualAiCoachMentoring;

  /// No description provided for @virtualAiCoachDescription.
  ///
  /// In en, this message translates to:
  /// **'Say goodbye to manual coaching.'**
  String get virtualAiCoachDescription;

  /// No description provided for @upperStrength2.
  ///
  /// In en, this message translates to:
  /// **'Upper Strength 2'**
  String get upperStrength2;

  /// No description provided for @eightSeriesWorkout.
  ///
  /// In en, this message translates to:
  /// **'8 Series Workout'**
  String get eightSeriesWorkout;

  /// No description provided for @corePower.
  ///
  /// In en, this message translates to:
  /// **'Core Power'**
  String get corePower;

  /// No description provided for @sixSeriesWorkout.
  ///
  /// In en, this message translates to:
  /// **'6 Series Workout'**
  String get sixSeriesWorkout;

  /// No description provided for @cardioBlast.
  ///
  /// In en, this message translates to:
  /// **'Cardio Blast'**
  String get cardioBlast;

  /// No description provided for @tenSeriesWorkout.
  ///
  /// In en, this message translates to:
  /// **'10 Series Workout'**
  String get tenSeriesWorkout;

  /// No description provided for @workouts.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get workouts;

  /// No description provided for @durationWithMinutes.
  ///
  /// In en, this message translates to:
  /// **'Duration: {minutes} minutes'**
  String durationWithMinutes(int minutes);

  /// No description provided for @exercisesWithCount.
  ///
  /// In en, this message translates to:
  /// **'Exercises ({count})'**
  String exercisesWithCount(int count);

  /// No description provided for @totalWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Total Workouts'**
  String get totalWorkouts;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'sessions'**
  String get sessions;

  /// No description provided for @caloriesBurned.
  ///
  /// In en, this message translates to:
  /// **'Calories Burned'**
  String get caloriesBurned;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcal;

  /// No description provided for @activeMinutes.
  ///
  /// In en, this message translates to:
  /// **'Active Minutes'**
  String get activeMinutes;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get min;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @workoutsUnit.
  ///
  /// In en, this message translates to:
  /// **'workouts'**
  String get workoutsUnit;

  /// No description provided for @oneDay.
  ///
  /// In en, this message translates to:
  /// **'1 Day'**
  String get oneDay;

  /// No description provided for @oneWeek.
  ///
  /// In en, this message translates to:
  /// **'1 Week'**
  String get oneWeek;

  /// No description provided for @oneMonth.
  ///
  /// In en, this message translates to:
  /// **'1 Month'**
  String get oneMonth;

  /// No description provided for @threeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get threeMonths;

  /// No description provided for @sixMonths.
  ///
  /// In en, this message translates to:
  /// **'6 Months'**
  String get sixMonths;

  /// No description provided for @twelveMonths.
  ///
  /// In en, this message translates to:
  /// **'12 Months'**
  String get twelveMonths;

  /// No description provided for @percentageUnit.
  ///
  /// In en, this message translates to:
  /// **' %'**
  String get percentageUnit;

  /// No description provided for @rateUnit.
  ///
  /// In en, this message translates to:
  /// **' rate'**
  String get rateUnit;

  /// No description provided for @mlUnit.
  ///
  /// In en, this message translates to:
  /// **' ml'**
  String get mlUnit;

  /// No description provided for @kcalUnit.
  ///
  /// In en, this message translates to:
  /// **' kcal'**
  String get kcalUnit;

  /// No description provided for @kmUnit.
  ///
  /// In en, this message translates to:
  /// **' km'**
  String get kmUnit;

  /// No description provided for @recentWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Recent Workouts'**
  String get recentWorkouts;

  /// No description provided for @workoutPlans.
  ///
  /// In en, this message translates to:
  /// **'Workout Plans'**
  String get workoutPlans;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @workoutsWithCount.
  ///
  /// In en, this message translates to:
  /// **'Workouts ({count})'**
  String workoutsWithCount(int count);

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'Duration: {minutes} minutes'**
  String durationMinutes(int minutes);

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @signOutFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Sign out failed: {error}'**
  String signOutFailedWithError(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'es', 'hi', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
