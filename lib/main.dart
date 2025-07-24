import 'dart:async' show runZonedGuarded;

import 'package:flutter/material.dart';

import 'src/core/di/di.dart';
import 'src/presentation/screens/app.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Configure dependency injection
      await configureDependencies();

      runApp(const App());
    },
    (error, stackTrace) {
      debugPrint(error.toString());
    },
  );
}
