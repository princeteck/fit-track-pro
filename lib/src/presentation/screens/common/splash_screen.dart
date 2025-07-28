import 'package:fittrack_pro/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animations/animations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/di/di.dart';
import '../../../core/constants/ui/assets_constants.dart';
import '../../../core/services/app_startup_service.dart';
import '../../controllers/splash/splash_cubit.dart';
import '../screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const path = '/splash';
  static const name = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SplashCubit>()..initializeSplash(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 5),
              ),
            );
          } else if (state.isComplete && state.dependenciesReady) {
            _navigateToInitialRoute(context, state.initialRoute);
          }
        },
        child: const _SplashScreenView(),
      ),
    );
  }

  void _navigateToInitialRoute(BuildContext context, AppStartupResult? result) {
    switch (result) {
      case AppStartupResult.onboarding:
        context.goNamed(WalkthroughScreen.name);
        break;
      case AppStartupResult.signIn:
        context.goNamed(SignInScreen.name);
        break;
      case AppStartupResult.dashboard:
        context.goNamed(DashboardScreen.name);
        break;
      case null:
        // Fallback to onboarding if result is null
        context.goNamed(WalkthroughScreen.name);
        break;
    }
  }
}

class _SplashScreenView extends StatefulWidget {
  const _SplashScreenView();

  @override
  State<_SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<_SplashScreenView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _gradientController;
  late AnimationController _blobController;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    // Reduce animation duration and complexity
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000), // Reduced from 4000
      vsync: this,
    );

    _gradientController = AnimationController(
      duration: const Duration(milliseconds: 3000), // Reduced from 5000
      vsync: this,
    );

    _blobController = AnimationController(
      duration: const Duration(milliseconds: 4000), // Reduced from 6000
      vsync: this,
    );

    // Start animations with staggered delays to reduce initial load
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _animationController.forward().then((_) {
          if (mounted) {
            _animationController.repeat(reverse: true);
          }
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        _gradientController.forward().then((_) {
          if (mounted) {
            _gradientController.repeat(reverse: true);
          }
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        _blobController.forward().then((_) {
          if (mounted) {
            _blobController.repeat(reverse: true);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.stop();
    _gradientController.stop();
    _blobController.stop();

    _animationController.dispose();
    _gradientController.dispose();
    _blobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SplashAnimatedBackground(
        animationController: _animationController,
        gradientController: _gradientController,
        blobController: _blobController,
        child: const _SplashContent(),
      ),
    );
  }
}

class _SplashAnimatedBackground extends StatelessWidget {
  final AnimationController animationController;
  final AnimationController gradientController;
  final AnimationController blobController;
  final Widget child;

  const _SplashAnimatedBackground({
    required this.animationController,
    required this.gradientController,
    required this.blobController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: Listenable.merge([
        animationController,
        gradientController,
        blobController,
      ]),
      builder: (context, child) {
        // Theme-responsive colors
        final primaryColor = Color.lerp(
          isDarkMode ? colorScheme.surface : const Color(0xFFFAFAFA),
          isDarkMode
              ? colorScheme.surfaceContainerLow
              : const Color(0xFFF5F5F5),
          animationController.value,
        )!;

        final secondaryColor = Color.lerp(
          isDarkMode ? colorScheme.surfaceContainer : const Color(0xFFF5F5F5),
          isDarkMode
              ? colorScheme.surfaceContainerHigh
              : const Color(0xFFE5E5E5),
          gradientController.value,
        )!;

        final tertiaryColor = Color.lerp(
          isDarkMode
              ? colorScheme.surfaceContainerHigh
              : const Color(0xFFE5E5E5),
          isDarkMode
              ? colorScheme.surfaceContainerHighest
              : const Color(0xFFD4D4D4),
          (animationController.value + gradientController.value) / 2,
        )!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(
                -0.8 + (gradientController.value * 1.6),
                -0.8 + (animationController.value * 1.6),
              ),
              radius: 1.2 + (gradientController.value * 0.8),
              colors: [primaryColor, secondaryColor, tertiaryColor],
              stops: const [0.0, 0.6, 1.0],
            ),
          ),
          child: Stack(
            children: [
              _buildAsymmetricBlob(
                left: 100 + (150 * animationController.value),
                top: 200 + (200 * gradientController.value),
                width: 300 + (100 * blobController.value),
                height: 280 + (80 * animationController.value),
                borderRadius: 150 + (50 * animationController.value),
                colors: [
                  Colors.transparent,
                  (isDarkMode
                          ? colorScheme.surfaceContainer
                          : const Color(0xFFF5F5F5))
                      .withValues(alpha: 0.15),
                  (isDarkMode
                          ? colorScheme.surfaceContainerHigh
                          : const Color(0xFFE5E5E5))
                      .withValues(alpha: 0.08),
                ],
                radiusMultipliers: [0.4, 1.6, 1.8, 0.6],
              ),
              _buildAsymmetricBlob(
                right: 50 + (100 * gradientController.value),
                top: 150 + (150 * blobController.value),
                width: 220 + (60 * animationController.value),
                height: 280 + (120 * gradientController.value),
                borderRadius: 180 + (60 * blobController.value),
                colors: [
                  Colors.transparent,
                  (isDarkMode
                          ? colorScheme.surfaceContainerHigh
                          : const Color(0xFFE5E5E5))
                      .withValues(alpha: 0.12),
                  (isDarkMode
                          ? colorScheme.surfaceContainerHighest
                          : const Color(0xFFD4D4D4))
                      .withValues(alpha: 0.06),
                ],
                radiusMultipliers: [1.3, 0.5, 0.7, 1.5],
              ),
              _buildAsymmetricBlob(
                left: 50 + (80 * blobController.value),
                bottom: 100 + (120 * animationController.value),
                width: 180 + (80 * gradientController.value),
                height: 240 + (80 * blobController.value),
                borderRadius: 120 + (30 * gradientController.value),
                colors: [
                  Colors.transparent,
                  (isDarkMode
                          ? colorScheme.surfaceContainerHighest
                          : const Color(0xFFD4D4D4))
                      .withValues(alpha: 0.10),
                  (isDarkMode ? colorScheme.surface : const Color(0xFFFAFAFA))
                      .withValues(alpha: 0.05),
                ],
                radiusMultipliers: [0.8, 1.4, 1.2, 0.3],
              ),
              child!,
            ],
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildAsymmetricBlob({
    double? left,
    double? right,
    double? top,
    double? bottom,
    required double width,
    required double height,
    required double borderRadius,
    required List<Color> colors,
    required List<double> radiusMultipliers,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: colors),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius * radiusMultipliers[0]),
            topRight: Radius.circular(borderRadius * radiusMultipliers[1]),
            bottomLeft: Radius.circular(borderRadius * radiusMultipliers[2]),
            bottomRight: Radius.circular(borderRadius * radiusMultipliers[3]),
          ),
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          final showLogo = state.showLogo;
          final showAppName = state.showAppName;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOutCubic,
                left: 0,
                right: 0,
                top: showAppName
                    ? MediaQuery.of(context).size.height * 0.35
                    : MediaQuery.of(context).size.height * 0.5 - 75,
                child: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 800),
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) {
                        return SharedAxisTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.scaled,
                          fillColor: Colors.transparent,
                          child: child,
                        );
                      },
                  child: showLogo
                      ? const _AnimatedLogo(key: ValueKey('logo'))
                      : const SizedBox.shrink(),
                ),
              ),

              AnimatedPositioned(
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeInOutCubic,
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height * 0.55,
                child: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 1200),
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) {
                        return FadeThroughTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          fillColor: Colors.transparent,
                          child: child,
                        );
                      },
                  child: showAppName
                      ? const _AppNameText(key: ValueKey('appName'))
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnimatedLogo extends StatefulWidget {
  const _AnimatedLogo({super.key});

  @override
  State<_AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<_AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(scale: _scaleAnimation.value, child: child);
      },
      child: SvgPicture.asset(
        KIcons.logo,
        width: 150,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.primary,
          BlendMode.srcIn,
        ),
        placeholderBuilder: (BuildContext context) =>
            Icon(Icons.error, size: 150, color: theme.colorScheme.error),
      ),
    );
  }
}

class _AppNameText extends StatelessWidget {
  const _AppNameText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      context.l10n?.appTitle ?? '',
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
      textAlign: TextAlign.center,
    );
  }
}
