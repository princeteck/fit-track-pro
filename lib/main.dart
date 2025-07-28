import 'dart:async' show runZonedGuarded;

import 'package:flutter/material.dart';

import 'src/core/di/di.dart';
import 'src/core/locale/l10n.dart';
import 'src/core/services/memory_manager_service.dart';
import 'src/presentation/screens/app.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Configure dependencies first
      await configureDependencies();

      // Initialize L10n and start memory monitoring in parallel
      await Future.wait([
        L10n.initialize(),
        Future.microtask(
          () => locator<MemoryManagerService>().startMemoryMonitoring(),
        ),
      ]);

      runApp(const App());
    },
    (error, stackTrace) {
      debugPrint('Error in main: $error');
      debugPrint('Stack trace: $stackTrace');
    },
  );
}
