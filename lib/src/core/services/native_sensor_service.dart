import 'dart:async';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/heart_rate_model.dart';

@singleton
class NativeSensorService {
  static const MethodChannel _channel = MethodChannel(
    'com.sonawanes.fittrack_pro/sensors',
  );

  Future<void> startHeartRateMonitoring() async {
    try {
      await _channel.invokeMethod('startHeartRateMonitoring');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to start heart rate monitoring: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<void> stopHeartRateMonitoring() async {
    try {
      await _channel.invokeMethod('stopHeartRateMonitoring');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to stop heart rate monitoring: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<void> startWorkoutSession() async {
    try {
      await _channel.invokeMethod('startWorkoutSession');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to start workout session: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<void> stopWorkoutSession() async {
    try {
      await _channel.invokeMethod('stopWorkoutSession');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to stop workout session: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<void> toggleWorkoutPause() async {
    try {
      await _channel.invokeMethod('toggleWorkoutPause');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to toggle workout pause: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<int> getHeartRateReading() async {
    try {
      final result = await _channel.invokeMethod<int>('getHeartRateReading');
      return result ?? _generateMockHeartRate();
    } on PlatformException {
      return _generateMockHeartRate();
    }
  }

  Future<Map<String, dynamic>> simulateHeartRateSession({
    required HeartRateType type,
    required int durationSeconds,
  }) async {
    final readings = <Map<String, dynamic>>[];
    final startTime = DateTime.now();
    var lastReadingTime = startTime;

    // Simulate readings every 500ms
    final intervalMs = 500;
    final totalReadings = (durationSeconds * 1000 / intervalMs).round();

    for (int i = 0; i < totalReadings; i++) {
      final currentTime = startTime.add(Duration(milliseconds: i * intervalMs));
      final bpm = _generateRealisticHeartRate(type, i, totalReadings);
      final interval = currentTime
          .difference(lastReadingTime)
          .inMilliseconds
          .toDouble();

      readings.add({
        'bpm': bpm,
        'timestamp': currentTime.toIso8601String(),
        'intervalMs': interval,
      });

      lastReadingTime = currentTime;
    }

    return {
      'sessionId': DateTime.now().millisecondsSinceEpoch.toString(),
      'type': type.name,
      'startTime': startTime.toIso8601String(),
      'endTime': startTime
          .add(Duration(seconds: durationSeconds))
          .toIso8601String(),
      'durationSeconds': durationSeconds,
      'readings': readings,
      'averageBpm': _calculateAverageFromReadings(readings),
      'minBpm': _calculateMinFromReadings(readings),
      'maxBpm': _calculateMaxFromReadings(readings),
    };
  }

  int _generateRealisticHeartRate(
    HeartRateType type,
    int readingIndex,
    int totalReadings,
  ) {
    final random = Random();
    final progress = readingIndex / totalReadings;

    // Base heart rate ranges by type
    int baseMin, baseMax;
    switch (type) {
      case HeartRateType.resting:
        baseMin = 60;
        baseMax = 80;
        break;
      case HeartRateType.active:
        baseMin = 80;
        baseMax = 120;
        break;
      case HeartRateType.exercise:
        baseMin = 120;
        baseMax = 180;
        // Simulate gradual increase during exercise
        final exerciseBoost = (progress * 30).round();
        baseMin += exerciseBoost;
        baseMax += exerciseBoost;
        break;
      case HeartRateType.recovery:
        baseMin = 100;
        baseMax = 140;
        // Simulate gradual decrease during recovery
        final recoveryDecrease = (progress * 40).round();
        baseMin -= recoveryDecrease;
        baseMax -= recoveryDecrease;
        break;
    }

    // Add some natural variation
    final variation = random.nextInt(10) - 5; // ±5 BPM variation
    final targetBpm = baseMin + random.nextInt(baseMax - baseMin) + variation;

    return targetBpm.clamp(40, 200); // Safety bounds
  }

  int _calculateAverageFromReadings(List<Map<String, dynamic>> readings) {
    if (readings.isEmpty) return 0;
    final sum = readings.fold<int>(
      0,
      (sum, reading) => sum + (reading['bpm'] as int),
    );
    return (sum / readings.length).round();
  }

  int _calculateMinFromReadings(List<Map<String, dynamic>> readings) {
    if (readings.isEmpty) return 0;
    return readings.map((r) => r['bpm'] as int).reduce((a, b) => a < b ? a : b);
  }

  int _calculateMaxFromReadings(List<Map<String, dynamic>> readings) {
    if (readings.isEmpty) return 0;
    return readings.map((r) => r['bpm'] as int).reduce((a, b) => a > b ? a : b);
  }

  int _generateMockHeartRate() {
    final random = Random();
    return 60 + random.nextInt(41);
  }

  /// Simulates a heart rate recalibration reading
  Future<HeartRateModel> simulateRecalibration({HeartRateType? type}) async {
    final random = Random();
    final selectedType = type ?? HeartRateType.resting;

    // Generate realistic heart rate based on type
    int bpm;
    switch (selectedType) {
      case HeartRateType.resting:
        bpm = 60 + random.nextInt(21); // 60-80 BPM
        break;
      case HeartRateType.active:
        bpm = 80 + random.nextInt(31); // 80-110 BPM
        break;
      case HeartRateType.exercise:
        bpm = 120 + random.nextInt(61); // 120-180 BPM
        break;
      case HeartRateType.recovery:
        bpm = 70 + random.nextInt(21); // 70-90 BPM
        break;
    }

    return HeartRateModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'current_user_id',
      bpm: bpm,
      timestamp: DateTime.now(),
      type: selectedType,
      notes: 'Recalibration reading',
      createdAt: DateTime.now(),
    );
  }

  Future<void> startWorkoutTracking() async {
    try {
      await _channel.invokeMethod('startWorkoutTracking');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to start workout tracking: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<void> stopWorkoutTracking() async {
    try {
      await _channel.invokeMethod('stopWorkoutTracking');
    } on PlatformException catch (e) {
      developer.log(
        'Failed to stop workout tracking: ${e.message}',
        name: 'NativeSensorService',
        error: e,
      );
    }
  }

  Future<Map<String, dynamic>> getWorkoutData() async {
    try {
      final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
        'getWorkoutData',
      );
      return Map<String, dynamic>.from(result ?? {});
    } on PlatformException {
      return {
        'heartRate': _generateMockHeartRate(),
        'steps': Random().nextInt(1000),
        'calories': Random().nextInt(100),
        'duration': Random().nextInt(3600),
      };
    }
  }
}
