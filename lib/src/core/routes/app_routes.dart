import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uih/uih.dart';

import '../../presentation/screens/screens.dart';
import '../di/di.dart';
import '../services/prelude/navigator_service.dart';
import 'prelude/prelude.dart';

class AppRoutes {
  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      Scaffold(
        body: Center(
          child: Text(
            'No route defined for ${state.uri.toString()} ',
            style: context.textTheme.titleLarge,
          ),
        ),
      );
  static final GoRouter _router = GoRouter(
    errorBuilder: errorWidget,
    initialLocation: SplashScreen.path,
    routes: <RouteBase>[...authRoutes, ...commonRoutes, ...systemRoutes],
    redirect: (context, state) async {
      debugPrint('Redirecting ${state.uri.toString()}');
      return state.name;
    },
    navigatorKey: locator<NavigationService>().navigatorKey,
    observers: [routeObserver],
  );

  static GoRouter get router => _router;
}
