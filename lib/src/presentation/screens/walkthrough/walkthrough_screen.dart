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
    context.read<WalkthroughCubit>().goToSlide(index);
    _gradientController.animateTo(index / (WalkthroughCubit.totalSlides - 1));
  }

  void _handleNext() {
    final cubit = context.read<WalkthroughCubit>();
    final currentIndex = cubit.state.currentIndex;

    if (currentIndex < WalkthroughCubit.totalSlides - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to next screen (e.g., auth screen)
      context.go(LocaleSettingsScreen.path);
    }
  }

  void _handleSkip() {
    final cubit = context.read<WalkthroughCubit>();
    cubit.skipToEnd();
    _pageController.animateToPage(
      WalkthroughCubit.totalSlides - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _gradientController.animateTo(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WalkthroughCubit, WalkthroughState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Animated Background with Gradient
              AnimatedBuilder(
                animation: _gradientAnimation,
                builder: (context, child) {
                  return _AnimatedBackground(
                    gradientPosition: _gradientAnimation.value,
                  );
                },
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.white.withValues(alpha: 0.2),
                        Colors.white.withValues(alpha: 0.6),
                        Colors.white.withValues(alpha: 0.8),
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // PageView Content
              PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  _WalkthroughSlide(
                    title:
                        context.l10n?.walkthroughTitle1 ?? 'Track Your Fitness',
                    description:
                        context.l10n?.walkthroughDescription1 ??
                        'Monitor your daily activities, workouts, and health metrics all in one place.',
                    icon: Icons.fitness_center,
                    slideIndex: 0,
                    isActive: state.currentIndex == 0,
                  ),
                  _WalkthroughSlide(
                    title:
                        context.l10n?.walkthroughTitle2 ??
                        'Set Goals & Achieve',
                    description:
                        context.l10n?.walkthroughDescription2 ??
                        'Create personalized fitness goals and track your progress towards a healthier you.',
                    icon: Icons.track_changes,
                    slideIndex: 1,
                    isActive: state.currentIndex == 1,
                  ),
                  _WalkthroughSlide(
                    title: context.l10n?.walkthroughTitle3 ?? 'Stay Motivated',
                    description:
                        context.l10n?.walkthroughDescription3 ??
                        'Get insights, reminders, and celebrate your achievements along the way.',
                    icon: Icons.emoji_events,
                    slideIndex: 2,
                    isActive: state.currentIndex == 2,
                  ),
                ],
              ),

              // Bottom Navigation
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

class _AnimatedBackground extends StatelessWidget {
  final double gradientPosition;

  const _AnimatedBackground({required this.gradientPosition});

  @override
  Widget build(BuildContext context) {
    // Define subtle gradient colors for each slide
    final slideColors = [
      const Color(0xFF6A1B9A), // Purple
      const Color(0xFF1565C0), // Blue
      const Color(0xFF2E7D32), // Green
    ];

    // Smoothly interpolate between slide colors
    Color primaryColor;
    if (gradientPosition <= 0.5) {
      // Between slide 0 and 1
      final t = gradientPosition * 2;
      primaryColor = Color.lerp(slideColors[0], slideColors[1], t)!;
    } else {
      // Between slide 1 and 2
      final t = (gradientPosition - 0.5) * 2;
      primaryColor = Color.lerp(slideColors[1], slideColors[2], t)!;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor.withValues(alpha: 0.1),
            primaryColor.withValues(alpha: 0.6),
            primaryColor.withValues(alpha: 0.1),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.3, -0.8),
            radius: 1.2,
            colors: [primaryColor.withValues(alpha: 0.03), Colors.transparent],
            stops: const [0.0, 1.0],
          ),
        ),
      ),
    );
  }
}

class _WalkthroughSlide extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final int slideIndex;
  final bool isActive;

  const _WalkthroughSlide({
    required this.title,
    required this.description,
    required this.icon,
    required this.slideIndex,
    required this.isActive,
  });

  @override
  State<_WalkthroughSlide> createState() => _WalkthroughSlideState();
}

class _WalkthroughSlideState extends State<_WalkthroughSlide>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late Animation<double> _iconRotateAnimation;

  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _iconRotateAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOut),
    );

    // Start ping pong animation if active
    if (widget.isActive) {
      _startIconPingPongAnimation();
    }
  }

  @override
  void didUpdateWidget(_WalkthroughSlide oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _startIconPingPongAnimation();
      } else {
        // Stop the ping pong animation when slide becomes inactive
        _iconController.stop();
      }
    }
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  void _startIconPingPongAnimation() async {
    while (mounted && widget.isActive) {
      await _iconController.forward();
      if (mounted && widget.isActive) {
        await _iconController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define colors for each slide
    final colors = [
      const Color(0xFF6A1B9A), // Purple
      const Color(0xFF1565C0), // Blue
      const Color(0xFF2E7D32), // Green
    ];

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
              children: [
                const Spacer(flex: 2),

                // Animated Icon Container
                _AnimatedIconContainer(
                  icon: widget.icon,
                  color: colors[widget.slideIndex],
                  rotationAnimation: _iconRotateAnimation,
                ),

                const Spacer(),

                // Animated Title
                _AnimatedSlideText(
                  text: widget.title,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1A1A1A),
                    fontSize: 28,
                    letterSpacing: -0.5,
                    height: 1.2,
                  ),
                  delay: const Duration(milliseconds: 200),
                ),

                const SizedBox(height: 16),

                // Animated Description
                _AnimatedSlideText(
                  text: widget.description,
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 3,
                  delay: const Duration(milliseconds: 400),
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper widget for animated icon container
class _AnimatedIconContainer extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Animation<double> rotationAnimation;

  const _AnimatedIconContainer({
    required this.icon,
    required this.color,
    required this.rotationAnimation,
  });

  @override
  State<_AnimatedIconContainer> createState() => _AnimatedIconContainerState();
}

class _AnimatedIconContainerState extends State<_AnimatedIconContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Start scale animation
    _scaleController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([widget.rotationAnimation, _scaleAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: widget.rotationAnimation.value * 0.05,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64748B).withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFF64748B).withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Icon(widget.icon, size: 40, color: widget.color),
            ),
          ),
        );
      },
    );
  }
}

// Helper widget for animated slide text
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

    // Start animation with delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(_AnimatedSlideText oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Restart animation if text changes
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

    // Start animations
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
              // Animated Page Indicator with animations package
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
                      activeDotColor: const Color(0xFF1A1A1A),
                      dotColor: const Color(0xFF8f8f8f),
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Navigation Buttons with PageTransitionSwitcher
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button with smooth transitions
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

                  // Next/Finish Button
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
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isLastSlide ? 200.0 : 140.0,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
                foregroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
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
