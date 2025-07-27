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

  @override
  String get forgotPasswordTitle => 'Forgot Password?';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email address and we\'ll send you a link to reset your password';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Enter your email address';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Please enter a valid email';

  @override
  String get sendResetLinkButton => 'Send Reset Link';

  @override
  String get backToSignInButton => 'Back to Sign In';

  @override
  String get passwordResetEmailSent =>
      'Password reset email sent! Check your inbox.';

  @override
  String get passwordResetEmailFailed => 'Failed to send reset email';

  @override
  String get welcomeBackTitle => 'Welcome Back!';

  @override
  String get signInSubtitle => 'Sign in to continue your fitness journey';

  @override
  String get dontHaveAccountText => 'Don\'t have an account? ';

  @override
  String get signInButtonText => 'Sign In';

  @override
  String get createAccountTitle => 'Create Account';

  @override
  String get signUpSubtitle => 'Join us and start your fitness journey today';

  @override
  String get alreadyHaveAccountText => 'Already have an account? ';

  @override
  String get signUpButtonText => 'Sign Up';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get passwordStrong => 'Password must be at least 8 characters';

  @override
  String get passwordComplexity =>
      'Password must contain uppercase, lowercase and number';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Confirm your password';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get forgotPasswordLink => 'Forgot Password?';

  @override
  String get orText => 'or';

  @override
  String get appleSignInSoon => 'Apple Sign In coming soon';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get signUpFailed => 'Sign up failed';

  @override
  String get accountCreatedSuccess => 'Account created successfully!';

  @override
  String get createAccountButton => 'Create Account';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get createStrongPassword => 'Create a strong password';

  @override
  String get termsAndConditions =>
      'By creating an account, you agree to our Terms of Service and Privacy Policy';

  @override
  String get profileGeneral => 'General';

  @override
  String get profileNotifications => 'Notifications';

  @override
  String get profilePersonalInfo => 'Personal Information';

  @override
  String get profileCoachContact => 'Coach Contact';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileLanguageValue => 'English (EN)';

  @override
  String get profileDarkMode => 'Theme';

  @override
  String get profileLinkedDevices => 'Linked Devices';

  @override
  String get profileLinkedDevicesValue => 'Apple Watch';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeDescription => 'Choose your preferred theme mode';

  @override
  String get themeLightTitle => 'Light';

  @override
  String get themeLightSubtitle => 'Use light theme';

  @override
  String get themeDarkTitle => 'Dark';

  @override
  String get themeDarkSubtitle => 'Use dark theme';

  @override
  String get themeSystemTitle => 'System';

  @override
  String get themeSystemSubtitle => 'Follow system setting';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get profileSecurityPrivacy => 'Security & Privacy';

  @override
  String get profileMainSecurity => 'Main Security';

  @override
  String get profileEnableBiometric => 'Enable Biometric';

  @override
  String get profilePrivacyPolicy => 'Privacy Policy';

  @override
  String get profileHelpSupport => 'Help & Support';

  @override
  String get profileAboutUs => 'About Us';

  @override
  String get profileHelpCenter => 'Help Center';

  @override
  String get profileSubmitFeedback => 'Submit Feedback';

  @override
  String get profileDangerZone => 'Danger Zone';

  @override
  String get profileCloseAccount => 'Close Account';

  @override
  String get profileLogOut => 'Log Out';

  @override
  String get profileSignOut => 'Sign Out';

  @override
  String get profileSignOutTitle => 'Sign Out';

  @override
  String get profileSignOutMessage => 'Are you sure you want to sign out?';

  @override
  String get profileCancel => 'Cancel';

  @override
  String get profileSignOutFailed => 'Sign out failed';

  @override
  String get profileBeta => 'Beta';

  @override
  String get profileWarning => 'Warning';

  @override
  String profileRightsReserved(Object year) {
    return '© $year Rights Reserved';
  }

  @override
  String profileLoading(Object loadingIndication) {
    return 'Loading$loadingIndication';
  }
}
