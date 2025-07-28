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
  CustomRouteBuilder.fadeRoute(
    path: WalkthroughScreen.path,
    name: WalkthroughScreen.name,
    builder: (context, state) => const WalkthroughScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  CustomRouteBuilder.fadeRoute(
    path: DashboardScreen.path,
    name: DashboardScreen.name,
    builder: (context, state) => const DashboardScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  CustomRouteBuilder.fadeForwardsRoute(
    path: HeartStatsDashboard.path,
    name: HeartStatsDashboard.name,
    builder: (context, state) => const HeartStatsDashboard(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  CustomRouteBuilder.fadeForwardsRoute(
    path: WorkoutStatsDashboard.path,
    name: WorkoutStatsDashboard.name,
    builder: (context, state) => const WorkoutStatsDashboard(),
  ),
  CustomRouteBuilder.modalRoute(
    path: WorkoutSessionScreen.path,
    name: WorkoutSessionScreen.name,
    builder: (context, state) {
      final durationSeconds =
          int.tryParse(state.uri.queryParameters['duration'] ?? '1800') ?? 1800;
      return WorkoutSessionScreen(
        workoutDuration: Duration(seconds: durationSeconds),
      );
    },
    transitionDuration: const Duration(milliseconds: 600),
  ),
];
