import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';
import '../models/auth_response_model.dart';
import 'auth_local_data_source.dart';
import 'database_helper.dart';
import '../../core/services/isolate_service.dart';
import '../../core/services/memory_manager_service.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper _databaseHelper;
  final IsolateService _isolateService;
  final MemoryManagerService _memoryManager;
  String? _currentUserId;

  AuthLocalDataSourceImpl(
    this._databaseHelper,
    this._isolateService,
    this._memoryManager,
  );

  @override
  Future<Unit> saveAuthResponse(AuthResponseModel authResponse) async {
    try {
      // Save user data
      await _databaseHelper.insertUser(authResponse.user);

      // Save auth tokens
      await _databaseHelper.saveAuthResponse(authResponse);

      // Store current user ID for quick access
      _currentUserId = authResponse.user.id;

      return unit;
    } catch (e) {
      throw Exception('Failed to save auth response: $e');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // First check if we have a cached user ID
      if (_currentUserId != null) {
        return await _databaseHelper.getUserById(_currentUserId!);
      }

      // If no cached user ID, get the most recent authentication from database
      final recentAuth = await _getMostRecentAuthentication();
      if (recentAuth != null) {
        _currentUserId = recentAuth.user.id; // Cache for future use
        return recentAuth.user;
      }

      return null;
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      // First check if we have a cached user ID
      if (_currentUserId != null) {
        return await _databaseHelper.getAccessToken(_currentUserId!);
      }

      // If no cached user ID, get the most recent authentication from database
      final recentAuth = await _getMostRecentAuthentication();
      if (recentAuth != null) {
        _currentUserId = recentAuth.user.id; // Cache for future use
        return recentAuth.accessToken;
      }

      return null;
    } catch (e) {
      throw Exception('Failed to get access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      // First check if we have a cached user ID
      if (_currentUserId != null) {
        final authResponse = await _databaseHelper.getAuthResponse(
          _currentUserId!,
        );
        return authResponse?.refreshToken;
      }

      // If no cached user ID, get the most recent authentication from database
      final recentAuth = await _getMostRecentAuthentication();
      if (recentAuth != null) {
        _currentUserId = recentAuth.user.id; // Cache for future use
        return recentAuth.refreshToken;
      }

      return null;
    } catch (e) {
      throw Exception('Failed to get refresh token: $e');
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      final accessToken = await getAccessToken();
      return accessToken != null && accessToken.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Unit> saveUser(UserModel user) async {
    try {
      await _databaseHelper.insertUser(user);
      return unit;
    } catch (e) {
      throw Exception('Failed to save user: $e');
    }
  }

  @override
  Future<Unit> updateUser(UserModel user) async {
    try {
      await _databaseHelper.updateUser(user);
      return unit;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  /// Bulk operation using memory manager to track resources
  Future<void> bulkProcessPreRegisteredUsers(
    List<Map<String, String>> userData,
  ) async {
    final operationId =
        'bulk_process_users_${DateTime.now().millisecondsSinceEpoch}';

    try {
      _memoryManager.registerOperation(operationId);

      if (userData.length > 20) {
        // Use isolate for large datasets
        await _isolateService.executeDatabaseOperation(
          operationId: operationId,
          operation: () => _processBulkUserData(userData),
        );
      } else {
        await _processBulkUserData(userData);
      }
    } finally {
      _memoryManager.unregisterOperation(operationId);
    }
  }

  Future<void> _processBulkUserData(List<Map<String, String>> userData) async {
    for (final data in userData) {
      final email = data['email']!;
      final password = data['password']!;
      final name = data['name'];

      await addPreRegisteredUser(
        email: email,
        encryptedPassword: password,
        name: name,
      );
    }
  }

  @override
  Future<Unit> clearAuthData() async {
    try {
      // Directly call database helper instead of using isolate to avoid potential hanging
      await _databaseHelper.clearAuthData();
      _currentUserId = null;

      return unit;
    } catch (e) {
      throw Exception('Failed to clear auth data: $e');
    }
  }

  @override
  Future<Unit> addPreRegisteredUser({
    required String email,
    required String encryptedPassword,
    String? name,
  }) async {
    try {
      // Hash the password for security
      final hashedPassword = _hashPassword(encryptedPassword);

      await _databaseHelper.addPreRegisteredUser(
        email: email,
        encryptedPassword: hashedPassword,
        name: name,
      );
      return unit;
    } catch (e) {
      throw Exception('Failed to add pre-registered user: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> getPreRegisteredUser(String email) async {
    try {
      return await _databaseHelper.getPreRegisteredUser(email);
    } catch (e) {
      throw Exception('Failed to get pre-registered user: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllPreRegisteredUsers() async {
    try {
      return await _databaseHelper.getAllPreRegisteredUsers();
    } catch (e) {
      throw Exception('Failed to get all pre-registered users: $e');
    }
  }

  @override
  Future<Unit> deactivatePreRegisteredUser(String email) async {
    try {
      await _databaseHelper.deactivatePreRegisteredUser(email);
      return unit;
    } catch (e) {
      throw Exception('Failed to deactivate pre-registered user: $e');
    }
  }

  /// Verify password against stored hash
  bool verifyPassword(String password, String hashedPassword) {
    final inputHash = _hashPassword(password);
    return inputHash == hashedPassword;
  }

  /// Hash password using SHA-256
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Set current user ID (useful for app initialization)
  void setCurrentUserId(String userId) {
    _currentUserId = userId;
  }

  /// Get current user ID
  String? get currentUserId => _currentUserId;

  /// Get the most recent authentication from database
  /// This is used when _currentUserId is null (e.g., after hot reload)
  Future<AuthResponseModel?> _getMostRecentAuthentication() async {
    try {
      final db = await _databaseHelper.database;
      final maps = await db.rawQuery('''
        SELECT * FROM auth_tokens 
        ORDER BY created_at DESC 
        LIMIT 1
      ''');

      if (maps.isNotEmpty) {
        final tokenMap = maps.first;
        final userId = tokenMap['user_id'] as String;
        final user = await _databaseHelper.getUserById(userId);

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
    } catch (e) {
      return null;
    }
  }
}
