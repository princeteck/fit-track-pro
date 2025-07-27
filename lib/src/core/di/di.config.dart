// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasources/auth_local_data_source.dart' as _i565;
import '../../data/datasources/auth_local_data_source_impl.dart' as _i515;
import '../../data/datasources/auth_remote_data_source.dart' as _i716;
import '../../data/datasources/auth_remote_data_source_impl.dart' as _i209;
import '../../data/datasources/database_helper.dart' as _i778;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/locale_repository_impl.dart' as _i579;
import '../../data/repositories/theme_repository_impl.dart' as _i858;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/repositories/locale_repository.dart' as _i369;
import '../../domain/repositories/theme_repository.dart' as _i964;
import '../../domain/usecase/enable_two_factor_auth_usecase.dart' as _i544;
import '../../domain/usecase/get_current_user_usecase.dart' as _i190;
import '../../domain/usecase/resend_verification_email_usecase.dart' as _i317;
import '../../domain/usecase/send_password_reset_email_usecase.dart' as _i1072;
import '../../domain/usecase/sign_in_with_email_password_usecase.dart' as _i518;
import '../../domain/usecase/sign_in_with_google_usecase.dart' as _i409;
import '../../domain/usecase/sign_in_with_instagram_usecase.dart' as _i873;
import '../../domain/usecase/sign_out_usecase.dart' as _i720;
import '../../domain/usecase/sign_up_with_email_password_usecase.dart' as _i33;
import '../../domain/usecase/verify_two_factor_code_usecase.dart' as _i549;
import '../../presentation/controllers/auth/auth_cubit.dart' as _i879;
import '../../presentation/controllers/bottom_navbar/bottom_navbar_cubit.dart'
    as _i338;
import '../../presentation/controllers/locale/locale_cubit.dart' as _i716;
import '../../presentation/controllers/splash/splash_cubit.dart' as _i820;
import '../../presentation/controllers/system/system_cubit.dart' as _i885;
import '../../presentation/controllers/walkthrough/walkthrough_cubit.dart'
    as _i219;
import '../services/app_startup_service.dart' as _i25;
import '../services/isolate_service.dart' as _i548;
import '../services/memory_manager_service.dart' as _i1014;
import '../services/prelude/prelude.dart' as _i913;
import '../services/services.dart' as _i264;
import '../storage/local_storage.dart' as _i329;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final services = _$Services();
  gh.factory<_i879.AuthCubit>(() => _i879.AuthCubit());
  gh.singleton<_i329.LocalStorage>(() => _i329.LocalStorage());
  gh.singleton<_i1014.MemoryManagerService>(
    () => _i1014.MemoryManagerService(),
  );
  gh.singleton<_i548.IsolateService>(() => _i548.IsolateService());
  gh.singleton<_i913.NavigationService>(() => services.navigationService);
  gh.singleton<_i778.DatabaseHelper>(() => _i778.DatabaseHelper());
  gh.singleton<_i885.SystemCubit>(() => _i885.SystemCubit());
  gh.singleton<_i338.BottomNavbarCubit>(() => _i338.BottomNavbarCubit());
  gh.lazySingleton<_i716.LocaleCubit>(() => _i716.LocaleCubit());
  gh.factory<_i716.AuthRemoteDataSource>(
    () => _i209.AuthRemoteDataSourceImpl(),
  );
  gh.factory<_i369.LocaleRepository>(() => _i579.LocaleRepositoryImpl());
  gh.factory<_i964.ThemeRepository>(() => _i858.ThemeRepositoryImpl());
  gh.factory<_i565.AuthLocalDataSource>(
    () => _i515.AuthLocalDataSourceImpl(
      gh<_i778.DatabaseHelper>(),
      gh<_i548.IsolateService>(),
      gh<_i1014.MemoryManagerService>(),
    ),
  );
  gh.singleton<_i25.AppStartupService>(
    () => _i25.AppStartupService(
      gh<_i329.LocalStorage>(),
      gh<_i565.AuthLocalDataSource>(),
    ),
  );
  gh.singleton<_i820.SplashCubit>(
    () => _i820.SplashCubit(
      gh<_i25.AppStartupService>(),
      gh<_i1014.MemoryManagerService>(),
    ),
  );
  gh.singleton<_i219.WalkthroughCubit>(
    () => _i219.WalkthroughCubit(gh<_i25.AppStartupService>()),
  );
  gh.factory<_i1073.AuthRepository>(
    () => _i895.AuthRepositoryImpl(
      gh<_i716.AuthRemoteDataSource>(),
      gh<_i565.AuthLocalDataSource>(),
    ),
  );
  gh.factory<_i544.EnableTwoFactorAuthUseCase>(
    () => _i544.EnableTwoFactorAuthUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i317.ResendVerificationEmailUseCase>(
    () => _i317.ResendVerificationEmailUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i33.SignUpWithEmailAndPasswordUseCase>(
    () => _i33.SignUpWithEmailAndPasswordUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i549.VerifyTwoFactorCodeUseCase>(
    () => _i549.VerifyTwoFactorCodeUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i409.SignInWithGoogleUseCase>(
    () => _i409.SignInWithGoogleUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i518.SignInWithEmailAndPasswordUseCase>(
    () => _i518.SignInWithEmailAndPasswordUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i1072.SendPasswordResetEmailUseCase>(
    () => _i1072.SendPasswordResetEmailUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i190.GetCurrentUserUseCase>(
    () => _i190.GetCurrentUserUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i720.SignOutUseCase>(
    () => _i720.SignOutUseCase(gh<_i1073.AuthRepository>()),
  );
  gh.factory<_i873.SignInWithInstagramUseCase>(
    () => _i873.SignInWithInstagramUseCase(gh<_i1073.AuthRepository>()),
  );
  return getIt;
}

class _$Services extends _i264.Services {}
