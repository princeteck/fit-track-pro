import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../domain/entities/workout_session_entity.dart';

class WorkoutSessionDetailsBottomSheet extends StatefulWidget {
  final WorkoutSessionEntity session;

  const WorkoutSessionDetailsBottomSheet({super.key, required this.session});

  static void show(
    BuildContext context, {
    required WorkoutSessionEntity session,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => WorkoutSessionDetailsBottomSheet(session: session),
    );
  }

  @override
  State<WorkoutSessionDetailsBottomSheet> createState() =>
      _WorkoutSessionDetailsBottomSheetState();
}

class _WorkoutSessionDetailsBottomSheetState
    extends State<WorkoutSessionDetailsBottomSheet>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
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

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.fitness_center,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.session.workoutPlanName,
                          style: GoogleFonts.inter(
                            textStyle: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatSessionDate(widget.session.startTime),
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

            // Session Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem(
                    'Duration',
                    _formatDuration(widget.session.durationSeconds),
                    Icons.timer,
                    Colors.blue,
                  ),
                  _buildStatItem(
                    'Calories',
                    '${widget.session.caloriesBurned}',
                    Icons.local_fire_department,
                    Colors.orange,
                  ),
                  _buildStatItem(
                    'Progress',
                    '${(widget.session.progress * 100).round()}%',
                    Icons.trending_up,
                    Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Sensor Data Chart Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Session Data',
                      style: GoogleFonts.inter(
                        textStyle: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: widget.session.sensorData.isEmpty
                            ? Center(
                                child: Text(
                                  'No sensor data available',
                                  style: GoogleFonts.inter(
                                    textStyle: theme.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.onSurface
                                              .withValues(alpha: 0.6),
                                        ),
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  // Tab Bar
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.surface,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: TabBar(
                                      controller: _tabController,
                                      tabs: const [
                                        Tab(
                                          icon: Icon(Icons.show_chart),
                                          text: 'Chart',
                                        ),
                                        Tab(
                                          icon: Icon(Icons.list),
                                          text: 'Data',
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Tab Content
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        _buildSensorDataChart(),
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: _buildSensorDataList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Close Button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildSensorDataList() {
    return ListView.builder(
      itemCount: widget.session.sensorData.length,
      itemBuilder: (context, index) {
        final data = widget.session.sensorData[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data.elapsedSeconds}s',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 16,
                    color: Colors.red.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${data.heartRate} BPM',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    size: 16,
                    color: Colors.orange.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${data.calories.toStringAsFixed(1)} cal',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSensorDataChart() {
    if (widget.session.sensorData.isEmpty) {
      return const Center(child: Text('No data to display'));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Legend
          _buildChartLegend(),
          const SizedBox(height: 16),
          // Chart
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400.0),
              child: Chart(
                layers: _buildChartLayers(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ).copyWith(bottom: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(
          color: Colors.red.withValues(alpha: 0.8),
          label: 'Heart Rate (BPM)',
          icon: Icons.favorite,
        ),
        const SizedBox(width: 24),
        _buildLegendItem(
          color: Colors.orange.withValues(alpha: 0.8),
          label: 'Calories',
          icon: Icons.local_fire_department,
        ),
      ],
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String label,
    required IconData icon,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  List<ChartLayer> _buildChartLayers() {
    // Get the range of data points
    final dataLength = widget.session.sensorData.length;

    // Calculate min/max values for scaling
    final heartRates = widget.session.sensorData
        .map((e) => e.heartRate.toDouble())
        .toList();
    final calories = widget.session.sensorData.map((e) => e.calories).toList();

    final maxHeartRate = heartRates.isNotEmpty
        ? heartRates.reduce((a, b) => a > b ? a : b)
        : 100.0;
    final maxCalories = calories.isNotEmpty
        ? calories.reduce((a, b) => a > b ? a : b)
        : 50.0;

    // Use separate scaling for better visibility
    final maxValue =
        (maxHeartRate > maxCalories ? maxHeartRate : maxCalories) * 1.1;
    final frequency = dataLength > 1 ? (dataLength - 1) / 4.0 : 1.0;

    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainerHigh.withValues(alpha: 0.8),
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 60.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: (dataLength - 1).toDouble(),
            min: 0.0,
            textStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: maxValue > 200 ? 50.0 : 25.0,
            max: maxValue,
            min: 0.0,
            textStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) =>
            (value.toInt() + 1).toString(), // Show as 1-based index
        labelY: (value) => value.toInt().toString(),
      ),
      // Heart Rate Line
      ChartLineLayer(
        items: List.generate(
          dataLength,
          (index) => ChartLineDataItem(
            x: index.toDouble(),
            value: widget.session.sensorData[index].heartRate.toDouble(),
          ),
        ),
        settings: ChartLineSettings(
          color: Colors.red.withValues(alpha: 0.8),
          thickness: 3.0,
        ),
      ),
      // Calories Line
      ChartLineLayer(
        items: List.generate(
          dataLength,
          (index) => ChartLineDataItem(
            x: index.toDouble(),
            value: widget.session.sensorData[index].calories,
          ),
        ),
        settings: ChartLineSettings(
          color: Colors.orange.withValues(alpha: 0.8),
          thickness: 3.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Theme.of(context).colorScheme.surface,
          circleBackgroundColor: Theme.of(context).colorScheme.surface,
          circleBorderColor: Theme.of(context).colorScheme.primary,
          circleSize: 4.0,
          circleBorderThickness: 2.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) {
            // Find the corresponding data point to determine the type
            final index = item.x.toInt();
            if (index >= 0 && index < widget.session.sensorData.length) {
              final data = widget.session.sensorData[index];
              // Check if this matches heart rate or calories value
              if ((item.value - data.heartRate.toDouble()).abs() < 0.1) {
                return '${item.value.toInt()} BPM';
              } else {
                return '${item.value.toInt()} cal';
              }
            }
            return '${item.value.toInt()}';
          },
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          radius: 6.0,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];
  }

  String _formatSessionDate(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final sessionDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (sessionDate == today) {
      return 'Today at ${_formatTime(dateTime)}';
    } else if (sessionDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday at ${_formatTime(dateTime)}';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${_formatTime(dateTime)}';
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    if (minutes > 0) {
      return '${minutes}m ${remainingSeconds}s';
    } else {
      return '${remainingSeconds}s';
    }
  }
}
