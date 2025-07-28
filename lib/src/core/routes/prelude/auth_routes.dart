import 'package:go_router/go_router.dart';

import '../../../presentation/screens/screens.dart';
import '../custom_route_builder.dart';
import '../custom_transition_page.dart';

final List<RouteBase> authRoutes = [
  CustomRouteBuilder.route(
    path: SignInScreen.path,
    name: SignInScreen.name,
    builder: (context, state) => const SignInScreen(),
    transitionType: TransitionType.slideFromRight,
    transitionDuration: const Duration(milliseconds: 600),
  ),
  CustomRouteBuilder.route(
    path: SignUpScreen.path,
    name: SignUpScreen.name,
    builder: (context, state) => const SignUpScreen(),
    transitionType: TransitionType.slideFromRight,
    transitionDuration: const Duration(milliseconds: 600),
  ),
  CustomRouteBuilder.route(
    path: ForgotPasswordScreen.path,
    name: ForgotPasswordScreen.name,
    builder: (context, state) => const ForgotPasswordScreen(),
    transitionType: TransitionType.slideFromRight,
    transitionDuration: const Duration(milliseconds: 600),
  ),
];
