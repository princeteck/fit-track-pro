// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get hello => 'Hola';

  @override
  String greetUser(Object username) {
    return '¡Bienvenido, $username!';
  }

  @override
  String get appTitle => 'Fit Track Pro';

  @override
  String get appDescription => 'Tu rastreador de fitness personal';

  @override
  String get loginButton => 'Iniciar sesión';

  @override
  String get signUpButton => 'Registrarse';

  @override
  String get logoutButton => 'Cerrar sesión';

  @override
  String get settingsTitle => 'Configuraciones';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get errorNetwork =>
      'Error de red, por favor intente nuevamente más tarde.';

  @override
  String get errorInvalidCredentials =>
      'Nombre de usuario o contraseña inválidos.';

  @override
  String get errorUserNotFound => 'Usuario no encontrado.';

  @override
  String get errorGeneric => 'Ocurrió un error, por favor intente nuevamente.';

  @override
  String get localeSettingsTitle => 'Configuración de Idioma';

  @override
  String get localeSettingsDescription =>
      'Seleccione su idioma preferido para la aplicación.';

  @override
  String get selectLanguage => 'Seleccionar Idioma';

  @override
  String get walkthroughTitle1 => 'Rastrea Tu Fitness';

  @override
  String get walkthroughDescription1 =>
      'Monitorea tus actividades diarias, entrenamientos y métricas de salud en un solo lugar.';

  @override
  String get walkthroughTitle2 => 'Establece Metas y Alcánzalas';

  @override
  String get walkthroughDescription2 =>
      'Crea objetivos de fitness personalizados y rastrea tu progreso hacia una versión más saludable.';

  @override
  String get walkthroughTitle3 => 'Mantente Motivado';

  @override
  String get walkthroughDescription3 =>
      'Obtén información, recordatorios y celebra tus logros en el camino.';

  @override
  String get skipButton => 'Omitir';

  @override
  String get nextButton => 'Siguiente';

  @override
  String get letsGetStartedButton => 'Empecemos';

  @override
  String get finishButton => 'Finalizar';

  @override
  String get forgotPasswordTitle => '¿Olvidaste tu contraseña?';

  @override
  String get forgotPasswordSubtitle =>
      'Ingresa tu dirección de correo electrónico y te enviaremos un enlace para restablecer tu contraseña';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get emailHint => 'Ingresa tu dirección de correo electrónico';

  @override
  String get emailRequired => 'El correo electrónico es requerido';

  @override
  String get emailInvalid => 'Por favor ingresa un correo electrónico válido';

  @override
  String get sendResetLinkButton => 'Enviar enlace de restablecimiento';

  @override
  String get backToSignInButton => 'Volver al inicio de sesión';

  @override
  String get passwordResetEmailSent =>
      '¡Correo de restablecimiento de contraseña enviado! Revisa tu bandeja de entrada.';

  @override
  String get passwordResetEmailFailed =>
      'Error al enviar correo de restablecimiento';

  @override
  String get welcomeBackTitle => '¡Bienvenido de nuevo!';

  @override
  String get signInSubtitle =>
      'Inicia sesión para continuar tu viaje de fitness';

  @override
  String get dontHaveAccountText => '¿No tienes una cuenta? ';

  @override
  String get signInButtonText => 'Iniciar sesión';

  @override
  String get createAccountTitle => 'Crear cuenta';

  @override
  String get signUpSubtitle =>
      'Únete a nosotros y comienza tu viaje de fitness hoy';

  @override
  String get alreadyHaveAccountText => '¿Ya tienes una cuenta? ';

  @override
  String get signUpButtonText => 'Registrarse';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => 'Ingresa tu contraseña';

  @override
  String get passwordRequired => 'La contraseña es requerida';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get passwordStrong => 'La contraseña debe tener al menos 8 caracteres';

  @override
  String get passwordComplexity =>
      'La contraseña debe contener mayúsculas, minúsculas y números';

  @override
  String get confirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get confirmPasswordHint => 'Confirma tu contraseña';

  @override
  String get confirmPasswordRequired => 'Por favor confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get forgotPasswordLink => '¿Olvidaste tu contraseña?';

  @override
  String get orText => 'o';

  @override
  String get appleSignInSoon => 'Inicio de sesión con Apple próximamente';

  @override
  String get loginFailed => 'Error al iniciar sesión';

  @override
  String get signUpFailed => 'Error al registrarse';

  @override
  String get accountCreatedSuccess => '¡Cuenta creada exitosamente!';

  @override
  String get createAccountButton => 'Crear cuenta';

  @override
  String get enterYourEmail => 'Ingresa tu correo electrónico';

  @override
  String get enterYourPassword => 'Ingresa tu contraseña';

  @override
  String get createStrongPassword => 'Crea una contraseña segura';

  @override
  String get termsAndConditions =>
      'Al crear una cuenta, aceptas nuestros Términos de Servicio y Política de Privacidad';

  @override
  String get profileGeneral => 'General';

  @override
  String get profileNotifications => 'Notificaciones';

  @override
  String get profilePersonalInfo => 'Información Personal';

  @override
  String get profileCoachContact => 'Contacto del Entrenador';

  @override
  String get profileLanguage => 'Idioma';

  @override
  String get profileLanguageValue => 'Español (ES)';

  @override
  String get profileDarkMode => 'Tema';

  @override
  String get profileLinkedDevices => 'Dispositivos Vinculados';

  @override
  String get profileLinkedDevicesValue => 'Apple Watch';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeDescription => 'Elige tu modo de tema preferido';

  @override
  String get themeLightTitle => 'Claro';

  @override
  String get themeLightSubtitle => 'Usar tema claro';

  @override
  String get themeDarkTitle => 'Oscuro';

  @override
  String get themeDarkSubtitle => 'Usar tema oscuro';

  @override
  String get themeSystemTitle => 'Sistema';

  @override
  String get themeSystemSubtitle => 'Seguir configuración del sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get profileSecurityPrivacy => 'Seguridad y Privacidad';

  @override
  String get profileMainSecurity => 'Seguridad Principal';

  @override
  String get profileEnableBiometric => 'Habilitar Biométrico';

  @override
  String get profilePrivacyPolicy => 'Política de Privacidad';

  @override
  String get profileHelpSupport => 'Ayuda y Soporte';

  @override
  String get profileAboutUs => 'Acerca de Nosotros';

  @override
  String get profileHelpCenter => 'Centro de Ayuda';

  @override
  String get profileSubmitFeedback => 'Enviar Comentarios';

  @override
  String get profileDangerZone => 'Zona de Peligro';

  @override
  String get profileCloseAccount => 'Cerrar Cuenta';

  @override
  String get profileLogOut => 'Cerrar Sesión';

  @override
  String get profileSignOut => 'Cerrar Sesión';

  @override
  String get profileSignOutTitle => 'Cerrar Sesión';

  @override
  String get profileSignOutMessage =>
      '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get profileCancel => 'Cancelar';

  @override
  String get profileSignOutFailed => 'Error al cerrar sesión';

  @override
  String get profileBeta => 'Beta';

  @override
  String get profileWarning => 'Advertencia';

  @override
  String profileRightsReserved(Object year) {
    return '© $year Derechos Reservados';
  }

  @override
  String profileLoading(Object loadingIndication) {
    return 'Cargando$loadingIndication';
  }

  @override
  String get fitnessMetricsTitle => 'Métricas de Fitness';

  @override
  String get viewAllText => 'Ver Todo';

  @override
  String get stepsLabel => 'Pasos';

  @override
  String get hydrationLabel => 'Hidratación';

  @override
  String get caloriesLabel => 'Calorías';

  @override
  String get distanceLabel => 'Distancia';

  @override
  String get scoreLabel => 'Puntuación';

  @override
  String get sleepLabel => 'Sueño';

  @override
  String get bmiLabel => 'IMC';

  @override
  String get bpmLabel => 'FCM';

  @override
  String get calorieLabel => 'Caloría';

  @override
  String get stats => 'Estadísticas';

  @override
  String get heartRateLabel => 'Frecuencia Cardíaca';
}
