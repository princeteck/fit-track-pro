import 'dart:async';

import 'package:fittrack_pro/src/core/constants/ui/assets_constants.dart';
import 'package:fittrack_pro/src/core/constants/ui/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/di.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../controllers/walkthrough/walkthrough_cubit.dart';
import '../screens.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({super.key});

  static const path = '/walkthrough';
  static const name = 'walkthrough';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<WalkthroughCubit>(),
      child: const _WalkthroughView(),
    );
  }
}

class _WalkthroughView extends StatefulWidget {
  const _WalkthroughView();

  @override
  State<_WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<_WalkthroughView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _gradientController;
  late Animation<double> _gradientAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _gradientController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _gradientAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    locator<WalkthroughCubit>().goToSlide(index);
    _gradientController.animateTo(index / (WalkthroughCubit.totalSlides - 1));
  }

  void _handleNext() {
    final cubit = locator<WalkthroughCubit>();
    final currentIndex = cubit.state.currentIndex;

    if (currentIndex < WalkthroughCubit.totalSlides - 1) {
      cubit.nextSlide();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      cubit.completeOnboarding();
      context.go(SignInScreen.path);
    }
  }

  void _handleSkip() {
    final cubit = locator<WalkthroughCubit>();
    cubit.skipToEnd();
    _pageController.animateToPage(
      WalkthroughCubit.totalSlides - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _gradientController.animateTo(1.0);

    cubit.completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: BlocBuilder<WalkthroughCubit, WalkthroughState>(
        bloc: locator<WalkthroughCubit>(),
        builder: (context, state) {
          return Stack(
            children: [
              AnimatedBuilder(
                animation: _gradientAnimation,
                builder: (context, child) {
                  final currentPage = state.currentIndex;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                    child: Image.asset(
                      KImages.getOnboardingImage(currentPage + 1),
                      key: ValueKey('image_$currentPage'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                },
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        colorScheme.scrim.withValues(alpha: 0.2),
                        colorScheme.scrim.withValues(alpha: 0.8),
                        colorScheme.scrim,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  _WalkthroughSlide(
                    title: 'Welcome to \nFit Track Pro',
                    description:
                        'Personalize your fitness journey with our comprehensive tracking app.',
                    slideIndex: 0,
                    isActive: state.currentIndex == 0,
                  ),
                  _WalkthroughSlide(
                    title: 'Personalized Fitness Goals',
                    description:
                        'Create personalized fitness goals and track your progress towards a healthier you.',
                    slideIndex: 1,
                    isActive: state.currentIndex == 1,
                  ),
                  _WalkthroughSlide(
                    title: 'Track Your Workouts',
                    description:
                        'Get insights, reminders, and celebrate your achievements along the way.',
                    slideIndex: 2,
                    isActive: state.currentIndex == 2,
                  ),
                  _WalkthroughSlide(
                    title: 'Health Metrics & Fitness Analytics',
                    description: 'Monitor your health profile with ease.',
                    slideIndex: 3,
                    isActive: state.currentIndex == 3,
                  ),
                  _WalkthroughSlide(
                    title: 'Nutrition & Diet\nGuidance',
                    description: 'Lose weight and get fit with Fit Track Pro.',
                    slideIndex: 4,
                    isActive: state.currentIndex == 4,
                  ),
                  _WalkthroughSlide(
                    title: 'Virtual AI Coach \nMentoring',
                    description: 'Say goodbye to manual coaching.',
                    slideIndex: 5,
                    isActive: state.currentIndex == 5,
                  ),
                ],
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _BottomNavigation(
                  currentIndex: state.currentIndex,
                  isLastSlide: state.isLastSlide,
                  hasSkipped: state.hasSkipped,
                  onNext: _handleNext,
                  onSkip: _handleSkip,
                  pageController: _pageController,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WalkthroughSlide extends StatefulWidget {
  final String title;
  final String description;
  final int slideIndex;
  final bool isActive;

  const _WalkthroughSlide({
    required this.title,
    required this.description,
    required this.slideIndex,
    required this.isActive,
  });

  @override
  State<_WalkthroughSlide> createState() => _WalkthroughSlideState();
}

class _WalkthroughSlideState extends State<_WalkthroughSlide>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          opacity: widget.isActive ? 1.0 : 0.0,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 800),
            offset: widget.isActive ? Offset.zero : const Offset(0, 0.1),
            curve: Curves.easeOutCubic,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _AnimatedSlideText(
                  text: widget.title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 36,
                    letterSpacing: -0.5,
                    height: 1.2,
                  ),
                  delay: const Duration(milliseconds: 200),
                ),

                const SizedBox(height: 16),

                _AnimatedSlideText(
                  text: widget.description,
                  style: GoogleFonts.manrope(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 3,
                  delay: const Duration(milliseconds: 400),
                ),

                const SizedBox(height: 160),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedSlideText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration delay;
  final int? maxLines;

  const _AnimatedSlideText({
    required this.text,
    this.style,
    this.delay = Duration.zero,
    this.maxLines,
  });

  @override
  State<_AnimatedSlideText> createState() => _AnimatedSlideTextState();
}

class _AnimatedSlideTextState extends State<_AnimatedSlideText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(_AnimatedSlideText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {
      _controller.reset();
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          widget.text,
          style: widget.style,
          textAlign: TextAlign.center,
          maxLines: widget.maxLines,
          overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final bool isLastSlide;
  final bool hasSkipped;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final PageController pageController;

  const _BottomNavigation({
    required this.currentIndex,
    required this.isLastSlide,
    required this.hasSkipped,
    required this.onNext,
    required this.onSkip,
    required this.pageController,
  });

  @override
  State<_BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<_BottomNavigation>
    with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late AnimationController _indicatorController;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _buttonFadeAnimation;

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _indicatorController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.elasticOut),
    );

    _buttonFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOut),
    );

    _buttonController.forward();
    _indicatorController.forward();
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _indicatorController.dispose();
    super.dispose();
  }

  void _animateButtonPress() {
    _buttonController.reverse().then((_) {
      _buttonController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_buttonController, _indicatorController]),
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: _buttonFadeAnimation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(_indicatorController),
                  child: SmoothPageIndicator(
                    controller: widget.pageController,
                    count: WalkthroughCubit.totalSlides,
                    effect: ExpandingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      expansionFactor: 4,
                      spacing: 8,
                      radius: 16,
                      activeDotColor: KColors.gray20,
                      dotColor: KColors.gray70,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: (!widget.isLastSlide && !widget.hasSkipped)
                        ? _AnimatedTextButton(
                            key: const ValueKey('skip'),
                            onPressed: () {
                              _animateButtonPress();
                              widget.onSkip();
                            },
                            text: context.l10n?.skipButton ?? 'Skip',
                            isSecondary: true,
                          )
                        : const SizedBox(width: 80, key: ValueKey('empty')),
                  ),

                  _AnimatedElevatedButton(
                    onPressed: () {
                      _animateButtonPress();
                      widget.onNext();
                    },
                    text: widget.isLastSlide
                        ? (widget.hasSkipped
                              ? (context.l10n?.finishButton ?? 'Finish')
                              : (context.l10n?.letsGetStartedButton ??
                                    "Let's Get Started"))
                        : (context.l10n?.nextButton ?? 'Next'),
                    isLastSlide: widget.isLastSlide,
                    scaleAnimation: _buttonScaleAnimation,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AnimatedTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isSecondary;

  const _AnimatedTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.0,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF6B7280),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }
}

class _AnimatedElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLastSlide;
  final Animation<double> scaleAnimation;

  const _AnimatedElevatedButton({
    required this.onPressed,
    required this.text,
    required this.isLastSlide,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isLastSlide ? 220.0 : 140.0,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                elevation: 0,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.3),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: Row(
                  key: ValueKey(text),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    if (!isLastSlide) ...[
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
