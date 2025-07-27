import 'package:flutter/material.dart' show BuildContext;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../base/base_cubit_wrapper.dart';

part 'system_state.dart';
part 'system_cubit.freezed.dart';

@singleton
class SystemCubit extends BaseCubitWrapper<SystemState> {
  SystemCubit() : super(const SystemState()) {
    _loadAppInfo();
  }

  Future<void> init({required BuildContext context}) async {}

  Future<void> _loadAppInfo() async {
    emit(state.copyWith(isLoading: true));

    try {
      final packageInfo = await PackageInfo.fromPlatform();

      emit(
        state.copyWith(
          appName: packageInfo.appName,
          appVersion: packageInfo.version,
          buildNumber: packageInfo.buildNumber,
          isLoading: false,
        ),
      );
    } catch (e) {
      // Fallback values if package info fails to load
      emit(
        state.copyWith(
          appName: 'Fit Track Pro',
          appVersion: '0.0.1',
          buildNumber: '1',
          isLoading: false,
        ),
      );
    }
  }

  String get appDisplayVersion {
    if (state.appName.isEmpty || state.appVersion.isEmpty) {
      return 'Fit Track Pro v0.0.1';
    }
    return '${state.appName} v${state.appVersion}';
  }
}
