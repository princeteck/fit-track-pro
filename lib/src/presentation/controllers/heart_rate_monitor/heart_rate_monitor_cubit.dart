import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/services/isolate_service.dart';
import '../../../core/services/native_sensor_service.dart';
import '../../../data/datasources/heart_rate_local_data_source.dart';
import '../../../data/models/heart_rate_model.dart';
import '../base/base_cubit_wrapper.dart';

part 'heart_rate_monitor_state.dart';
part 'heart_rate_monitor_cubit.freezed.dart';

@injectable
class HeartRateMonitorCubit extends BaseCubitWrapper<HeartRateMonitorState> {
  final HeartRateLocalDataSource _localDataSource;
  final NativeSensorService _nativeSensorService;
  final IsolateService _isolateService;

  Timer? _monitoringTimer;
  Timer? _sessionTimer;
  String? _currentSessionId;
  DateTime? _sessionStartTime;
  int _sessionDurationSeconds = 30;
  HeartRateType _selectedType = HeartRateType.resting;
  final List<HeartRateReading> _currentReadings = [];

  HeartRateMonitorCubit(
    this._localDataSource,
    this._nativeSensorService,
    this._isolateService,
  ) : super(const HeartRateMonitorState.initial());

  void selectHeartRateType(HeartRateType type) {
    _selectedType = type;
    emit(HeartRateMonitorState.typeSelected(type: type));
  }

  void selectDuration(int durationSeconds) {
    _sessionDurationSeconds = durationSeconds;
    emit(
      HeartRateMonitorState.durationSelected(
        durationSeconds: durationSeconds,
        type: _selectedType,
      ),
    );
  }

  Future<void> startMonitoring() async {
    try {
      await _nativeSensorService.startHeartRateMonitoring();

      _currentSessionId = DateTime.now().millisecondsSinceEpoch.toString();
      _sessionStartTime = DateTime.now();
      _currentReadings.clear();

      emit(
        HeartRateMonitorState.monitoring(
          sessionId: _currentSessionId!,
          type: _selectedType,
          durationSeconds: _sessionDurationSeconds,
          readings: [],
          remainingSeconds: _sessionDurationSeconds,
          progress: 0.0,
        ),
      );

      // Start monitoring in isolate to prevent UI blocking
      await _startMonitoringInIsolate();

      // Start session timer
      _startSessionTimer();
    } catch (e) {
      emit(HeartRateMonitorState.error(message: e.toString()));
    }
  }

  Future<void> _startMonitoringInIsolate() async {
    // Use isolate for continuous heart rate monitoring
    await _isolateService.executeDatabaseOperation<void>(
      operationId: 'heart_rate_monitoring_$_currentSessionId',
      operation: () async {
        _monitoringTimer = Timer.periodic(
          const Duration(milliseconds: 500), // Read every 500ms
          (timer) async {
            await _captureReading();
          },
        );
      },
    );
  }

  Future<void> _captureReading() async {
    try {
      final bpm = await _nativeSensorService.getHeartRateReading();
      final now = DateTime.now();

      double intervalMs = 500.0; // Default interval
      if (_currentReadings.isNotEmpty) {
        intervalMs = now
            .difference(_currentReadings.last.timestamp)
            .inMilliseconds
            .toDouble();
      }

      final reading = HeartRateReading(
        bpm: bpm,
        timestamp: now,
        intervalMs: intervalMs,
      );

      _currentReadings.add(reading);

      final elapsedSeconds = now.difference(_sessionStartTime!).inSeconds;
      final remainingSeconds = _sessionDurationSeconds - elapsedSeconds;
      final progress = elapsedSeconds / _sessionDurationSeconds;

      if (state is HeartRateMonitorStateMonitoring) {
        emit(
          HeartRateMonitorState.monitoring(
            sessionId: _currentSessionId!,
            type: _selectedType,
            durationSeconds: _sessionDurationSeconds,
            readings: List.from(_currentReadings),
            remainingSeconds: remainingSeconds.clamp(
              0,
              _sessionDurationSeconds,
            ),
            progress: progress.clamp(0.0, 1.0),
          ),
        );
      }
    } catch (e) {
      showLog('Error capturing heart rate reading: $e');
    }
  }

  void _startSessionTimer() {
    _sessionTimer = Timer(Duration(seconds: _sessionDurationSeconds), () async {
      await _completeSession();
    });
  }

  Future<void> _completeSession() async {
    await stopMonitoring();

    if (_currentReadings.isNotEmpty) {
      await _saveSessionData();
      emit(
        HeartRateMonitorState.completed(
          sessionId: _currentSessionId!,
          type: _selectedType,
          readings: List.from(_currentReadings),
          averageBpm: _calculateAverageBpm(),
        ),
      );
    }
  }

  Future<void> stopMonitoring() async {
    _monitoringTimer?.cancel();
    _sessionTimer?.cancel();

    try {
      await _nativeSensorService.stopHeartRateMonitoring();
    } catch (e) {
      showLog('Error stopping heart rate monitoring: $e');
    }
  }

  Future<void> _saveSessionData() async {
    if (_currentSessionId == null || _sessionStartTime == null) return;

    try {
      // Create session record
      final session = HeartRateSession(
        id: _currentSessionId!,
        userId: 'current_user_id', // Replace with actual user ID
        type: _selectedType,
        startTime: _sessionStartTime!,
        endTime: DateTime.now(),
        durationSeconds: _sessionDurationSeconds,
        readings: List.from(_currentReadings),
        averageBpm: _calculateAverageBpm(),
        minBpm: _calculateMinBpm(),
        maxBpm: _calculateMaxBpm(),
        notes: 'Session monitoring for $_sessionDurationSeconds seconds',
        createdAt: DateTime.now(),
      );

      // Also create a summary HeartRateModel for dashboard
      final summaryModel = HeartRateModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'current_user_id',
        bpm: _calculateAverageBpm(),
        timestamp: DateTime.now(),
        type: _selectedType,
        notes: 'Session summary: ${_currentReadings.length} readings',
        createdAt: DateTime.now(),
        sessionId: _currentSessionId,
        sessionDurationSeconds: _sessionDurationSeconds,
        readings: List.from(_currentReadings),
        chartData: _generateChartData(),
      );

      // Save both session and summary to database using isolate
      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'save_heart_rate_session_$_currentSessionId',
        operation: () async {
          await _localDataSource.insertHeartRate(summaryModel);
          await _localDataSource.insertHeartRateSession(session);
        },
      );
    } catch (e) {
      showLog('Error saving session data: $e');
      emit(HeartRateMonitorState.error(message: 'Failed to save session data'));
    }
  }

  List<ChartDataPoint> _generateChartData() {
    return _currentReadings.asMap().entries.map((entry) {
      final index = entry.key;
      final reading = entry.value;
      final timeInSeconds = index * 0.5; // 500ms intervals
      return ChartDataPoint(x: timeInSeconds, y: reading.bpm.toDouble());
    }).toList();
  }

  int _calculateAverageBpm() {
    if (_currentReadings.isEmpty) return 0;
    final sum = _currentReadings.fold<int>(
      0,
      (sum, reading) => sum + reading.bpm,
    );
    return (sum / _currentReadings.length).round();
  }

  int _calculateMinBpm() {
    if (_currentReadings.isEmpty) return 0;
    return _currentReadings.map((r) => r.bpm).reduce((a, b) => a < b ? a : b);
  }

  int _calculateMaxBpm() {
    if (_currentReadings.isEmpty) return 0;
    return _currentReadings.map((r) => r.bpm).reduce((a, b) => a > b ? a : b);
  }

  void reset() {
    stopMonitoring();
    _currentReadings.clear();
    _currentSessionId = null;
    _sessionStartTime = null;
    emit(const HeartRateMonitorState.initial());
  }

  @override
  Future<void> close() {
    stopMonitoring();
    return super.close();
  }
}
