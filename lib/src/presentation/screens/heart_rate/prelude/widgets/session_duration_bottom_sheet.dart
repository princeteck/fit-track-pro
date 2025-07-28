import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';

class SessionDurationBottomSheet extends StatelessWidget {
  final Function(Duration) onDurationSelected;

  const SessionDurationBottomSheet({super.key, required this.onDurationSelected});

  static const List<Duration> _durations = [
    Duration(seconds: 10),
    Duration(seconds: 30),
    Duration(minutes: 1),
    Duration(minutes: 2),
    Duration(minutes: 3),
    Duration(minutes: 5),
    Duration(minutes: 10),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE91E63).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        KIcons.bpmRead,
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFE91E63),
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
                          'Select Session Duration',
                          style: GoogleFonts.inter(
                            textStyle: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Choose how long to record heart rate',
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

            const SizedBox(height: 24),

            // Duration options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: _durations.map((duration) {
                  return Column(
                    children: [
                      _buildDurationOption(context, duration),
                      if (_durations.last != duration) const SizedBox(height: 12),
                    ],
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationOption(BuildContext context, Duration duration) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    String formatDuration(Duration duration) {
      if (duration.inMinutes > 0) {
        return '${duration.inMinutes} min${duration.inMinutes > 1 ? 's' : ''}';
      } else {
        return '${duration.inSeconds} sec${duration.inSeconds > 1 ? 's' : ''}';
      }
    }

    IconData getIconForDuration(Duration duration) {
      if (duration.inSeconds <= 30) return Icons.timer_outlined;
      if (duration.inMinutes <= 2) return Icons.schedule_outlined;
      if (duration.inMinutes <= 5) return Icons.timer_outlined;
      return Icons.access_time_outlined;
    }

    Color getColorForDuration(Duration duration) {
      if (duration.inSeconds <= 30) return const Color(0xFF4CAF50);
      if (duration.inMinutes <= 2) return const Color(0xFF2196F3);
      if (duration.inMinutes <= 5) return const Color(0xFFFF9800);
      return const Color(0xFF9C27B0);
    }

    final icon = getIconForDuration(duration);
    final color = getColorForDuration(duration);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          onDurationSelected(duration);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatDuration(duration),
                      style: GoogleFonts.inter(
                        textStyle: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration.inSeconds <= 30
                          ? 'Quick reading'
                          : duration.inMinutes <= 2
                          ? 'Short session'
                          : duration.inMinutes <= 5
                          ? 'Standard session'
                          : 'Extended session',
                      style: GoogleFonts.inter(
                        textStyle: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
