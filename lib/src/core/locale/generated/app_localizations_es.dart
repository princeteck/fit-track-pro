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
  String get appTitle => 'FitTrack Pro';

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
}
