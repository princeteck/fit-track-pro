import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/di/di.dart';

abstract class BaseCubitWrapper<T> extends Cubit<T> {
  BaseCubitWrapper(super.state);

  GetIt get injector => locator;

  void showLog(dynamic message) {
    debugPrint('[$runtimeType] $message');
  }
}
