import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';
import '../models/auth_response_model.dart';
import '../../core/services/isolate_service.dart';
import '../../core/di/di.dart';

@singleton
class DatabaseHelper {
  static Database? _database;
  static const String _databaseName = 'fittrack_pro.db';
  static const int _databaseVersion = 1;

  // Table names
  static const String _usersTable = 'users';
  static const String _authTokensTable = 'auth_tokens';
  static const String _preRegisteredUsersTable = 'pre_registered_users';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final documentsDirectory = await getDatabasesPath();
      final path = join(documentsDirectory, _databaseName);

      return await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );
    } catch (e) {
      debugPrint('Error initializing database: $e');
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    // Users table
    await db.execute('''
      CREATE TABLE $_usersTable (
        id TEXT PRIMARY KEY,
        email TEXT UNIQUE NOT NULL,
        name TEXT,
        photo_url TEXT,
        phone_number TEXT,
        is_email_verified INTEGER DEFAULT 0,
        is_phone_verified INTEGER DEFAULT 0,
        is_two_factor_enabled INTEGER DEFAULT 0,
        created_at TEXT,
        updated_at TEXT,
        last_login_at TEXT
      )
    ''');

    // Auth tokens table
    await db.execute('''
      CREATE TABLE $_authTokensTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id TEXT NOT NULL,
        access_token TEXT NOT NULL,
        refresh_token TEXT NOT NULL,
        token_type TEXT NOT NULL,
        expires_in INTEGER NOT NULL,
        created_at TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES $_usersTable (id) ON DELETE CASCADE
      )
    ''');

    // Pre-registered users table (for quick login functionality)
    await db.execute('''
      CREATE TABLE $_preRegisteredUsersTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE NOT NULL,
        encrypted_password TEXT NOT NULL,
        name TEXT,
        is_active INTEGER DEFAULT 1,
        created_at TEXT NOT NULL
      )
    ''');

    // Create indexes
    await db.execute('CREATE INDEX idx_users_email ON $_usersTable (email)');
    await db.execute(
      'CREATE INDEX idx_auth_tokens_user_id ON $_authTokensTable (user_id)',
    );
    await db.execute(
      'CREATE INDEX idx_pre_registered_email ON $_preRegisteredUsersTable (email)',
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database migrations here in future versions
  }

  // User operations
  Future<int> insertUser(UserModel user) async {
    final db = await database;
    final userMap = _userModelToMap(user);
    return await db.insert(
      _usersTable,
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserModel?> getUserById(String userId) async {
    final db = await database;
    final maps = await db.query(
      _usersTable,
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      return _mapToUserModel(maps.first);
    }
    return null;
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;
    final maps = await db.query(
      _usersTable,
      where: 'email = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return _mapToUserModel(maps.first);
    }
    return null;
  }

  Future<int> updateUser(UserModel user) async {
    final db = await database;
    final userMap = _userModelToMap(user);
    return await db.update(
      _usersTable,
      userMap,
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(String userId) async {
    final db = await database;
    return await db.delete(_usersTable, where: 'id = ?', whereArgs: [userId]);
  }

  /// Bulk operations using isolates for heavy processing
  Future<void> bulkInsertUsersWithIsolate(List<UserModel> users) async {
    if (users.length > 50) {
      // Use isolate for large datasets
      final isolateService = locator<IsolateService>();
      await isolateService.executeDatabaseOperation(
        operationId:
            'bulk_insert_users_${DateTime.now().millisecondsSinceEpoch}',
        operation: () => _performBulkInsert(users),
      );
    } else {
      // Execute on main thread for small datasets
      await _performBulkInsert(users);
    }
  }

  Future<void> _performBulkInsert(List<UserModel> users) async {
    final db = await database;
    final batch = db.batch();

    for (final user in users) {
      final userMap = _userModelToMap(user);
      batch.insert(
        _usersTable,
        userMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  /// Clean up old data using isolate
  Future<void> cleanupOldDataWithIsolate() async {
    final isolateService = locator<IsolateService>();
    await isolateService.executeDatabaseOperation(
      operationId: 'cleanup_old_data_${DateTime.now().millisecondsSinceEpoch}',
      operation: () => _performDataCleanup(),
    );
  }

  Future<void> _performDataCleanup() async {
    final db = await database;
    final oneMonthAgo = DateTime.now().subtract(const Duration(days: 30));

    // Delete old auth tokens
    await db.delete(
      _authTokensTable,
      where: 'created_at < ?',
      whereArgs: [oneMonthAgo.toIso8601String()],
    );

    // Vacuum database to reclaim space
    await db.execute('VACUUM');
  }

  // Auth token operations
  Future<int> saveAuthResponse(AuthResponseModel authResponse) async {
    final db = await database;

    // First, delete any existing tokens for this user
    await deleteAuthTokens(authResponse.user.id);

    // Insert new tokens
    final tokenMap = {
      'user_id': authResponse.user.id,
      'access_token': authResponse.accessToken,
      'refresh_token': authResponse.refreshToken,
      'token_type': authResponse.tokenType,
      'expires_in': authResponse.expiresIn,
      'created_at': DateTime.now().toIso8601String(),
    };

    return await db.insert(_authTokensTable, tokenMap);
  }

  Future<AuthResponseModel?> getAuthResponse(String userId) async {
    final db = await database;
    final maps = await db.query(
      _authTokensTable,
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      final tokenMap = maps.first;
      final user = await getUserById(userId);
      if (user != null) {
        return AuthResponseModel(
          user: user,
          accessToken: tokenMap['access_token'] as String,
          refreshToken: tokenMap['refresh_token'] as String,
          tokenType: tokenMap['token_type'] as String,
          expiresIn: tokenMap['expires_in'] as int,
        );
      }
    }
    return null;
  }

  Future<String?> getAccessToken(String userId) async {
    final db = await database;
    final maps = await db.query(
      _authTokensTable,
      columns: ['access_token'],
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return maps.first['access_token'] as String;
    }
    return null;
  }

  Future<int> deleteAuthTokens(String userId) async {
    final db = await database;
    return await db.delete(
      _authTokensTable,
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  // Pre-registered users operations
  Future<int> addPreRegisteredUser({
    required String email,
    required String encryptedPassword,
    String? name,
  }) async {
    final db = await database;
    final userMap = {
      'email': email,
      'encrypted_password': encryptedPassword,
      'name': name,
      'is_active': 1,
      'created_at': DateTime.now().toIso8601String(),
    };

    return await db.insert(
      _preRegisteredUsersTable,
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getPreRegisteredUser(String email) async {
    final db = await database;
    final maps = await db.query(
      _preRegisteredUsersTable,
      where: 'email = ? AND is_active = 1',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getAllPreRegisteredUsers() async {
    final db = await database;
    return await db.query(
      _preRegisteredUsersTable,
      where: 'is_active = 1',
      orderBy: 'created_at DESC',
    );
  }

  Future<int> deactivatePreRegisteredUser(String email) async {
    final db = await database;
    return await db.update(
      _preRegisteredUsersTable,
      {'is_active': 0},
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  /// Clear all authentication data
  Future<void> clearAuthData() async {
    final db = await database;
    await db.delete(_authTokensTable);
  }

  // Utility methods
  Map<String, dynamic> _userModelToMap(UserModel user) {
    return {
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'photo_url': user.photoUrl,
      'phone_number': user.phoneNumber,
      'is_email_verified': user.isEmailVerified ? 1 : 0,
      'is_phone_verified': user.isPhoneVerified ? 1 : 0,
      'is_two_factor_enabled': user.isTwoFactorEnabled ? 1 : 0,
      'created_at': user.createdAt?.toIso8601String(),
      'updated_at': user.updatedAt?.toIso8601String(),
      'last_login_at': user.lastLoginAt?.toIso8601String(),
    };
  }

  UserModel _mapToUserModel(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String?,
      photoUrl: map['photo_url'] as String?,
      phoneNumber: map['phone_number'] as String?,
      isEmailVerified: (map['is_email_verified'] as int) == 1,
      isPhoneVerified: (map['is_phone_verified'] as int) == 1,
      isTwoFactorEnabled: (map['is_two_factor_enabled'] as int) == 1,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
      lastLoginAt: map['last_login_at'] != null
          ? DateTime.parse(map['last_login_at'] as String)
          : null,
    );
  }

  // Clear all data (useful for logout or testing)
  Future<void> clearAllData() async {
    final db = await database;
    await db.delete(_usersTable);
    await db.delete(_authTokensTable);
    // Note: We don't clear pre-registered users as they should persist
  }

  // Close database
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
