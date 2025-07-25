import 'package:go_router/go_router.dart';

import '../../../presentation/screens/screens.dart';
import '../custom_route_builder.dart';
import '../custom_transition_page.dart';

final List<RouteBase> systemRoutes = [
  CustomRouteBuilder.route(
    path: LocaleSettingsScreen.path,
    name: LocaleSettingsScreen.name,
    builder: (context, state) => const LocaleSettingsScreen(),
    transitionType: TransitionType.slideFromRight,
    transitionDuration: const Duration(milliseconds: 600),
  ),
];
