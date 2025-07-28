import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entities/workout_session_entity.dart';

@singleton
class WorkoutDatabaseService {
  static Database? _database;
  static const String _dbName = 'workout_sessions.db';
  static const String _tableName = 'workout_sessions';
  static const int _dbVersion = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    debugPrint('🗄️ [DatabaseService] Initializing workout database...');

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    debugPrint('🗄️ [DatabaseService] Database path: $path');

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _createTable,
      onUpgrade: _upgradeTable,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    debugPrint('🗄️ [DatabaseService] Creating workout_sessions table...');

    await db.execute('''
      CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        workoutPlanId TEXT NOT NULL,
        workoutPlanName TEXT NOT NULL,
        startTime INTEGER NOT NULL,
        endTime INTEGER NOT NULL,
        durationSeconds INTEGER NOT NULL,
        totalDurationSeconds INTEGER NOT NULL,
        caloriesBurned INTEGER NOT NULL,
        progress REAL NOT NULL,
        sensorData TEXT,
        exercisesCompleted TEXT,
        setsCompleted INTEGER NOT NULL
      )
    ''');

    debugPrint('🗄️ [DatabaseService] Table created successfully');
  }

  Future<void> _upgradeTable(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    debugPrint(
      '🗄️ [DatabaseService] Upgrading database from v$oldVersion to v$newVersion',
    );
    // Handle database upgrades here if needed
  }

  Future<void> insertSession(WorkoutSessionEntity session) async {
    debugPrint('🗄️ [DatabaseService] Inserting session: ${session.id}');

    final db = await database;

    final sessionMap = {
      'id': session.id,
      'workoutPlanId': session.workoutPlanId,
      'workoutPlanName': session.workoutPlanName,
      'startTime': session.startTime.millisecondsSinceEpoch,
      'endTime': session.endTime.millisecondsSinceEpoch,
      'durationSeconds': session.durationSeconds,
      'totalDurationSeconds': session.totalDurationSeconds,
      'caloriesBurned': session.caloriesBurned,
      'progress': session.progress,
      'sensorData': session.sensorData.isNotEmpty
          ? jsonEncode(
              session.sensorData
                  .map(
                    (data) => {
                      'timestamp': data.timestamp.millisecondsSinceEpoch,
                      'elapsedSeconds': data.elapsedSeconds,
                      'heartRate': data.heartRate,
                      'calories': data.calories,
                      'progress': data.progress,
                      'isPaused': data.isPaused,
                    },
                  )
                  .toList(),
            )
          : null,
      'exercisesCompleted': session.exercisesCompleted.join(','),
      'setsCompleted': session.setsCompleted,
    };

    await db.insert(
      _tableName,
      sessionMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    debugPrint('🗄️ [DatabaseService] Session inserted successfully');
  }

  Future<List<WorkoutSessionEntity>> getAllSessions() async {
    debugPrint('🗄️ [DatabaseService] Fetching all sessions from database...');

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'startTime DESC',
    );

    debugPrint(
      '🗄️ [DatabaseService] Found ${maps.length} sessions in database',
    );

    return maps.map((map) => _mapToEntity(map)).toList();
  }

  Future<WorkoutSessionEntity?> getSessionById(String id) async {
    debugPrint('🗄️ [DatabaseService] Fetching session by ID: $id');

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      debugPrint('🗄️ [DatabaseService] Session found');
      return _mapToEntity(maps.first);
    }

    debugPrint('🗄️ [DatabaseService] Session not found');
    return null;
  }

  Future<List<WorkoutSessionEntity>> getSessionsByWorkoutPlan(
    String workoutPlanId,
  ) async {
    debugPrint(
      '🗄️ [DatabaseService] Fetching sessions for workout plan: $workoutPlanId',
    );

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'workoutPlanId = ?',
      whereArgs: [workoutPlanId],
      orderBy: 'startTime DESC',
    );

    debugPrint(
      '🗄️ [DatabaseService] Found ${maps.length} sessions for workout plan',
    );

    return maps.map((map) => _mapToEntity(map)).toList();
  }

  Future<void> deleteSession(String id) async {
    debugPrint('🗄️ [DatabaseService] Deleting session: $id');

    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);

    debugPrint('🗄️ [DatabaseService] Session deleted successfully');
  }

  Future<void> deleteAllSessions() async {
    debugPrint('🗄️ [DatabaseService] Deleting all sessions...');

    final db = await database;
    await db.delete(_tableName);

    debugPrint('🗄️ [DatabaseService] All sessions deleted successfully');
  }

  WorkoutSessionEntity _mapToEntity(Map<String, dynamic> map) {
    // Parse sensor data from JSON or legacy toString format
    List<WorkoutSensorData> sensorData = [];
    if (map['sensorData'] != null && map['sensorData'].toString().isNotEmpty) {
      try {
        final sensorDataString = map['sensorData'].toString();

        // Try parsing as JSON first (new format)
        if (sensorDataString.startsWith('[{') &&
            sensorDataString.contains('"')) {
          final List<dynamic> sensorList = jsonDecode(sensorDataString);
          sensorData = sensorList
              .map(
                (item) => WorkoutSensorData(
                  timestamp: DateTime.fromMillisecondsSinceEpoch(
                    item['timestamp'],
                  ),
                  elapsedSeconds: item['elapsedSeconds'],
                  heartRate: item['heartRate'],
                  calories: (item['calories'] as num).toDouble(),
                  progress: (item['progress'] as num).toDouble(),
                  isPaused: item['isPaused'] ?? false,
                ),
              )
              .toList();
        } else {
          // Handle legacy toString format - extract data using regex
          debugPrint(
            '🗄️ [DatabaseService] Parsing legacy sensor data format for session ${map['id']}',
          );
          sensorData = _parseLegacySensorData(sensorDataString);
        }

        debugPrint(
          '🗄️ [DatabaseService] Parsed ${sensorData.length} sensor data points for session ${map['id']}',
        );
      } catch (e) {
        debugPrint('🗄️ [DatabaseService] Error parsing sensor data: $e');
        sensorData = [];
      }
    }

    return WorkoutSessionEntity(
      id: map['id'],
      workoutPlanId: map['workoutPlanId'],
      workoutPlanName: map['workoutPlanName'],
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime']),
      durationSeconds: map['durationSeconds'],
      totalDurationSeconds: map['totalDurationSeconds'],
      caloriesBurned: map['caloriesBurned'],
      progress: map['progress'],
      sensorData: sensorData,
      exercisesCompleted:
          map['exercisesCompleted'] != null &&
              map['exercisesCompleted'].isNotEmpty
          ? map['exercisesCompleted'].split(',')
          : [],
      setsCompleted: map['setsCompleted'],
    );
  }

  List<WorkoutSensorData> _parseLegacySensorData(String legacyData) {
    try {
      // Legacy data looks like: [{timestamp: 1753706212474, elapsedSeconds: 1, heartRate: 0, calories: 0.0, progress: 0.0006666666666666666, isPaused: false}, ...]
      final List<WorkoutSensorData> sensorData = [];

      // Remove the outer brackets and split by '}, {'
      final cleanData = legacyData.substring(
        1,
        legacyData.length - 1,
      ); // Remove [ and ]
      final items = cleanData.split('}, {');

      for (String item in items) {
        try {
          // Clean up the item and extract values using regex
          String cleanItem = item.replaceAll('{', '').replaceAll('}', '');

          // Extract timestamp
          final timestampMatch = RegExp(
            r'timestamp:\s*(\d+)',
          ).firstMatch(cleanItem);
          final elapsedMatch = RegExp(
            r'elapsedSeconds:\s*(\d+)',
          ).firstMatch(cleanItem);
          final heartRateMatch = RegExp(
            r'heartRate:\s*(\d+)',
          ).firstMatch(cleanItem);
          final caloriesMatch = RegExp(
            r'calories:\s*([\d.]+)',
          ).firstMatch(cleanItem);
          final progressMatch = RegExp(
            r'progress:\s*([\d.]+)',
          ).firstMatch(cleanItem);
          final isPausedMatch = RegExp(
            r'isPaused:\s*(true|false)',
          ).firstMatch(cleanItem);

          if (timestampMatch != null && elapsedMatch != null) {
            sensorData.add(
              WorkoutSensorData(
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  int.parse(timestampMatch.group(1)!),
                ),
                elapsedSeconds: int.parse(elapsedMatch.group(1)!),
                heartRate: heartRateMatch != null
                    ? int.parse(heartRateMatch.group(1)!)
                    : 0,
                calories: caloriesMatch != null
                    ? double.parse(caloriesMatch.group(1)!)
                    : 0.0,
                progress: progressMatch != null
                    ? double.parse(progressMatch.group(1)!)
                    : 0.0,
                isPaused: isPausedMatch != null
                    ? isPausedMatch.group(1) == 'true'
                    : false,
              ),
            );
          }
        } catch (e) {
          debugPrint(
            '🗄️ [DatabaseService] Error parsing legacy sensor item: $e',
          );
          continue;
        }
      }

      return sensorData;
    } catch (e) {
      debugPrint('🗄️ [DatabaseService] Error parsing legacy sensor data: $e');
      return [];
    }
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
      debugPrint('🗄️ [DatabaseService] Database closed');
    }
  }
}
