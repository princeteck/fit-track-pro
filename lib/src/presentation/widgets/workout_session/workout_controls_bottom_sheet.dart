import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/workout_session/workout_session_cubit.dart';

class WorkoutControlsBottomSheet extends StatelessWidget {
  const WorkoutControlsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Workout Controls',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 24),

          // Controls
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      // Play/Pause Button
                      _buildControlButton(
                        context: context,
                        icon: state.isPaused ? Icons.play_arrow : Icons.pause,
                        label: state.isPaused ? 'Resume' : 'Pause',
                        color: state.isPaused ? Colors.green : Colors.orange,
                        onTap: () {
                          context.read<WorkoutSessionCubit>().togglePause();
                        },
                      ),

                      const SizedBox(height: 16),

                      // Skip Exercise
                      _buildControlButton(
                        context: context,
                        icon: Icons.skip_next,
                        label: 'Skip Exercise',
                        color: Colors.blue,
                        onTap: () {
                          context.read<WorkoutSessionCubit>().skipExercise();
                          Navigator.of(context).pop();
                        },
                      ),

                      const SizedBox(height: 16),

                      // Previous Exercise
                      _buildControlButton(
                        context: context,
                        icon: Icons.skip_previous,
                        label: 'Previous Exercise',
                        color: Colors.purple,
                        onTap: () {
                          context
                              .read<WorkoutSessionCubit>()
                              .previousExercise();
                          Navigator.of(context).pop();
                        },
                      ),

                      const SizedBox(height: 16),

                      // Complete Set
                      _buildControlButton(
                        context: context,
                        icon: Icons.check_circle,
                        label: 'Complete Set',
                        color: Colors.green,
                        onTap: () {
                          context.read<WorkoutSessionCubit>().nextSet();
                          Navigator.of(context).pop();
                        },
                      ),

                      const Spacer(),

                      // End Workout
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _showEndWorkoutDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'End Workout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color.withValues(alpha: 0.7),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEndWorkoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('End Workout'),
          content: const Text(
            'Are you sure you want to end this workout session? Your progress will be saved.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close dialog
                Navigator.of(context).pop(); // Close bottom sheet
                context.read<WorkoutSessionCubit>().completeWorkout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('End Workout'),
            ),
          ],
        );
      },
    );
  }
}
