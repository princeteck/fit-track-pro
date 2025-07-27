import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class IsolateService {
  static final Map<String, Isolate> _isolates = {};
  static final Map<String, SendPort> _sendPorts = {};
  static final Map<String, Completer<dynamic>> _completers = {};

  /// Execute a heavy computation task in an isolate
  Future<T> executeInIsolate<T>({
    required String taskId,
    required Function computation,
    required dynamic data,
  }) async {
    if (!kIsWeb) {
      try {
        final completer = Completer<T>();
        _completers[taskId] = completer;

        // Create receive port for communication
        final receivePort = ReceivePort();

        // Spawn isolate
        final isolate = await Isolate.spawn(
          _isolateEntryPoint,
          IsolateMessage(
            sendPort: receivePort.sendPort,
            taskId: taskId,
            computation: computation,
            data: data,
          ),
        );

        _isolates[taskId] = isolate;

        // Listen for result
        receivePort.listen((message) {
          if (message is IsolateResult) {
            if (message.taskId == taskId) {
              if (message.error != null) {
                completer.completeError(message.error!);
              } else {
                completer.complete(message.result as T);
              }
              _cleanup(taskId, receivePort);
            }
          }
        });

        return await completer.future;
      } catch (e) {
        debugPrint('Error executing task in isolate: $e');
        _cleanup(taskId, null);
        rethrow;
      }
    } else {
      // Fallback for web - execute on main thread
      return await computation(data);
    }
  }

  /// Execute database operations in isolate
  Future<T> executeDatabaseOperation<T>({
    required String operationId,
    required Future<T> Function() operation,
  }) async {
    // Always execute database operations on main thread to avoid
    // sqflite initialization issues in isolates
    debugPrint('Executing database operation on main thread: $operationId');
    try {
      return await operation();
    } catch (e) {
      debugPrint('Error executing database operation: $e');
      rethrow;
    }
  }

  /// Execute file I/O operations in isolate
  Future<T> executeFileOperation<T>({
    required String operationId,
    required Future<T> Function() operation,
  }) async {
    if (!kIsWeb) {
      return await executeInIsolate<T>(
        taskId: operationId,
        computation: _fileOperationWrapper,
        data: operation,
      );
    } else {
      // Fallback for web
      return await operation();
    }
  }

  /// Execute data processing in isolate
  Future<List<Map<String, dynamic>>> processDataInIsolate({
    required String processId,
    required List<Map<String, dynamic>> data,
    required List<Map<String, dynamic>> Function(List<Map<String, dynamic>>)
    processor,
  }) async {
    if (!kIsWeb && data.length > 100) {
      return await executeInIsolate<List<Map<String, dynamic>>>(
        taskId: processId,
        computation: _dataProcessingWrapper,
        data: {'data': data, 'processor': processor},
      );
    } else {
      // Execute on main thread for small datasets or web
      return processor(data);
    }
  }

  /// Cancel a running isolate task
  void cancelTask(String taskId) {
    _cleanup(taskId, null);
  }

  /// Cleanup isolate resources
  void _cleanup(String taskId, ReceivePort? receivePort) {
    receivePort?.close();
    _isolates[taskId]?.kill(priority: Isolate.immediate);
    _isolates.remove(taskId);
    _sendPorts.remove(taskId);
    _completers.remove(taskId);
  }

  /// Entry point for isolate
  static void _isolateEntryPoint(IsolateMessage message) async {
    try {
      // Initialize background isolate binary messenger for secure storage
      if (!kIsWeb) {
        try {
          // Use the rootIsolateToken from WidgetsFlutterBinding
          final rootToken = ServicesBinding.rootIsolateToken;
          if (rootToken != null) {
            BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
          }
        } catch (e) {
          debugPrint(
            'Failed to initialize BackgroundIsolateBinaryMessenger: $e',
          );
        }
      }

      final result = await message.computation(message.data);
      message.sendPort.send(
        IsolateResult(taskId: message.taskId, result: result),
      );
    } catch (error) {
      debugPrint('Error executing task in isolate: $error');
      message.sendPort.send(
        IsolateResult(taskId: message.taskId, error: error),
      );
    }
  }

  /// File operation wrapper
  static Future<T> _fileOperationWrapper<T>(
    Future<T> Function() operation,
  ) async {
    return await operation();
  }

  /// Data processing wrapper
  static List<Map<String, dynamic>> _dataProcessingWrapper(
    Map<String, dynamic> params,
  ) {
    final data = params['data'] as List<Map<String, dynamic>>;
    final processor =
        params['processor']
            as List<Map<String, dynamic>> Function(List<Map<String, dynamic>>);
    return processor(data);
  }

  /// Dispose all isolates
  void dispose() {
    for (final taskId in _isolates.keys.toList()) {
      _cleanup(taskId, null);
    }
  }
}

/// Message class for isolate communication
class IsolateMessage {
  final SendPort sendPort;
  final String taskId;
  final Function computation;
  final dynamic data;

  IsolateMessage({
    required this.sendPort,
    required this.taskId,
    required this.computation,
    required this.data,
  });
}

/// Result class for isolate communication
class IsolateResult {
  final String taskId;
  final dynamic result;
  final dynamic error;

  IsolateResult({required this.taskId, this.result, this.error});
}
