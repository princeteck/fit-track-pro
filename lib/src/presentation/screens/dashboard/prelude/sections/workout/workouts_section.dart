import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';

class WorkoutSectionImpl extends StatefulWidget {
  const WorkoutSectionImpl({super.key});

  @override
  State<WorkoutSectionImpl> createState() => _WorkoutSectionImplState();
}

class _WorkoutSectionImplState extends State<WorkoutSectionImpl>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  // Cache theme styles to avoid repeated lookups
  late TextStyle _titleStyle;
  late TextStyle _bodyStyle;

  @override
  bool get wantKeepAlive => true; // Keep state alive to prevent rebuilds

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    // Delay animation start to avoid conflicts with parent animations
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _startAnimations();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cache theme styles once dependencies are available
    final theme = Theme.of(context);
    _titleStyle =
        theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ) ??
        const TextStyle();

    _bodyStyle =
        theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]) ??
        const TextStyle();
  }

  void _setupAnimations() {
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600), // Reduced duration
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: Curves.easeOutCubic, // Smoother curve
      ),
    );
  }

  void _startAnimations() {
    if (mounted) {
      _fadeAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(opacity: _fadeAnimation.value, child: child);
      },
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(), // More stable physics
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(context.l10n?.workouts ?? 'Workouts', style: _titleStyle),
              const SizedBox(height: 24),

              // Use ListView.builder for better performance
              ...List.generate(
                5,
                (i) => _WorkoutCard(index: i, bodyStyle: _bodyStyle),
              ),

              const SizedBox(height: 100), // Space for bottom navbar
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final int index;
  final TextStyle bodyStyle;

  const _WorkoutCard({required this.index, required this.bodyStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.fitness_center, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Workout ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Duration: ${30 + index * 5} minutes', style: bodyStyle),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}
