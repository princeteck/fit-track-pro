import 'package:flutter/material.dart' show BuildContext;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../base/base_cubit_wrapper.dart';

part 'system_state.dart';
part 'system_cubit.freezed.dart';

@singleton
class SystemCubit extends BaseCubitWrapper<SystemState> {
  SystemCubit() : super(const SystemState());

  Future<void> init({required BuildContext context}) async {}
}
