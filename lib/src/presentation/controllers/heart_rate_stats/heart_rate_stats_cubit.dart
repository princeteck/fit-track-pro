import 'package:fittrack_pro/src/presentation/controllers/base/base_cubit_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer' as developer;

import '../../../core/di/di.dart';
import '../../../core/services/isolate_service.dart';
import '../../../core/services/native_sensor_service.dart';
import '../../../data/datasources/heart_rate_local_data_source.dart';
import '../../../data/models/heart_rate_model.dart';
import '../base/cubit_state.dart';

part 'heart_rate_stats_state.dart';
part 'heart_rate_stats_cubit.freezed.dart';

@singleton
class HeartRateStatsCubit extends BaseCubitWrapper<CubitState> {
  final HeartRateLocalDataSource _localDataSource;
  final NativeSensorService _nativeSensorService;
  Map<String, dynamic>? _cachedData;

  HeartRateStatsCubit(this._localDataSource, this._nativeSensorService)
    : super(const CubitState.initial());

  Map<String, dynamic>? get cachedData => _cachedData;

  IsolateService get _isolateService => locator<IsolateService>();

  Future<void> loadHeartRateStats() async {
    try {
      emit(const CubitState.loading());

      const userId = 'current_user_id';

      final data = await _isolateService
          .executeDatabaseOperation<Map<String, dynamic>>(
            operationId: 'load_heart_rate_stats_$userId',
            operation: () async {
              final recentReadings = await _localDataSource
                  .getHeartRatesByUserId(userId, limit: 10);

              final allReadings = await _localDataSource.getHeartRatesByUserId(
                userId,
                limit: 100,
              );

              final currentReading = await _localDataSource.getLatestHeartRate(
                userId,
              );

              // Load heart rate sessions
              final sessions = await _localDataSource
                  .getHeartRateSessionsByUserId(userId, limit: 20);

              final now = DateTime.now();
              final weekAgo = now.subtract(const Duration(days: 7));
              final stats = await _localDataSource.getHeartRateStats(
                userId,
                startDate: weekAgo,
                endDate: now,
              );

              return {
                'recentReadings': recentReadings,
                'allReadings': allReadings,
                'currentReading': currentReading,
                'sessions': sessions,
                'stats': stats,
              };
            },
          );

      _cachedData = data;

      emit(const CubitState.loaded());
    } catch (e) {
      emit(CubitState.error(message: e.toString()));
    }
  }

  Future<void> recalibrateHeartRate({HeartRateType? type}) async {
    try {
      emit(const CubitState.submitting());

      final reading = await _nativeSensorService.simulateRecalibration(
        type: type,
      );

      developer.log(
        'Got reading from sensor: ${reading.bpm} BPM (${reading.type})',
      );

      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'insert_heart_rate_${reading.id}',
        operation: () async {
          await _localDataSource.insertHeartRate(reading);
        },
      );

      await loadHeartRateStats();
    } catch (e) {
      emit(CubitState.error(message: e.toString()));
    }
  }

  Future<void> addHeartRateReading({
    required int bpm,
    required HeartRateType type,
    String? notes,
  }) async {
    try {
      const userId = 'current_user_id';

      final reading = HeartRateModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        bpm: bpm,
        timestamp: DateTime.now(),
        type: type,
        notes: notes,
        createdAt: DateTime.now(),
      );

      await _localDataSource.insertHeartRate(reading);

      await loadHeartRateStats();
    } catch (e) {
      emit(CubitState.error(message: e.toString()));
    }
  }

  Future<void> saveHeartRateSession(HeartRateSession session) async {
    try {
      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'save_heart_rate_session_${session.id}',
        operation: () async {
          await _localDataSource.saveHeartRateSession(session);
        },
      );

      // Reload stats to include the new session data
      await loadHeartRateStats();
    } catch (e) {
      emit(CubitState.error(message: 'Failed to save session: $e'));
    }
  }

  Future<void> initializeMockData() async {
    try {
      emit(const CubitState.loading());

      const userId = 'current_user_id';
      final now = DateTime.now();

      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'clear_heart_rate_data_$userId',
        operation: () async {
          await _localDataSource.deleteHeartRatesByUserId(userId);
        },
      );

      final mockReadings = <HeartRateModel>[
        // Pre-Workout Stretch
        HeartRateModel(
          id: '1',
          userId: userId,
          bpm: 78,
          timestamp: now.subtract(const Duration(hours: 1)),
          type: HeartRateType.resting,
          notes: 'Pre-Workout Stretch',
          createdAt: now.subtract(const Duration(hours: 1)),
          sessionId: 'session_1',
          sessionDurationSeconds: 90 * 60, // 90 minutes
          readings: List.generate(
            15,
            (index) => HeartRateReading(
              bpm: 75 + (index % 6),
              timestamp: now.subtract(Duration(hours: 1, minutes: index * 6)),
              intervalMs: 6 * 60 * 1000, // 6 minutes
            ),
          ),
          chartData: List.generate(
            15,
            (index) => ChartDataPoint(
              x: index.toDouble(),
              y: (75 + (index % 6)).toDouble(),
            ),
          ),
        ),
        // HIIT Cardio Interval
        HeartRateModel(
          id: '2',
          userId: userId,
          bpm: 111,
          timestamp: now.subtract(const Duration(hours: 3)),
          type: HeartRateType.exercise,
          notes: 'HIIT Cardio Interval',
          createdAt: now.subtract(const Duration(hours: 3)),
          sessionId: 'session_2',
          sessionDurationSeconds: 78 * 60, // 78 minutes
          readings: List.generate(
            20,
            (index) => HeartRateReading(
              bpm: 105 + (index % 15),
              timestamp: now.subtract(Duration(hours: 3, minutes: index * 4)),
              intervalMs: 4 * 60 * 1000, // 4 minutes
            ),
          ),
          chartData: List.generate(
            20,
            (index) => ChartDataPoint(
              x: index.toDouble(),
              y: (105 + (index % 15)).toDouble(),
            ),
          ),
        ),
        // Lower Body Training
        HeartRateModel(
          id: '3',
          userId: userId,
          bpm: 96,
          timestamp: now.subtract(const Duration(hours: 6)),
          type: HeartRateType.active,
          notes: 'Lower Body Training',
          createdAt: now.subtract(const Duration(hours: 6)),
          sessionId: 'session_3',
          sessionDurationSeconds: 55 * 60, // 55 minutes
          readings: List.generate(
            18,
            (index) => HeartRateReading(
              bpm: 90 + (index % 12),
              timestamp: now.subtract(Duration(hours: 6, minutes: index * 3)),
              intervalMs: 3 * 60 * 1000, // 3 minutes
            ),
          ),
          chartData: List.generate(
            18,
            (index) => ChartDataPoint(
              x: index.toDouble(),
              y: (90 + (index % 12)).toDouble(),
            ),
          ),
        ),
        // Recovery Session
        HeartRateModel(
          id: '4',
          userId: userId,
          bpm: 72,
          timestamp: now.subtract(const Duration(hours: 12)),
          type: HeartRateType.recovery,
          notes: 'Recovery Session',
          createdAt: now.subtract(const Duration(hours: 12)),
          sessionId: 'session_4',
          sessionDurationSeconds: 45 * 60, // 45 minutes
          readings: List.generate(
            12,
            (index) => HeartRateReading(
              bpm: 70 + (index % 8),
              timestamp: now.subtract(Duration(hours: 12, minutes: index * 4)),
              intervalMs: 4 * 60 * 1000, // 4 minutes
            ),
          ),
          chartData: List.generate(
            12,
            (index) => ChartDataPoint(
              x: index.toDouble(),
              y: (70 + (index % 8)).toDouble(),
            ),
          ),
        ),
        // Morning Cardio
        HeartRateModel(
          id: '5',
          userId: userId,
          bpm: 95,
          timestamp: now.subtract(const Duration(days: 1)),
          type: HeartRateType.active,
          notes: 'Morning Cardio',
          createdAt: now.subtract(const Duration(days: 1)),
          sessionId: 'session_5',
          sessionDurationSeconds: 60 * 60, // 60 minutes
          readings: List.generate(
            16,
            (index) => HeartRateReading(
              bpm: 88 + (index % 14),
              timestamp: now.subtract(Duration(days: 1, minutes: index * 4)),
              intervalMs: 4 * 60 * 1000, // 4 minutes
            ),
          ),
          chartData: List.generate(
            16,
            (index) => ChartDataPoint(
              x: index.toDouble(),
              y: (88 + (index % 14)).toDouble(),
            ),
          ),
        ),
      ];

      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'insert_mock_data_$userId',
        operation: () async {
          for (final reading in mockReadings) {
            await _localDataSource.insertHeartRate(reading);
          }
        },
      );

      await loadHeartRateStats();
    } catch (e) {
      emit(CubitState.error(message: e.toString()));
    }
  }

  Future<void> clearAllData() async {
    try {
      emit(const CubitState.loading());

      const userId = 'current_user_id';

      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'clear_all_heart_rate_data_$userId',
        operation: () async {
          await _localDataSource.deleteHeartRatesByUserId(userId);
        },
      );

      _cachedData = null;

      await loadHeartRateStats();
    } catch (e) {
      emit(CubitState.error(message: e.toString()));
    }
  }

  Future<void> checkDatabaseIntegrity() async {
    try {
      const userId = 'current_user_id';

      await _isolateService.executeDatabaseOperation<void>(
        operationId: 'check_db_integrity_$userId',
        operation: () async {
          final allReadings = await _localDataSource.getHeartRatesByUserId(
            userId,
          );

          final latest = await _localDataSource.getLatestHeartRate(userId);
          developer.log(
            'Latest reading: ${latest?.bpm} BPM at ${latest?.timestamp}',
          );

          final now = DateTime.now();
          final weekAgo = now.subtract(const Duration(days: 7));
          final stats = await _localDataSource.getHeartRateStats(
            userId,
            startDate: weekAgo,
            endDate: now,
          );
          developer.log(
            'Stats: avg=${stats?.averageBpm}, count=${stats?.readingsCount}',
          );

          if (allReadings.isNotEmpty) {
            for (int i = 0; i < allReadings.length && i < 3; i++) {
              final reading = allReadings[i];
              developer.log(
                '  ${reading.id}: ${reading.bpm} BPM at ${reading.timestamp}',
              );
            }
          }
        },
      );
    } catch (e) {
      debugPrint('Error checking database integrity: $e');
    }
  }
}
