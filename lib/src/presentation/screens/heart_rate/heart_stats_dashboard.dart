import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../../../data/models/heart_rate_model.dart';
import '../../controllers/heart_rate_stats/heart_rate_stats_cubit.dart';
import '../../controllers/base/cubit_state.dart';
import 'prelude/prelude.dart';

class HeartStatsDashboard extends StatefulWidget {
  const HeartStatsDashboard({super.key});
  static const String name = 'heart-stats-dashboard';
  static const String path = '/heart-stats-dashboard';

  @override
  State<HeartStatsDashboard> createState() => _HeartStatsDashboardState();
}

class _HeartStatsDashboardState extends State<HeartStatsDashboard> {
  late final HeartRateStatsCubit _cubit;
  final ScrollController _scrollController = ScrollController();
  final SwipeButtonController _swipeButtonController = SwipeButtonController();

  @override
  void initState() {
    super.initState();
    _cubit = locator<HeartRateStatsCubit>();
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadData() {
    _cubit.loadHeartRateStats();
  }

  void _initializeMockData() {
    _cubit.initializeMockData();
  }

  void _clearAllData() {
    _cubit.clearAllData();
  }

  void _checkDatabaseIntegrity() {
    _cubit.checkDatabaseIntegrity();
  }

  void _handleRecalibrate() {
    // This method is now called after the session is completed
    // The new flow handles type selection and duration internally
    _loadData(); // Refresh the dashboard with new data
  }

  void _handleReadingTap(HeartRateModel reading) {
    showDialog(
      context: context,
      builder: (context) => _buildReadingDetailsDialog(reading),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Heart Rate Stats',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'init_mock_data':
                  _initializeMockData();
                  break;
                case 'clear_data':
                  _clearAllData();
                  break;
                case 'check_db':
                  _checkDatabaseIntegrity();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'init_mock_data',
                child: Text('Initialize Mock Data'),
              ),
              const PopupMenuItem(
                value: 'clear_data',
                child: Text('Clear Data'),
              ),
              const PopupMenuItem(
                value: 'check_db',
                child: Text('Check Database'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<HeartRateStatsCubit, CubitState>(
        bloc: _cubit,
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: HeartStatsSectionHeader(
                    title: 'Current Heart Rate',
                    value: _getCurrentHeartRate(state),
                    unit: 'BPM',
                    onTap: _loadData,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: HeartStatsChartSection(
                    heartRateData: _getHeartRateData(state),
                    isLoading: state.isLoading,
                    onRefresh: _loadData,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: HeartRateHistoryList(
                    readings: _getRecentReadings(state),
                    isLoading: state.isLoading,
                    onRefresh: _loadData,
                    onReadingTap: _handleReadingTap,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
        },
      ),

      bottomNavigationBar: SafeArea(
        child: BlocBuilder<HeartRateStatsCubit, CubitState>(
          bloc: _cubit,
          builder: (context, state) {
            return SwipeToRecalibrateButton(
              controller: _swipeButtonController,
              onRecalibrate: _handleRecalibrate,
              isLoading: state.isLoading,
              onSessionSaved: (HeartRateSession session) async {
                await _cubit.saveHeartRateSession(session);
                // Force immediate UI refresh after successful save
                setState(() {});
              },
              onDashboardUpdate: () {
                // This should now be redundant since onSessionSaved handles refresh
              },
            );
          },
        ),
      ),
    );
  }

  String _getCurrentHeartRate(CubitState state) {
    if (_cubit.cachedData != null) {
      final currentReading =
          _cubit.cachedData!['currentReading'] as HeartRateModel?;
      if (currentReading != null) {
        return '${currentReading.bpm}';
      }
    }

    return '--';
  }

  List<HeartRateModel> _getHeartRateData(CubitState state) {
    if (_cubit.cachedData != null) {
      final allReadings =
          _cubit.cachedData!['allReadings'] as List<HeartRateModel>?;
      return allReadings ?? <HeartRateModel>[];
    }

    return <HeartRateModel>[];
  }

  List<HeartRateModel> _getRecentReadings(CubitState state) {
    if (_cubit.cachedData != null) {
      final recentReadings =
          _cubit.cachedData!['recentReadings'] as List<HeartRateModel>?;
      return recentReadings ?? <HeartRateModel>[];
    }

    return <HeartRateModel>[];
  }

  Widget _buildReadingDetailsDialog(HeartRateModel reading) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(
        'Heart Rate Reading',
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BPM: ${reading.bpm}',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Type: ${_getTypeLabel(reading.type)}',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Time: ${_formatDateTime(reading.timestamp)}',
            style: theme.textTheme.bodyMedium,
          ),
          if (reading.notes?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            Text('Notes: ${reading.notes}', style: theme.textTheme.bodyMedium),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  String _getTypeLabel(HeartRateType type) {
    switch (type) {
      case HeartRateType.resting:
        return 'Resting';
      case HeartRateType.active:
        return 'Active';
      case HeartRateType.exercise:
        return 'Exercise';
      case HeartRateType.recovery:
        return 'Recovery';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
