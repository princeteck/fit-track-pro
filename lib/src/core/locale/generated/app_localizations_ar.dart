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

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور؟';

  @override
  String get forgotPasswordSubtitle =>
      'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailHint => 'أدخل عنوان بريدك الإلكتروني';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get emailInvalid => 'يرجى إدخال بريد إلكتروني صحيح';

  @override
  String get sendResetLinkButton => 'إرسال رابط الإعادة';

  @override
  String get backToSignInButton => 'العودة إلى تسجيل الدخول';

  @override
  String get passwordResetEmailSent =>
      'تم إرسال بريد إعادة تعيين كلمة المرور! تحقق من صندوق الوارد.';

  @override
  String get passwordResetEmailFailed => 'فشل في إرسال بريد الإعادة';

  @override
  String get welcomeBackTitle => 'مرحباً بعودتك!';

  @override
  String get signInSubtitle => 'سجل الدخول لمواصلة رحلة اللياقة البدنية';

  @override
  String get dontHaveAccountText => 'ليس لديك حساب؟ ';

  @override
  String get signInButtonText => 'تسجيل الدخول';

  @override
  String get createAccountTitle => 'إنشاء حساب';

  @override
  String get signUpSubtitle => 'انضم إلينا وابدأ رحلة اللياقة البدنية اليوم';

  @override
  String get alreadyHaveAccountText => 'لديك حساب بالفعل؟ ';

  @override
  String get signUpButtonText => 'إنشاء حساب';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMinLength => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get passwordStrong => 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';

  @override
  String get passwordComplexity =>
      'يجب أن تحتوي كلمة المرور على أحرف كبيرة وصغيرة ورقم';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أكد كلمة المرور';

  @override
  String get confirmPasswordRequired => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get forgotPasswordLink => 'نسيت كلمة المرور؟';

  @override
  String get orText => 'أو';

  @override
  String get appleSignInSoon => 'تسجيل الدخول بـ Apple قريباً';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get signUpFailed => 'فشل إنشاء الحساب';

  @override
  String get accountCreatedSuccess => 'تم إنشاء الحساب بنجاح!';

  @override
  String get createAccountButton => 'إنشاء حساب';

  @override
  String get enterYourEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get createStrongPassword => 'اصنع كلمة مرور قوية';

  @override
  String get termsAndConditions =>
      'بإنشاء حساب، أنت توافق على شروط الخدمة وسياسة الخصوصية';

  @override
  String get profileGeneral => 'عام';

  @override
  String get profileNotifications => 'الإشعارات';

  @override
  String get profilePersonalInfo => 'المعلومات الشخصية';

  @override
  String get profileCoachContact => 'تواصل مع المدرب';

  @override
  String get profileLanguage => 'اللغة';

  @override
  String get profileLanguageValue => 'العربية (AR)';

  @override
  String get profileDarkMode => 'المظهر';

  @override
  String get profileLinkedDevices => 'الأجهزة المرتبطة';

  @override
  String get profileLinkedDevicesValue => 'Apple Watch';

  @override
  String get themeTitle => 'المظهر';

  @override
  String get themeDescription => 'اختر وضع المظهر المفضل لديك';

  @override
  String get themeLightTitle => 'فاتح';

  @override
  String get themeLightSubtitle => 'استخدام المظهر الفاتح';

  @override
  String get themeDarkTitle => 'مظلم';

  @override
  String get themeDarkSubtitle => 'استخدام المظهر المظلم';

  @override
  String get themeSystemTitle => 'النظام';

  @override
  String get themeSystemSubtitle => 'اتبع إعداد النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'مظلم';

  @override
  String get themeSystem => 'النظام';

  @override
  String get profileSecurityPrivacy => 'الأمان والخصوصية';

  @override
  String get profileMainSecurity => 'الأمان الرئيسي';

  @override
  String get profileEnableBiometric => 'تفعيل البصمة الحيوية';

  @override
  String get profilePrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get profileHelpSupport => 'المساعدة والدعم';

  @override
  String get profileAboutUs => 'معلومات عنا';

  @override
  String get profileHelpCenter => 'مركز المساعدة';

  @override
  String get profileSubmitFeedback => 'إرسال تعليق';

  @override
  String get profileDangerZone => 'المنطقة الخطرة';

  @override
  String get profileCloseAccount => 'إغلاق الحساب';

  @override
  String get profileLogOut => 'تسجيل الخروج';

  @override
  String get profileSignOut => 'تسجيل الخروج';

  @override
  String get profileSignOutTitle => 'تسجيل الخروج';

  @override
  String get profileSignOutMessage => 'هل أنت متأكد من أنك تريد تسجيل الخروج؟';

  @override
  String get profileCancel => 'إلغاء';

  @override
  String get profileSignOutFailed => 'فشل في تسجيل الخروج';

  @override
  String get profileBeta => 'تجريبي';

  @override
  String get profileWarning => 'تحذير';

  @override
  String profileRightsReserved(Object year) {
    return '© $year جميع الحقوق محفوظة';
  }

  @override
  String profileLoading(Object loadingIndication) {
    return 'جاري التحميل$loadingIndication';
  }
}
