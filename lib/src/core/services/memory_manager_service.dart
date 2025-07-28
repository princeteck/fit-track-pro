import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class MemoryManagerService {
  static final Map<String, Timer> _timers = {};
  static final Map<String, StreamSubscription> _subscriptions = {};
  static final Set<String> _activeOperations = {};

  /// Register a timer to be automatically disposed
  void registerTimer(String id, Timer timer) {
    _timers[id]?.cancel();
    _timers[id] = timer;
  }

  /// Register a stream subscription to be automatically disposed
  void registerSubscription(String id, StreamSubscription subscription) {
    _subscriptions[id]?.cancel();
    _subscriptions[id] = subscription;
  }

  /// Register an active operation
  void registerOperation(String operationId) {
    _activeOperations.add(operationId);
  }

  /// Unregister an operation when completed
  void unregisterOperation(String operationId) {
    _activeOperations.remove(operationId);
  }

  /// Cancel and dispose a specific timer
  void disposeTimer(String id) {
    _timers[id]?.cancel();
    _timers.remove(id);
  }

  /// Cancel and dispose a specific subscription
  void disposeSubscription(String id) {
    _subscriptions[id]?.cancel();
    _subscriptions.remove(id);
  }

  /// Dispose all timers
  void disposeAllTimers() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
  }

  /// Dispose all subscriptions
  void disposeAllSubscriptions() {
    for (final subscription in _subscriptions.values) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }

  /// Check for memory leaks
  void checkForMemoryLeaks() {
    if (kDebugMode) {
      if (_timers.isNotEmpty) {
        developer.log(
          'Active timers: ${_timers.length}',
          name: 'MemoryManager',
        );
      }
      if (_subscriptions.isNotEmpty) {
        developer.log(
          'Active subscriptions: ${_subscriptions.length}',
          name: 'MemoryManager',
        );
      }
      if (_activeOperations.isNotEmpty) {
        developer.log(
          'Active operations: ${_activeOperations.length}',
          name: 'MemoryManager',
        );
      }
    }
  }

  /// Dispose everything to prevent memory leaks
  void disposeAll() {
    disposeAllTimers();
    disposeAllSubscriptions();
    _activeOperations.clear();
  }

  /// Get memory usage statistics
  Map<String, int> getMemoryStats() {
    return {
      'activeTimers': _timers.length,
      'activeSubscriptions': _subscriptions.length,
      'activeOperations': _activeOperations.length,
    };
  }

  /// Cleanup inactive resources
  void cleanupInactiveResources() {
    // Remove cancelled timers
    final inactiveTimers = <String>[];
    for (final entry in _timers.entries) {
      if (!entry.value.isActive) {
        inactiveTimers.add(entry.key);
      }
    }
    for (final id in inactiveTimers) {
      _timers.remove(id);
    }

    if (kDebugMode && inactiveTimers.isNotEmpty) {
      developer.log(
        'Cleaned up ${inactiveTimers.length} inactive timers',
        name: 'MemoryManager',
      );
    }
  }

  /// Schedule periodic memory checks
  void startMemoryMonitoring() {
    if (kDebugMode) {
      registerTimer(
        'memory_monitor',
        Timer.periodic(const Duration(minutes: 5), (_) {
          checkForMemoryLeaks();
          cleanupInactiveResources();
        }),
      );
    }
  }

  /// Stop memory monitoring
  void stopMemoryMonitoring() {
    disposeTimer('memory_monitor');
  }
}
