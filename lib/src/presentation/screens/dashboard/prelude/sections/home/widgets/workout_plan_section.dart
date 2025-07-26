import 'package:flutter/material.dart';

class WorkoutPlanSection extends StatelessWidget {
  const WorkoutPlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your plan',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),

        // Grid of workout cards
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
          children: const [
            WorkoutCard(
              title: 'Yoga Group',
              date: '25 Nov',
              time: '14:00-15:00',
              location: 'A5 room',
              color: Color(0xFFFFA726), // Orange
              intensity: 'Medium',
            ),
            WorkoutCard(
              title: 'Balance',
              date: '28 Nov',
              time: '18:00-19:30',
              location: 'A2 room',
              color: Color(0xFF42A5F5), // Blue
              intensity: 'Light',
            ),
            WorkoutCard(
              title: 'Training',
              date: 'Next Session',
              time: 'Tiffany Way',
              location: '',
              color: Color(0xFFEC407A), // Pink
              intensity: '',
              isTrainer: true,
            ),
            WorkoutCard(
              title: 'Recovery',
              date: 'Rest Day',
              time: 'Self-care',
              location: '',
              color: Color(0xFF66BB6A), // Green
              intensity: '',
              isRestDay: true,
            ),
          ],
        ),
      ],
    );
  }
}

class WorkoutCard extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final Color color;
  final String intensity;
  final bool isTrainer;
  final bool isRestDay;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.color,
    required this.intensity,
    this.isTrainer = false,
    this.isRestDay = false,
  });

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: () {
        // Handle workout card tap
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Intensity badge
                    if (widget.intensity.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.intensity,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    const Spacer(),

                    // Title
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Date
                    Text(
                      widget.date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Time
                    Text(
                      widget.time,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // Location
                    if (widget.location.isNotEmpty)
                      Text(
                        widget.location,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    // Special icons for trainer and rest day
                    if (widget.isTrainer)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),

                    if (widget.isRestDay)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_circle_outline,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
