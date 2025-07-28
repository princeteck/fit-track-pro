class KImages {
  static const String appIcon = 'assets/images/app_icon.png';

  // Base path for onboarding images
  static const String onboarding = 'assets/images/walkthrough';

  static const String onboarding1 = 'assets/images/walkthrough/1.webp';
  static const String onboarding2 = 'assets/images/walkthrough/2.webp';
  static const String onboarding3 = 'assets/images/walkthrough/3.webp';
  static const String onboarding4 = 'assets/images/walkthrough/4.webp';
  static const String onboarding5 = 'assets/images/walkthrough/5.webp';
  static const String onboarding6 = 'assets/images/walkthrough/6.webp';

  // Helper method to get onboarding image by index (1-based)
  static String getOnboardingImage(int index) {
    switch (index) {
      case 1:
        return onboarding1;
      case 2:
        return onboarding2;
      case 3:
        return onboarding3;
      case 4:
        return onboarding4;
      case 5:
        return onboarding5;
      case 6:
        return onboarding6;
      default:
        return onboarding1; // Default to first image
    }
  }
}

class KIcons {
  static const String _basePath = 'assets/icons';

  // Authentication related icons
  static const String email = '$_basePath/email.svg';
  static const String lockClose = '$_basePath/lock-close.svg';
  static const String lockOpen = '$_basePath/lock-open.svg';
  static const String eye = '$_basePath/eye.svg';
  static const String eyeSlash = '$_basePath/eye-slash.svg';
  static const String user = '$_basePath/user.svg';

  // Social login icons
  static const String google = '$_basePath/google.svg';
  static const String apple = '$_basePath/apple.svg';
  static const String fb = '$_basePath/fb.svg';

  // Navigation icons
  static const String arrowLeft = '$_basePath/arrow-left.svg';
  static const String arrowRight = '$_basePath/arrow-right.svg';
  static const String arrowLineLeft = '$_basePath/arrow-line-left.svg';
  static const String arrowLineRight = '$_basePath/arrow-line-right.svg';
  static const String arrowLineUp = '$_basePath/arrow-line-up.svg';
  static const String arrowLineDown = '$_basePath/arrow-line-down.svg';

  // Main navigation icons
  static const String home = '$_basePath/home.svg';
  static const String chart = '$_basePath/chart.svg';
  static const String chartCircular = '$_basePath/chart-circular.svg';
  static const String grid = '$_basePath/grid.svg';
  static const String category = '$_basePath/category.svg';
  static const String setting = '$_basePath/setting.svg';

  // Feature icons
  static const String search = '$_basePath/search.svg';
  static const String fire = '$_basePath/fire.svg';
  static const String infinite = '$_basePath/infinite.svg';
  static const String heart = '$_basePath/heart.svg';
  static const String heartSolid = '$_basePath/heart-solid.svg';
  static const String bpmRead = '$_basePath/bpm-read.svg';
  static const String star = '$_basePath/star.svg';
  static const String trophy = '$_basePath/trophy.svg';
  static const String spark = '$_basePath/spark.svg';
  static const String sparkSolid = '$_basePath/spark-solid.svg';
  static const String edit = '$_basePath/edit.svg';
  static const String documentText = '$_basePath/document-text.svg';
  static const String slideHorizontal = '$_basePath/slide-horizontal.svg';
  static const String mcScore = '$_basePath/mc-score.svg';
  static const String mcHydration = '$_basePath/mc-hydration.svg';
  static const String mcCalories = '$_basePath/mc-calories.svg';
  static const String drop = '$_basePath/drop.svg';

  // Export icons
  static const String export = '$_basePath/export.svg';
  static const String exportUp = '$_basePath/export-up.svg';

  // Misc icons
  static const String logo = '$_basePath/logo.svg';
  static const String routing = '$_basePath/routing.svg';
  static const String instagram = '$_basePath/instagram.svg';
}
