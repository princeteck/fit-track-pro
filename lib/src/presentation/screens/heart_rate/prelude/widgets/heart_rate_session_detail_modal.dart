import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';

class HeartRateSessionDetailModal extends StatefulWidget {
  final HeartRateModel session;

  const HeartRateSessionDetailModal({super.key, required this.session});

  @override
  State<HeartRateSessionDetailModal> createState() =>
      _HeartRateSessionDetailModalState();
}

class _HeartRateSessionDetailModalState
    extends State<HeartRateSessionDetailModal> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final typeInfo = _getTypeInfo(widget.session.type);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: typeInfo.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    KIcons.heartSolid,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      typeInfo.color,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getTypeLabel(widget.session.type),
                        style: GoogleFonts.inter(
                          textStyle: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatDateTime(widget.session.timestamp),
                        style: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    foregroundColor: theme.colorScheme.onSurface,
                  ),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Session stats
                  _buildSessionStats(theme, typeInfo.color),

                  const SizedBox(height: 32),

                  // Heart rate chart
                  _buildHeartRateChart(theme, typeInfo.color),

                  const SizedBox(height: 32),

                  // Duration breakdown
                  _buildDurationBreakdown(theme, typeInfo.color),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionStats(ThemeData theme, Color primaryColor) {
    final durationText = _formatDuration(widget.session.sessionDurationSeconds);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              theme,
              KIcons.heartSolid,
              '${widget.session.bpm}',
              'BPM',
              primaryColor,
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          Expanded(
            child: _buildStatItem(
              theme,
              KIcons.infinite,
              durationText,
              'Duration',
              theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          Expanded(
            child: _buildStatItem(
              theme,
              KIcons.chart,
              '${widget.session.chartData.length}',
              'Data Points',
              theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    ThemeData theme,
    String iconPath,
    String value,
    String label,
    Color iconColor,
  ) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeartRateChart(ThemeData theme, Color primaryColor) {
    if (widget.session.chartData.isEmpty) {
      return _buildEmptyChart(theme, 'No heart rate data available');
    }

    // Convert chart data to bar chart items
    final barItems = widget.session.chartData.asMap().entries.map((entry) {
      return ChartBarDataItem(
        color: primaryColor,
        value: entry.value.y,
        x: entry.key.toDouble(),
      );
    }).toList();

    final maxValue = widget.session.chartData
        .map((item) => item.y)
        .reduce((a, b) => a > b ? a : b);
    final minValue = widget.session.chartData
        .map((item) => item.y)
        .reduce((a, b) => a < b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Heart Rate Over Time',
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 280,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
          ),
          child: Chart(
            layers: [
              ChartAxisLayer(
                settings: ChartAxisSettings(
                  x: ChartAxisSettingsAxis(
                    frequency: (barItems.length / 5).ceil().toDouble(),
                    max: barItems.length.toDouble() - 1,
                    min: 0.0,
                    textStyle: GoogleFonts.inter(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      fontSize: 10.0,
                    ),
                  ),
                  y: ChartAxisSettingsAxis(
                    frequency: ((maxValue - minValue) / 5).ceil().toDouble(),
                    max: maxValue + 10,
                    min: minValue - 10,
                    textStyle: GoogleFonts.inter(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      fontSize: 10.0,
                    ),
                  ),
                ),
                labelX: (value) => value.toInt().toString(),
                labelY: (value) => '${value.toInt()}',
              ),
              ChartBarLayer(
                items: barItems,
                settings: ChartBarSettings(
                  thickness: barItems.length > 20 ? 2.0 : 6.0,
                  radius: const BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
            ],
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ).copyWith(bottom: 12.0),
          ),
        ),
      ],
    );
  }

  Widget _buildDurationBreakdown(ThemeData theme, Color primaryColor) {
    final sessionDuration = widget.session.sessionDurationSeconds ?? 0;
    if (sessionDuration == 0) {
      return _buildEmptyChart(theme, 'No duration data available');
    }

    // Create duration segments (example: every 10% of session)
    final segmentCount = 10;
    final segmentDuration = sessionDuration / segmentCount;

    final durationItems = List.generate(segmentCount, (index) {
      // Simulate varying intensity during the session
      final intensity = _calculateIntensity(index, segmentCount);
      return ChartBarDataItem(
        color: primaryColor.withValues(alpha: 0.3 + (intensity * 0.7)),
        value: segmentDuration,
        x: index.toDouble(),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session Duration Breakdown',
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Duration segments showing intensity variation',
          style: GoogleFonts.inter(
            textStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 240,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
          ),
          child: Chart(
            layers: [
              ChartAxisLayer(
                settings: ChartAxisSettings(
                  x: ChartAxisSettingsAxis(
                    frequency: 1.0,
                    max: segmentCount.toDouble() - 1,
                    min: 0.0,
                    textStyle: GoogleFonts.inter(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      fontSize: 10.0,
                    ),
                  ),
                  y: ChartAxisSettingsAxis(
                    frequency: segmentDuration / 2,
                    max: segmentDuration * 1.2,
                    min: 0.0,
                    textStyle: GoogleFonts.inter(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      fontSize: 10.0,
                    ),
                  ),
                ),
                labelX: (value) => '${(value + 1).toInt()}',
                labelY: (value) => '${(value / 60).toStringAsFixed(1)}m',
              ),
              ChartBarLayer(
                items: durationItems,
                settings: const ChartBarSettings(
                  thickness: 16.0,
                  radius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ],
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ).copyWith(bottom: 12.0),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyChart(ThemeData theme, String message) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart_outlined,
              size: 48,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  double _calculateIntensity(int index, int total) {
    // Simulate a workout intensity curve
    final progress = index / (total - 1);
    if (progress < 0.2) {
      // Warm up
      return progress * 2.5;
    } else if (progress < 0.8) {
      // Main workout
      return 0.5 + (0.5 * (1 + 0.3 * (index % 3 - 1)));
    } else {
      // Cool down
      return 1.0 - ((progress - 0.8) * 2.5);
    }
  }

  TypeInfo _getTypeInfo(HeartRateType type) {
    switch (type) {
      case HeartRateType.resting:
        return TypeInfo(
          color: const Color(0xFF4CAF50),
          label: 'Pre-Workout Stretch',
        );
      case HeartRateType.active:
        return TypeInfo(
          color: const Color(0xFF2196F3),
          label: 'Lower Body Training',
        );
      case HeartRateType.exercise:
        return TypeInfo(
          color: const Color(0xFFFF9800),
          label: 'HIIT Cardio Interval',
        );
      case HeartRateType.recovery:
        return TypeInfo(
          color: const Color(0xFF9C27B0),
          label: 'Recovery Session',
        );
    }
  }

  String _getTypeLabel(HeartRateType type) {
    switch (type) {
      case HeartRateType.resting:
        return 'Pre-Workout Stretch';
      case HeartRateType.active:
        return 'Lower Body Training';
      case HeartRateType.exercise:
        return 'HIIT Cardio Interval';
      case HeartRateType.recovery:
        return 'Recovery Session';
    }
  }

  String _formatDuration(int? durationSeconds) {
    if (durationSeconds == null || durationSeconds == 0) return '0s';

    final duration = Duration(seconds: durationSeconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      if (minutes > 0) {
        return '${hours}h ${minutes}m';
      } else {
        return '${hours}h';
      }
    } else if (minutes > 0) {
      if (seconds > 0) {
        return '${minutes}m ${seconds}s';
      } else {
        return '${minutes}m';
      }
    } else {
      return '${seconds}s';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'Today, ${_formatTime(dateTime)}';
    } else if (difference.inDays == 1) {
      return 'Yesterday, ${_formatTime(dateTime)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class TypeInfo {
  final Color color;
  final String label;

  TypeInfo({required this.color, required this.label});
}
