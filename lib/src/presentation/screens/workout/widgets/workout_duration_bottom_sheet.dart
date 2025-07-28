import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui/assets_constants.dart';
import '../../../../data/services/workout_api_service.dart';

class WorkoutDurationBottomSheet extends StatefulWidget {
  final WorkoutPlan workoutPlan;
  final Function(Duration) onDurationSelected;

  const WorkoutDurationBottomSheet({
    super.key,
    required this.workoutPlan,
    required this.onDurationSelected,
  });

  static void show(
    BuildContext context, {
    required WorkoutPlan workoutPlan,
    required Function(Duration) onDurationSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => WorkoutDurationBottomSheet(
        workoutPlan: workoutPlan,
        onDurationSelected: onDurationSelected,
      ),
    );
  }

  @override
  State<WorkoutDurationBottomSheet> createState() =>
      _WorkoutDurationBottomSheetState();
}

class _WorkoutDurationBottomSheetState
    extends State<WorkoutDurationBottomSheet> {
  Duration? _selectedDuration;

  final List<Duration> _durationOptions = [
    const Duration(seconds: 10),
    const Duration(seconds: 30),
    const Duration(minutes: 1),
    const Duration(minutes: 3),
    const Duration(minutes: 5),
    const Duration(minutes: 7),
    const Duration(minutes: 10),
    const Duration(minutes: 15),
    const Duration(minutes: 30),
    const Duration(minutes: 45),
    const Duration(minutes: 60),
    const Duration(minutes: 90),
  ];

  @override
  void initState() {
    super.initState();
    // Set default duration based on workout plan - extract minutes from duration string
    final durationMatch = RegExp(
      r'(\d+)',
    ).firstMatch(widget.workoutPlan.duration);
    final estimatedMinutes = durationMatch != null
        ? int.parse(durationMatch.group(1)!)
        : 30;
    _selectedDuration = Duration(minutes: estimatedMinutes);
  }

  Color _getWorkoutColor() {
    // Use the workout plan's color directly
    return widget.workoutPlan.color;
  }

  String _getWorkoutIcon() {
    // Use a default workout icon
    return KIcons.trophy;
  }

  (String, String) _formatDuration(Duration duration) {
    if (duration.inSeconds < 60) {
      return ('${duration.inSeconds} seconds', '${duration.inSeconds}s');
    } else if (duration.inMinutes < 60) {
      return ('${duration.inMinutes} minutes', '${duration.inMinutes}min');
    } else {
      final hours = duration.inHours;
      final minutes = duration.inMinutes % 60;
      if (minutes == 0) {
        return ('$hours hour${hours > 1 ? 's' : ''}', '${hours}h');
      } else {
        return (
          '$hours hour${hours > 1 ? 's' : ''} $minutes min',
          '${hours}h ${minutes}min',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final workoutColor = _getWorkoutColor();

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Fixed Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: workoutColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        _getWorkoutIcon(),
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          workoutColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Duration',
                          style: GoogleFonts.inter(
                            textStyle: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Choose how long you want to workout',
                          style: GoogleFonts.inter(
                            textStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Duration Options
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _durationOptions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildDurationOption(
                    context,
                    _durationOptions[index],
                    workoutColor,
                    isDarkMode,
                  );
                },
              ),
            ),

            // Fixed Bottom Button
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDarkMode ? theme.colorScheme.surface : Colors.white,
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedDuration != null
                      ? () {
                          Navigator.of(context).pop();
                          widget.onDurationSelected(_selectedDuration!);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: workoutColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    shadowColor: workoutColor.withValues(alpha: 0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Start ${_selectedDuration != null ? "${_formatDuration(_selectedDuration!).$2} " : ""}Workout',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationOption(
    BuildContext context,
    Duration duration,
    Color workoutColor,
    bool isDarkMode,
  ) {
    final theme = Theme.of(context);
    final isSelected = _selectedDuration == duration;
    final (durationText, durationValue) = _formatDuration(duration);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedDuration = duration;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? workoutColor.withValues(alpha: 0.1)
                : (isDarkMode ? theme.colorScheme.surface : Colors.grey[50]),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? workoutColor
                  : theme.colorScheme.outline.withValues(alpha: 0.1),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? workoutColor.withValues(alpha: 0.2)
                      : theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.access_time,
                    color: isSelected
                        ? workoutColor
                        : theme.colorScheme.primary,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      durationText,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? workoutColor
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getDurationDescription(duration),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: workoutColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDurationDescription(Duration duration) {
    final totalSeconds = duration.inSeconds;
    final minutes = duration.inMinutes;

    if (totalSeconds < 60) {
      return totalSeconds <= 10 ? 'Quick test' : 'Warm-up session';
    }

    switch (minutes) {
      case 1:
        return 'Quick stretch';
      case 3:
        return 'Brief activity';
      case 5:
        return 'Short session';
      case 7:
        return 'Quick warmup';
      case 10:
        return 'Light workout';
      case 15:
        return 'Quick session';
      case 30:
        return 'Standard workout';
      case 45:
        return 'Extended session';
      case 60:
        return 'Full workout';
      case 90:
        return 'Marathon session';
      default:
        return 'Custom duration';
    }
  }
}
