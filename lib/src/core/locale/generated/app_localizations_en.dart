// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String greetUser(Object username) {
    return 'Welcome, $username!';
  }

  @override
  String get appTitle => 'Fit Track Pro';

  @override
  String get appDescription => 'Your personal fitness tracker';

  @override
  String get loginButton => 'Login';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get logoutButton => 'Logout';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get profileTitle => 'Profile';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get errorNetwork => 'Network error, please try again later.';

  @override
  String get errorInvalidCredentials => 'Invalid username or password.';

  @override
  String get errorUserNotFound => 'User not found.';

  @override
  String get errorGeneric => 'An error occurred, please try again.';

  @override
  String get localeSettingsTitle => 'Language Settings';

  @override
  String get localeSettingsDescription =>
      'Select your preferred language for the app.';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get walkthroughTitle1 => 'Track Your Fitness';

  @override
  String get walkthroughDescription1 =>
      'Monitor your daily activities, workouts, and health metrics all in one place.';

  @override
  String get walkthroughTitle2 => 'Set Goals & Achieve';

  @override
  String get walkthroughDescription2 =>
      'Create personalized fitness goals and track your progress towards a healthier you.';

  @override
  String get walkthroughTitle3 => 'Stay Motivated';

  @override
  String get walkthroughDescription3 =>
      'Get insights, reminders, and celebrate your achievements along the way.';

  @override
  String get skipButton => 'Skip';

  @override
  String get nextButton => 'Next';

  @override
  String get letsGetStartedButton => 'Let\'s Get Started';

  @override
  String get finishButton => 'Finish';
}
