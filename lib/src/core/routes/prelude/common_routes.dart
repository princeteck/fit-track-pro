import 'package:go_router/go_router.dart';

import '../../../presentation/screens/screens.dart';
import '../custom_route_builder.dart';

final List<RouteBase> commonRoutes = [
  CustomRouteBuilder.fadeRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
];
