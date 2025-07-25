// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get hello => 'مرحبا';

  @override
  String greetUser(Object username) {
    return 'أهلا بك، $username!';
  }

  @override
  String get appTitle => 'Fit Track Pro';

  @override
  String get appDescription => 'متعقب اللياقة البدنية الشخصي الخاص بك';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get signUpButton => 'إنشاء حساب';

  @override
  String get logoutButton => 'تسجيل الخروج';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get profileTitle => 'الملف الشخصي';

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get errorNetwork => 'خطأ في الشبكة، يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get errorInvalidCredentials =>
      'اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get errorUserNotFound => 'لم يتم العثور على المستخدم.';

  @override
  String get errorGeneric => 'حدث خطأ، يرجى المحاولة مرة أخرى.';

  @override
  String get localeSettingsTitle => 'إعدادات اللغة';

  @override
  String get localeSettingsDescription => 'حدد لغتك المفضلة للتطبيق.';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get walkthroughTitle1 => 'تتبع لياقتك البدنية';

  @override
  String get walkthroughDescription1 =>
      'راقب أنشطتك اليومية وتمارينك ومقاييس صحتك في مكان واحد.';

  @override
  String get walkthroughTitle2 => 'حدد الأهداف وحققها';

  @override
  String get walkthroughDescription2 =>
      'اصنع أهداف لياقة شخصية وتتبع تقدمك نحو نسخة أكثر صحة منك.';

  @override
  String get walkthroughTitle3 => 'حافظ على تحفيزك';

  @override
  String get walkthroughDescription3 =>
      'احصل على رؤى وتذكيرات واحتفل بإنجازاتك على طول الطريق.';

  @override
  String get skipButton => 'تخطي';

  @override
  String get nextButton => 'التالي';

  @override
  String get letsGetStartedButton => 'لنبدأ';

  @override
  String get finishButton => 'إنهاء';
}
