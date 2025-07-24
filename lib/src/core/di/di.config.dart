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

import '../../data/repositories/locale_repository_impl.dart' as _i579;
import '../../domain/repositories/locale_repository.dart' as _i369;
import '../../presentation/controllers/locale/locale_cubit.dart' as _i716;
import '../../presentation/controllers/system/system_cubit.dart' as _i885;
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
  gh.singleton<_i885.SystemCubit>(() => _i885.SystemCubit());
  gh.singleton<_i329.LocalStorage>(() => _i329.LocalStorage());
  gh.singleton<_i913.NavigationService>(() => services.navigationService);
  gh.lazySingleton<_i716.LocaleCubit>(() => _i716.LocaleCubit());
  gh.factory<_i369.LocaleRepository>(() => _i579.LocaleRepositoryImpl());
  return getIt;
}

class _$Services extends _i264.Services {}
