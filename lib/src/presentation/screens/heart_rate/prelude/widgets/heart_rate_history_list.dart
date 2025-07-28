import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';
import 'heart_rate_session_detail_modal.dart';

class HeartRateHistoryList extends StatelessWidget {
  final List<HeartRateModel> readings;
  final bool isLoading;
  final VoidCallback? onRefresh;
  final Function(HeartRateModel)? onReadingTap;

  const HeartRateHistoryList({
    super.key,
    required this.readings,
    this.isLoading = false,
    this.onRefresh,
    this.onReadingTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Heart Rate History',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                if (onRefresh != null)
                  IconButton(
                    onPressed: onRefresh,
                    style: IconButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary.withValues(
                        alpha: 0.1,
                      ),
                      foregroundColor: theme.colorScheme.primary,
                    ),
                    icon: SvgPicture.asset(
                      KIcons.arrowLineDown,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          if (isLoading)
            _buildLoadingState(theme)
          else if (readings.isEmpty)
            _buildEmptyState(theme)
          else
            _buildSessionsList(theme),
        ],
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildLoadingCard(theme),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingCard(ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 150,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? theme.colorScheme.surfaceContainerHighest
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 60,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? theme.colorScheme.surfaceContainerHighest
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 16,
                      width: 60,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? theme.colorScheme.surfaceContainerHighest
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? theme.colorScheme.surfaceContainerHighest
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE91E63).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                KIcons.heartSolid,
                width: 32,
                height: 32,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFE91E63),
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No sessions yet',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start a heart rate monitoring session to see your history here',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionsList(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: readings.length,
        itemBuilder: (context, index) {
          final session = readings[index];
          return _buildSessionCard(session, theme);
        },
      ),
    );
  }

  Widget _buildSessionCard(HeartRateModel session, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    final typeInfo = _getTypeInfo(session.type);
    final durationText = _formatDuration(session.sessionDurationSeconds);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: Builder(
          builder: (context) => InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) =>
                    HeartRateSessionDetailModal(session: session),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: typeInfo.color.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getTypeLabel(session.type),
                          style: GoogleFonts.inter(
                            textStyle: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  KIcons.heartSolid,
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    typeInfo.color,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${session.bpm} bpm',
                                  style: GoogleFonts.inter(
                                    textStyle: theme.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.onSurface,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 20),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  KIcons.infinite,
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    theme.colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  durationText,
                                  style: GoogleFonts.inter(
                                    textStyle: theme.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.onSurface
                                              .withValues(alpha: 0.6),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  IgnorePointer(
                    child: _buildMiniChart(session, typeInfo.color, theme),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiniChart(HeartRateModel session, Color color, ThemeData theme) {
    if (session.chartData.isEmpty) {
      return Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.show_chart,
            color: color.withValues(alpha: 0.6),
            size: 24,
          ),
        ),
      );
    }

    final chartItems = session.chartData.asMap().entries.map((entry) {
      return ChartLineDataItem(x: entry.key.toDouble(), value: entry.value.y);
    }).toList();

    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chart(
          layers: [
            ChartAxisLayer(
              settings: ChartAxisSettings(
                x: ChartAxisSettingsAxis(
                  frequency: 5,
                  max: chartItems.length.toDouble(),
                  min: 0,
                  textStyle: const TextStyle(fontSize: 0),
                ),
                y: ChartAxisSettingsAxis(
                  frequency: 5,
                  max:
                      chartItems
                          .map((item) => item.value)
                          .reduce((a, b) => a > b ? a : b) +
                      5,
                  min:
                      chartItems
                          .map((item) => item.value)
                          .reduce((a, b) => a < b ? a : b) -
                      5,
                  textStyle: const TextStyle(fontSize: 0),
                ),
              ),
              labelX: (value) => '',
              labelY: (value) => '',
            ),
            ChartLineLayer(
              items: chartItems,
              settings: ChartLineSettings(color: color, thickness: 2.0),
            ),
          ],
          padding: const EdgeInsets.all(2.0),
        ),
      ),
    );
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
}

class TypeInfo {
  final Color color;
  final String label;

  TypeInfo({required this.color, required this.label});
}
