import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';
import 'time_range_dropdown.dart';

class HeartStatsChartSection extends StatefulWidget {
  final List<HeartRateModel> heartRateData;
  final bool isLoading;
  final VoidCallback? onRefresh;

  const HeartStatsChartSection({
    super.key,
    required this.heartRateData,
    this.isLoading = false,
    this.onRefresh,
  });

  @override
  State<HeartStatsChartSection> createState() => _HeartStatsChartSectionState();
}

class _HeartStatsChartSectionState extends State<HeartStatsChartSection> {
  CustomDateTimeRange _selectedRange = CustomDateTimeRange.week();

  void _onRangeChanged(CustomDateTimeRange range) {
    setState(() {
      _selectedRange = range;
    });
    // Here you would typically fetch new data for the selected range
    widget.onRefresh?.call();
  }

  List<HeartRateModel> get _filteredData {
    return widget.heartRateData
        .where((reading) => _selectedRange.contains(reading.timestamp))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
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
          // Header with dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Heart Rate Trends',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Add some spacing
              TimeRangeDropdown(
                selectedRange: _selectedRange,
                onRangeChanged: _onRangeChanged,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Chart area
          if (widget.isLoading)
            _buildLoadingChart()
          else if (_filteredData.isEmpty)
            _buildEmptyChart()
          else
            _buildChart(),

          const SizedBox(height: 16),

          // Stats summary
          _buildStatsRow(),
        ],
      ),
    );
  }

  Widget _buildLoadingChart() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildEmptyChart() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              KIcons.chart,
              width: 48,
              height: 48,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.onSurface.withValues(alpha: 0.3),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No data available',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start recording to see your heart rate trends',
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

  Widget _buildChart() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Simple chart implementation - in real app you'd use fl_chart or similar
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Background grid
          CustomPaint(
            size: const Size.fromHeight(200),
            painter: _ChartGridPainter(isDarkMode: isDarkMode, theme: theme),
          ),
          // Chart line
          CustomPaint(
            size: const Size.fromHeight(200),
            painter: _ChartLinePainter(
              data: _filteredData,
              theme: theme,
              isDarkMode: isDarkMode,
            ),
          ),
          // Y-axis labels
          Positioned.fill(child: _buildYAxisLabels()),
        ],
      ),
    );
  }

  Widget _buildYAxisLabels() {
    final theme = Theme.of(context);

    // Calculate dynamic Y-axis labels based on actual data
    if (_filteredData.isEmpty) {
      // Default labels when no data
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              '180',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '120',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              '60',
              style: GoogleFonts.inter(
                textStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Get actual data range
    final bpmValues = _filteredData.map((e) => e.bpm).toList();
    final minBpm = bpmValues.reduce((a, b) => a < b ? a : b);
    final maxBpm = bpmValues.reduce((a, b) => a > b ? a : b);

    // Add some padding to the range for better visualization
    final padding = ((maxBpm - minBpm) * 0.1).ceil();
    final adjustedMin = (minBpm - padding).clamp(40, 200);
    final adjustedMax = (maxBpm + padding).clamp(40, 200);
    final adjustedMid = ((adjustedMin + adjustedMax) / 2).round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Text(
            '$adjustedMax',
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 10,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            '$adjustedMid',
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 10,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            '$adjustedMin',
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    final theme = Theme.of(context);
    final stats = _calculateStats();

    return Row(
      children: [
        Expanded(
          child: _buildStatItem(
            'Avg.',
            '${stats['average']?.toStringAsFixed(0) ?? 0} BPM',
            KIcons.heart,
            const Color(0xFFE91E63),
            theme,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatItem(
            'Min.',
            '${stats['min'] ?? 0} BPM',
            KIcons.arrowLineDown,
            const Color(0xFF4CAF50),
            theme,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatItem(
            'Max.',
            '${stats['max'] ?? 0} BPM',
            KIcons.arrowLineUp,
            const Color(0xFF2196F3),
            theme,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    String iconPath,
    Color iconColor,
    ThemeData theme,
  ) {
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surface
            : iconColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  iconPath,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, num> _calculateStats() {
    if (_filteredData.isEmpty) {
      return {'average': 0, 'min': 0, 'max': 0};
    }

    final bpmValues = _filteredData.map((reading) => reading.bpm).toList();
    final average = bpmValues.reduce((a, b) => a + b) / bpmValues.length;
    final min = bpmValues.reduce((a, b) => a < b ? a : b);
    final max = bpmValues.reduce((a, b) => a > b ? a : b);

    return {'average': average, 'min': min, 'max': max};
  }
}

class _ChartGridPainter extends CustomPainter {
  final bool isDarkMode;
  final ThemeData theme;

  _ChartGridPainter({required this.isDarkMode, required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = theme.colorScheme.outline.withValues(alpha: 0.1)
      ..strokeWidth = 1;

    // Horizontal grid lines
    for (int i = 0; i < 4; i++) {
      final y = (size.height / 3) * i;
      canvas.drawLine(Offset(40, y), Offset(size.width - 16, y), paint);
    }

    // Vertical grid lines
    for (int i = 0; i < 6; i++) {
      final x = 40 + ((size.width - 56) / 5) * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ChartLinePainter extends CustomPainter {
  final List<HeartRateModel> data;
  final ThemeData theme;
  final bool isDarkMode;

  _ChartLinePainter({
    required this.data,
    required this.theme,
    required this.isDarkMode,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = const Color(0xFFE91E63)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final chartWidth = size.width - 56;
    final chartHeight = size.height - 16;

    // Find min and max BPM for scaling
    final bpmValues = data.map((e) => e.bpm).toList();
    final minBpm = bpmValues.reduce((a, b) => a < b ? a : b);
    final maxBpm = bpmValues.reduce((a, b) => a > b ? a : b);

    // Add some padding to the range for better visualization
    final padding = ((maxBpm - minBpm) * 0.1).ceil();
    final adjustedMin = (minBpm - padding).clamp(40, 200);
    final adjustedMax = (maxBpm + padding).clamp(40, 200);
    final adjustedRange = adjustedMax - adjustedMin;

    if (adjustedRange == 0) return;

    for (int i = 0; i < data.length; i++) {
      final x = 40 + (chartWidth / (data.length - 1)) * i;
      // Use adjusted range for consistent scaling with Y-axis labels
      final normalizedBpm = (data[i].bpm - adjustedMin) / adjustedRange;
      final y = chartHeight - (normalizedBpm * chartHeight) + 8;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    // Draw points
    final pointPaint = Paint()
      ..color = const Color(0xFFE91E63)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      final x = 40 + (chartWidth / (data.length - 1)) * i;
      // Use adjusted range for consistent scaling with Y-axis labels
      final normalizedBpm = (data[i].bpm - adjustedMin) / adjustedRange;
      final y = chartHeight - (normalizedBpm * chartHeight) + 8;

      canvas.drawCircle(Offset(x, y), 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
