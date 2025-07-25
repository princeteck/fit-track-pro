import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_transition_page.dart';

/// Utility class for creating routes with automatic custom transitions
class CustomRouteBuilder {
  /// Creates a GoRoute with automatic custom transition
  static GoRoute route({
    required String path,
    required String name,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    TransitionType transitionType = TransitionType.slideFromRight,
    Duration transitionDuration = const Duration(milliseconds: 600),
    List<RouteBase>? routes,
  }) {
    return GoRoute(
      path: path,
      name: name,
      routes: routes ?? [],
      pageBuilder: (context, state) => EnhancedTransitionPage<void>(
        key: state.pageKey,
        child: builder(context, state),
        transitionDuration: transitionDuration,
        transitionType: transitionType,
      ),
    );
  }

  /// Creates a GoRoute with fade transition
  static GoRoute fadeRoute({
    required String path,
    required String name,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    Duration transitionDuration = const Duration(milliseconds: 600),
    List<RouteBase>? routes,
  }) {
    return route(
      path: path,
      name: name,
      builder: builder,
      transitionType: TransitionType.fade,
      transitionDuration: transitionDuration,
      routes: routes,
    );
  }

  /// Creates a GoRoute with slide from bottom transition (good for modals)
  static GoRoute modalRoute({
    required String path,
    required String name,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    Duration transitionDuration = const Duration(milliseconds: 400),
    List<RouteBase>? routes,
  }) {
    return route(
      path: path,
      name: name,
      builder: builder,
      transitionType: TransitionType.slideFromBottom,
      transitionDuration: transitionDuration,
      routes: routes,
    );
  }

  /// Creates a GoRoute with scale transition
  static GoRoute scaleRoute({
    required String path,
    required String name,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    Duration transitionDuration = const Duration(milliseconds: 500),
    List<RouteBase>? routes,
  }) {
    return route(
      path: path,
      name: name,
      builder: builder,
      transitionType: TransitionType.scale,
      transitionDuration: transitionDuration,
      routes: routes,
    );
  }

  /// Creates a GoRoute with fade + scale transition (good for splash screens)
  static GoRoute fadeScaleRoute({
    required String path,
    required String name,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    Duration transitionDuration = const Duration(milliseconds: 600),
    List<RouteBase>? routes,
  }) {
    return route(
      path: path,
      name: name,
      builder: builder,
      transitionType: TransitionType.fadeScale,
      transitionDuration: transitionDuration,
      routes: routes,
    );
  }
}
