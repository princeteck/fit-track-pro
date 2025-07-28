import 'package:flutter/material.dart';

/// Enhanced transition page that provides multiple transition types for all routes
class EnhancedTransitionPage<T> extends Page<T> {
  const EnhancedTransitionPage({
    required this.child,
    this.transitionDuration = const Duration(milliseconds: 600),
    this.reverseTransitionDuration,
    this.transitionType = TransitionType.slideFromRight,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final Duration transitionDuration;
  final Duration? reverseTransitionDuration;
  final TransitionType transitionType;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: transitionDuration,
      reverseTransitionDuration:
          reverseTransitionDuration ?? transitionDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(animation, secondaryAnimation, child);
      },
    );
  }

  Widget _buildTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (transitionType) {
      case TransitionType.slideFromRight:
        return _slideFromRight(animation, child);
      case TransitionType.slideFromLeft:
        return _slideFromLeft(animation, child);
      case TransitionType.slideFromBottom:
        return _slideFromBottom(animation, child);
      case TransitionType.slideFromTop:
        return _slideFromTop(animation, child);
      case TransitionType.fade:
        return _fade(animation, child);
      case TransitionType.scale:
        return _scale(animation, child);
      case TransitionType.fadeScale:
        return _fadeScale(animation, child);
      case TransitionType.fadeForwards:
        return _fadeForwards(animation, secondaryAnimation, child);
    }
  }

  Widget _slideFromRight(Animation<double> animation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }

  Widget _slideFromLeft(Animation<double> animation, Widget child) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }

  Widget _slideFromBottom(Animation<double> animation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.easeOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }

  Widget _slideFromTop(Animation<double> animation, Widget child) {
    const begin = Offset(0.0, -1.0);
    const end = Offset.zero;
    const curve = Curves.easeOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }

  Widget _fade(Animation<double> animation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  Widget _scale(Animation<double> animation, Widget child) {
    const curve = Curves.easeInOut;
    var tween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

    return ScaleTransition(scale: animation.drive(tween), child: child);
  }

  Widget _fadeScale(Animation<double> animation, Widget child) {
    const curve = Curves.easeInOut;
    var scaleTween = Tween(
      begin: 0.95,
      end: 1.0,
    ).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(scale: animation.drive(scaleTween), child: child),
    );
  }

  Widget _fadeForwards(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Use FadeForwardsPageTransitionsBuilder logic
    // This creates a fade transition similar to Material Design forward transitions
    const transitionsBuilder = FadeForwardsPageTransitionsBuilder();
    return transitionsBuilder.buildTransitions<T>(
      null, // route - not needed for this implementation
      null, // context - not needed for this implementation
      animation,
      secondaryAnimation,
      child,
    );
  }
}

/// Enum for different transition types
enum TransitionType {
  slideFromRight,
  slideFromLeft,
  slideFromBottom,
  slideFromTop,
  fade,
  scale,
  fadeScale,
  fadeForwards,
}
