import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';

import '../models/heart_rate_model.dart';
import 'database_helper.dart';

@singleton
class HeartRateLocalDataSource {
  final DatabaseHelper _databaseHelper;
  static const String _heartRateTable = 'heart_rate_readings';
  static const String _heartRateSessionsTable = 'heart_rate_sessions';
  static const String _heartRateReadingsTable = 'heart_rate_readings_detail';

  HeartRateLocalDataSource(this._databaseHelper);

  Future<Database> get database => _databaseHelper.database;

  Future<void> initializeHeartRateTable() async {
    final db = await database;

    // Main heart rate readings table (summary records)
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_heartRateTable (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        bpm INTEGER NOT NULL,
        timestamp TEXT NOT NULL,
        type TEXT NOT NULL DEFAULT 'resting',
        notes TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT,
        session_id TEXT,
        session_duration_seconds INTEGER,
        chart_data TEXT,
        readings_data TEXT,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    // Heart rate sessions table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_heartRateSessionsTable (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        type TEXT NOT NULL,
        start_time TEXT NOT NULL,
        end_time TEXT,
        duration_seconds INTEGER NOT NULL,
        average_bpm INTEGER,
        min_bpm INTEGER,
        max_bpm INTEGER,
        notes TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    // Detailed heart rate readings table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_heartRateReadingsTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        session_id TEXT NOT NULL,
        bpm INTEGER NOT NULL,
        timestamp TEXT NOT NULL,
        interval_ms REAL NOT NULL,
        FOREIGN KEY (session_id) REFERENCES $_heartRateSessionsTable (id) ON DELETE CASCADE
      )
    ''');

    // Create indexes
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_heart_rate_user_id ON $_heartRateTable (user_id)',
    );
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_heart_rate_timestamp ON $_heartRateTable (timestamp)',
    );
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_heart_rate_user_timestamp ON $_heartRateTable (user_id, timestamp)',
    );
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_heart_rate_sessions_user_id ON $_heartRateSessionsTable (user_id)',
    );
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_heart_rate_readings_session_id ON $_heartRateReadingsTable (session_id)',
    );
  }

  Future<int> insertHeartRate(HeartRateModel heartRate) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists
    final heartRateMap = _heartRateModelToMap(heartRate);
    return await db.insert(
      _heartRateTable,
      heartRateMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HeartRateModel>> getHeartRatesByUserId(
    String userId, {
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists

    String whereClause = 'user_id = ?';
    List<dynamic> whereArgs = [userId];

    if (startDate != null) {
      whereClause += ' AND timestamp >= ?';
      whereArgs.add(startDate.toIso8601String());
    }

    if (endDate != null) {
      whereClause += ' AND timestamp <= ?';
      whereArgs.add(endDate.toIso8601String());
    }

    final maps = await db.query(
      _heartRateTable,
      where: whereClause,
      whereArgs: whereArgs,
      orderBy: 'timestamp DESC',
      limit: limit,
    );

    return maps.map((map) => _mapToHeartRateModel(map)).toList();
  }

  Future<HeartRateStatsModel?> getHeartRateStats(
    String userId, {
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists

    final maps = await db.rawQuery(
      '''
      SELECT 
        AVG(bpm) as avg_bpm,
        MIN(bpm) as min_bpm,
        MAX(bpm) as max_bpm,
        COUNT(*) as readings_count
      FROM $_heartRateTable 
      WHERE user_id = ? AND timestamp >= ? AND timestamp <= ?
    ''',
      [userId, startDate.toIso8601String(), endDate.toIso8601String()],
    );

    if (maps.isNotEmpty && maps.first['readings_count'] != 0) {
      final map = maps.first;

      // Get resting heart rate (average of resting readings)
      final restingMaps = await db.rawQuery(
        '''
        SELECT AVG(bpm) as resting_bpm
        FROM $_heartRateTable 
        WHERE user_id = ? AND timestamp >= ? AND timestamp <= ? AND type = 'resting'
      ''',
        [userId, startDate.toIso8601String(), endDate.toIso8601String()],
      );

      final restingBpm =
          restingMaps.isNotEmpty && restingMaps.first['resting_bpm'] != null
          ? (restingMaps.first['resting_bpm'] as double).round()
          : null;

      return HeartRateStatsModel(
        averageBpm: map['avg_bpm'] as double,
        minBpm: map['min_bpm'] as int,
        maxBpm: map['max_bpm'] as int,
        restingBpm: restingBpm,
        dateRange: CustomDateTimeRange(start: startDate, end: endDate),
        readingsCount: map['readings_count'] as int,
      );
    }

    return null;
  }

  Future<HeartRateModel?> getLatestHeartRate(String userId) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists

    final maps = await db.query(
      _heartRateTable,
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'timestamp DESC',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return _mapToHeartRateModel(maps.first);
    }
    return null;
  }

  Future<int> updateHeartRate(HeartRateModel heartRate) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists

    final heartRateMap = _heartRateModelToMap(heartRate);
    heartRateMap['updated_at'] = DateTime.now().toIso8601String();

    return await db.update(
      _heartRateTable,
      heartRateMap,
      where: 'id = ?',
      whereArgs: [heartRate.id],
    );
  }

  Future<int> deleteHeartRate(String id) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists

    return await db.delete(_heartRateTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteHeartRatesByUserId(String userId) async {
    final db = await database;
    await initializeHeartRateTable(); // Ensure table exists

    return await db.delete(
      _heartRateTable,
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  Map<String, dynamic> _heartRateModelToMap(HeartRateModel heartRate) {
    return {
      'id': heartRate.id,
      'user_id': heartRate.userId,
      'bpm': heartRate.bpm,
      'timestamp': heartRate.timestamp.toIso8601String(),
      'type': heartRate.type.name,
      'notes': heartRate.notes,
      'created_at': heartRate.createdAt.toIso8601String(),
      'updated_at': heartRate.updatedAt?.toIso8601String(),
      'session_id': heartRate.sessionId,
      'session_duration_seconds': heartRate.sessionDurationSeconds,
      'chart_data': heartRate.chartData.isNotEmpty
          ? jsonEncode(
              heartRate.chartData.map((e) => {'x': e.x, 'y': e.y}).toList(),
            )
          : null,
      'readings_data': heartRate.readings.isNotEmpty
          ? jsonEncode(
              heartRate.readings
                  .map(
                    (e) => {
                      'bpm': e.bpm,
                      'timestamp': e.timestamp.toIso8601String(),
                      'intervalMs': e.intervalMs,
                    },
                  )
                  .toList(),
            )
          : null,
    };
  }

  HeartRateModel _mapToHeartRateModel(Map<String, dynamic> map) {
    // Parse chart data from JSON string
    List<ChartDataPoint> chartData = [];
    if (map['chart_data'] != null) {
      try {
        final List<dynamic> chartJson = jsonDecode(map['chart_data'] as String);
        chartData = chartJson
            .map(
              (item) => ChartDataPoint(
                x: (item['x'] as num).toDouble(),
                y: (item['y'] as num).toDouble(),
              ),
            )
            .toList();
      } catch (e) {
        chartData = [];
      }
    }

    // Parse readings data from JSON string
    List<HeartRateReading> readings = [];
    if (map['readings_data'] != null) {
      try {
        final List<dynamic> readingsJson = jsonDecode(
          map['readings_data'] as String,
        );
        readings = readingsJson
            .map(
              (item) => HeartRateReading(
                bpm: item['bpm'] as int,
                timestamp: DateTime.parse(item['timestamp'] as String),
                intervalMs: (item['intervalMs'] as num).toDouble(),
              ),
            )
            .toList();
      } catch (e) {
        readings = [];
      }
    }

    return HeartRateModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      bpm: map['bpm'] as int,
      timestamp: DateTime.parse(map['timestamp'] as String),
      type: HeartRateType.values.firstWhere(
        (type) => type.name == map['type'],
        orElse: () => HeartRateType.resting,
      ),
      notes: map['notes'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
      sessionId: map['session_id'] as String?,
      sessionDurationSeconds: map['session_duration_seconds'] as int?,
      chartData: chartData,
      readings: readings,
    );
  }

  // Session-related methods
  Future<int> insertHeartRateSession(HeartRateSession session) async {
    final db = await database;
    await initializeHeartRateTable();

    // Insert session record
    final sessionMap = {
      'id': session.id,
      'user_id': session.userId,
      'type': session.type.name,
      'start_time': session.startTime.toIso8601String(),
      'end_time': session.endTime?.toIso8601String(),
      'duration_seconds': session.durationSeconds,
      'average_bpm': session.averageBpm,
      'min_bpm': session.minBpm,
      'max_bpm': session.maxBpm,
      'notes': session.notes,
      'created_at': session.createdAt.toIso8601String(),
      'updated_at': session.updatedAt?.toIso8601String(),
    };

    await db.insert(_heartRateSessionsTable, sessionMap);

    // Insert detailed readings
    for (final reading in session.readings) {
      final readingMap = {
        'session_id': session.id,
        'bpm': reading.bpm,
        'timestamp': reading.timestamp.toIso8601String(),
        'interval_ms': reading.intervalMs,
      };
      await db.insert(_heartRateReadingsTable, readingMap);
    }

    return 1;
  }

  // Heart Rate Session methods
  Future<int> saveHeartRateSession(HeartRateSession session) async {
    final db = await database;
    await initializeHeartRateTable();

    // First save the session
    final sessionMap = {
      'id': session.id,
      'user_id': session.userId,
      'type': session.type.name,
      'start_time': session.startTime.toIso8601String(),
      'end_time': session.endTime?.toIso8601String(),
      'duration_seconds': session.durationSeconds,
      'average_bpm': session.averageBpm,
      'min_bpm': session.minBpm,
      'max_bpm': session.maxBpm,
      'notes': session.notes,
      'created_at': session.createdAt.toIso8601String(),
      'updated_at': session.updatedAt?.toIso8601String(),
    };

    final sessionResult = await db.insert(
      _heartRateSessionsTable,
      sessionMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Then save the detailed readings
    for (final reading in session.readings) {
      final readingMap = {
        'session_id': session.id,
        'bpm': reading.bpm,
        'timestamp': reading.timestamp.toIso8601String(),
        'interval_ms': reading.intervalMs,
      };

      await db.insert(
        _heartRateReadingsTable,
        readingMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Also create a summary record in the main heart rate table
    final summaryRecord = HeartRateModel(
      id: 'summary_${session.id}',
      userId: session.userId,
      bpm: session.averageBpm ?? 0,
      timestamp: session.endTime ?? session.startTime,
      type: session.type,
      notes: session.notes,
      createdAt: session.createdAt,
      sessionId: session.id,
      sessionDurationSeconds: session.durationSeconds,
      readings: session.readings,
      chartData: session.chartData,
    );

    await insertHeartRate(summaryRecord);

    return sessionResult;
  }

  Future<List<HeartRateSession>> getHeartRateSessionsByUserId(
    String userId, {
    int? limit,
  }) async {
    final db = await database;
    await initializeHeartRateTable();

    final maps = await db.query(
      _heartRateSessionsTable,
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'start_time DESC',
      limit: limit,
    );

    final sessions = <HeartRateSession>[];
    for (final map in maps) {
      final sessionId = map['id'] as String;

      // Get detailed readings for this session
      final readingMaps = await db.query(
        _heartRateReadingsTable,
        where: 'session_id = ?',
        whereArgs: [sessionId],
        orderBy: 'timestamp ASC',
      );

      final readings = readingMaps
          .map(
            (readingMap) => HeartRateReading(
              bpm: readingMap['bpm'] as int,
              timestamp: DateTime.parse(readingMap['timestamp'] as String),
              intervalMs: readingMap['interval_ms'] as double,
            ),
          )
          .toList();

      sessions.add(
        HeartRateSession(
          id: sessionId,
          userId: map['user_id'] as String,
          type: HeartRateType.values.firstWhere(
            (type) => type.name == map['type'],
            orElse: () => HeartRateType.resting,
          ),
          startTime: DateTime.parse(map['start_time'] as String),
          endTime: map['end_time'] != null
              ? DateTime.parse(map['end_time'] as String)
              : null,
          durationSeconds: map['duration_seconds'] as int,
          readings: readings,
          averageBpm: map['average_bpm'] as int?,
          minBpm: map['min_bpm'] as int?,
          maxBpm: map['max_bpm'] as int?,
          notes: map['notes'] as String?,
          createdAt: DateTime.parse(map['created_at'] as String),
          updatedAt: map['updated_at'] != null
              ? DateTime.parse(map['updated_at'] as String)
              : null,
        ),
      );
    }

    return sessions;
  }

  Future<HeartRateSession?> getHeartRateSessionById(String sessionId) async {
    final db = await database;
    await initializeHeartRateTable();

    final maps = await db.query(
      _heartRateSessionsTable,
      where: 'id = ?',
      whereArgs: [sessionId],
    );

    if (maps.isEmpty) return null;

    final map = maps.first;

    // Get detailed readings for this session
    final readingMaps = await db.query(
      _heartRateReadingsTable,
      where: 'session_id = ?',
      whereArgs: [sessionId],
      orderBy: 'timestamp ASC',
    );

    final readings = readingMaps
        .map(
          (readingMap) => HeartRateReading(
            bpm: readingMap['bpm'] as int,
            timestamp: DateTime.parse(readingMap['timestamp'] as String),
            intervalMs: readingMap['interval_ms'] as double,
          ),
        )
        .toList();

    return HeartRateSession(
      id: sessionId,
      userId: map['user_id'] as String,
      type: HeartRateType.values.firstWhere(
        (type) => type.name == map['type'],
        orElse: () => HeartRateType.resting,
      ),
      startTime: DateTime.parse(map['start_time'] as String),
      endTime: map['end_time'] != null
          ? DateTime.parse(map['end_time'] as String)
          : null,
      durationSeconds: map['duration_seconds'] as int,
      readings: readings,
      averageBpm: map['average_bpm'] as int?,
      minBpm: map['min_bpm'] as int?,
      maxBpm: map['max_bpm'] as int?,
      notes: map['notes'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }
}
