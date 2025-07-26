import 'package:flutter/material.dart';

import 'widgets/daily_challenge_card.dart';
import 'widgets/greeting_header.dart';
import 'widgets/weekly_calendar.dart';
import 'widgets/workout_plan_section.dart';

class HomeSectionImpl extends StatefulWidget {
  const HomeSectionImpl({super.key});

  @override
  State<HomeSectionImpl> createState() => _HomeSectionImplState();
}

class _HomeSectionImplState extends State<HomeSectionImpl>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late AnimationController _slideAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _slideAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );
  }

  void _startAnimations() {
    _fadeAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _slideAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Greeting Header with staggered animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const GreetingHeader(),
                ),

                const SizedBox(height: 24),

                // Daily Challenge Card with delayed animation
                SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _slideAnimationController,
                          curve: const Interval(
                            0.2,
                            1.0,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                      ),
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _fadeAnimationController,
                      curve: const Interval(0.2, 1.0),
                    ),
                    child: const DailyChallengeCard(),
                  ),
                ),

                const SizedBox(height: 24),

                // Weekly Calendar with delayed animation
                SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _slideAnimationController,
                          curve: const Interval(
                            0.4,
                            1.0,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                      ),
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _fadeAnimationController,
                      curve: const Interval(0.4, 1.0),
                    ),
                    child: const WeeklyCalendar(),
                  ),
                ),

                const SizedBox(height: 32),

                // Your Plan Section with delayed animation
                SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _slideAnimationController,
                          curve: const Interval(
                            0.6,
                            1.0,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                      ),
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _fadeAnimationController,
                      curve: const Interval(0.6, 1.0),
                    ),
                    child: const WorkoutPlanSection(),
                  ),
                ),

                const SizedBox(height: 100), // Space for bottom navbar
              ],
            ),
          ),
        ),
      ),
    );
  }
}
