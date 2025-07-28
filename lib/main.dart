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

      await configureDependencies();

      await L10n.initialize();

      locator<MemoryManagerService>().startMemoryMonitoring();

      runApp(const App());
    },
    (error, stackTrace) {
      debugPrint('Error in main: $error');
      debugPrint('Stack trace: $stackTrace');
    },
  );
}
