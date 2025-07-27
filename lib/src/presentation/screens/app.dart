import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../core/di/di.dart';
import '../../core/locale/generated/app_localizations.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_theme.dart';
import '../controllers/controllers.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    // Initialize theme after the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locator<SystemCubit>().initializeTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      bloc: locator<LocaleCubit>(),
      builder: (context, localeState) {
        return BlocBuilder<SystemCubit, SystemState>(
          bloc: locator<SystemCubit>(),
          builder: (context, systemState) {
            return MaterialApp.router(
              title: 'Fit Track Pro',
              routerConfig: AppRoutes.router,
              locale: localeState.locale,
              supportedLocales: locator<LocaleCubit>().supportedLocales,
              themeMode: systemState.themeMode.themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                if (localeState.locale != null) return localeState.locale;
                for (var supported in supportedLocales) {
                  if (supported.languageCode == locale?.languageCode) {
                    return supported;
                  }
                }
                return supportedLocales.first;
              },
            );
          },
        );
      },
    );
  }
}
