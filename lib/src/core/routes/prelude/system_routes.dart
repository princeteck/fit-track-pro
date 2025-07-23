import 'package:go_router/go_router.dart';

import '../../../presentation/screens/screens.dart';

final List<RouteBase> systemRoutes = [
  GoRoute(
    path: LocaleSettingsScreen.path,
    name: LocaleSettingsScreen.name,
    builder: (context, state) => const LocaleSettingsScreen(),
  ),
];
