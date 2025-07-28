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
  String get today => 'Today';

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

  @override
  String get fitnessMetricsTitle => 'Fitness Metrics';

  @override
  String get viewAllText => 'View All';

  @override
  String get stepsLabel => 'Steps';

  @override
  String get hydrationLabel => 'Hydration';

  @override
  String get caloriesLabel => 'Calories';

  @override
  String get distanceLabel => 'Distance';

  @override
  String get scoreLabel => 'Score';

  @override
  String get sleepLabel => 'Sleep';

  @override
  String get bmiLabel => 'bmi';

  @override
  String get bpmLabel => 'bpm';

  @override
  String get calorieLabel => 'Calorie';

  @override
  String get stats => 'Stats';

  @override
  String get heartRateLabel => 'Heart Rate';

  @override
  String get workoutStatsTitle => 'Workout Stats';

  @override
  String get duration => 'Duration';

  @override
  String get exercises => 'Exercises';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get description => 'Description';

  @override
  String get startWorkout => 'Start Workout';

  @override
  String get clearData => 'Clear Data';

  @override
  String get checkDatabase => 'Check Database';

  @override
  String get close => 'Close';

  @override
  String get failedToLoadWorkoutPlans => 'Failed to load workout plans';

  @override
  String get initializeMockData => 'Initialize Mock Data';

  @override
  String get notes => 'Notes';

  @override
  String get failedToChangeTheme => 'Failed to change theme';

  @override
  String get resetToSystemDefault => 'Reset to System Default';

  @override
  String get clearSavedPreferences => 'Clear Saved Preferences';

  @override
  String get signOutFailed => 'Sign out failed';

  @override
  String get home => 'Home';

  @override
  String get categories => 'Categories';

  @override
  String get profile => 'Profile';

  @override
  String get currentHeartRate => 'Current Heart Rate';

  @override
  String get preWorkoutStretch => 'Pre-Workout Stretch';

  @override
  String get lowerBodyTraining => 'Lower Body Training';

  @override
  String get hiitCardioInterval => 'HIIT Cardio Interval';

  @override
  String get recoverySession => 'Recovery Session';

  @override
  String get progress => 'Progress';

  @override
  String get startWeight => 'Start Weight';

  @override
  String get good => 'Good';

  @override
  String get dailyCalories => 'Daily Calories';

  @override
  String get goBack => 'Go back';

  @override
  String get passwordResetIcon => 'Password reset icon';

  @override
  String get navigateToSignUp => 'Navigate to sign up';

  @override
  String get profileStatisticsOverview => 'Profile statistics overview';

  @override
  String get profilePageHeader => 'Profile page header';

  @override
  String get profileSettings => 'Profile settings';

  @override
  String get tapToAccessProfileSettings => 'Tap to access profile settings';

  @override
  String get profilePictureForSandraGram => 'Profile picture for Sandra Gram';

  @override
  String get userName => 'User name';

  @override
  String get userLocationDenmarkCopenhagen =>
      'User location: Denmark, Copenhagen';

  @override
  String get userStatisticsAndActions => 'User statistics and actions';

  @override
  String get exportProfileData => 'Export profile data';

  @override
  String get tapToExportYourProfileInformation =>
      'Tap to export your profile information';

  @override
  String get editProfile => 'Edit profile';

  @override
  String get tapToEditYourProfileInformation =>
      'Tap to edit your profile information';

  @override
  String get navigateToSignIn => 'Navigate to sign in';

  @override
  String get onboardingSlides => 'Onboarding Slides';

  @override
  String get sandraGram => 'Sandra Gram';

  @override
  String get denmarkCopenhagen => 'Denmark, Copenhagen';

  @override
  String get welcomeToFitTrackPro => 'Welcome to \nFit Track Pro';

  @override
  String get welcomeDescription =>
      'Personalize your fitness journey with our comprehensive tracking app.';

  @override
  String get personalizedFitnessGoals => 'Personalized Fitness Goals';

  @override
  String get personalizedFitnessGoalsDescription =>
      'Create personalized fitness goals and track your progress towards a healthier you.';

  @override
  String get trackYourWorkouts => 'Track Your Workouts';

  @override
  String get trackYourWorkoutsDescription =>
      'Get insights, reminders, and celebrate your achievements along the way.';

  @override
  String get healthMetricsAndFitnessAnalytics =>
      'Health Metrics & Fitness Analytics';

  @override
  String get healthMetricsDescription =>
      'Monitor your health profile with ease.';

  @override
  String get nutritionAndDietGuidance => 'Nutrition & Diet\nGuidance';

  @override
  String get nutritionDescription =>
      'Lose weight and get fit with Fit Track Pro.';

  @override
  String get virtualAiCoachMentoring => 'Virtual AI Coach \nMentoring';

  @override
  String get virtualAiCoachDescription => 'Say goodbye to manual coaching.';

  @override
  String get upperStrength2 => 'Upper Strength 2';

  @override
  String get eightSeriesWorkout => '8 Series Workout';

  @override
  String get corePower => 'Core Power';

  @override
  String get sixSeriesWorkout => '6 Series Workout';

  @override
  String get cardioBlast => 'Cardio Blast';

  @override
  String get tenSeriesWorkout => '10 Series Workout';

  @override
  String get workouts => 'Workouts';

  @override
  String durationWithMinutes(int minutes) {
    return 'Duration: $minutes minutes';
  }

  @override
  String exercisesWithCount(int count) {
    return 'Exercises ($count)';
  }

  @override
  String get totalWorkouts => 'Total Workouts';

  @override
  String get sessions => 'sessions';

  @override
  String get caloriesBurned => 'Calories Burned';

  @override
  String get kcal => 'kcal';

  @override
  String get activeMinutes => 'Active Minutes';

  @override
  String get min => 'min';

  @override
  String get thisWeek => 'This Week';

  @override
  String get workoutsUnit => 'workouts';

  @override
  String get oneDay => '1 Day';

  @override
  String get oneWeek => '1 Week';

  @override
  String get oneMonth => '1 Month';

  @override
  String get threeMonths => '3 Months';

  @override
  String get sixMonths => '6 Months';

  @override
  String get twelveMonths => '12 Months';

  @override
  String get percentageUnit => ' %';

  @override
  String get rateUnit => ' rate';

  @override
  String get mlUnit => ' ml';

  @override
  String get kcalUnit => ' kcal';

  @override
  String get kmUnit => ' km';

  @override
  String get recentWorkouts => 'Recent Workouts';

  @override
  String get workoutPlans => 'Workout Plans';

  @override
  String get viewAll => 'View All';

  @override
  String workoutsWithCount(int count) {
    return 'Workouts ($count)';
  }

  @override
  String durationMinutes(int minutes) {
    return 'Duration: $minutes minutes';
  }

  @override
  String get follow => 'Follow';

  @override
  String get followers => 'Followers';

  @override
  String get following => 'Following';

  @override
  String signOutFailedWithError(String error) {
    return 'Sign out failed: $error';
  }
}
