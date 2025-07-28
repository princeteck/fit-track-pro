import 'package:dartz/dartz.dart';

import '../models/user_model.dart';
import '../models/auth_response_model.dart';

abstract class AuthLocalDataSource {
  /// Save authentication response to local storage
  Future<Unit> saveAuthResponse(AuthResponseModel authResponse);

  /// Get current user from local storage
  Future<UserModel?> getCurrentUser();

  /// Get stored access token
  Future<String?> getAccessToken();

  /// Get stored refresh token
  Future<String?> getRefreshToken();

  /// Check if user is signed in locally
  Future<bool> isSignedIn();

  /// Save user data to local storage
  Future<Unit> saveUser(UserModel user);

  /// Update user data in local storage
  Future<Unit> updateUser(UserModel user);

  /// Clear all authentication data (sign out)
  Future<Unit> clearAuthData();

  /// Add pre-registered user for quick login
  Future<Unit> addPreRegisteredUser({
    required String email,
    required String encryptedPassword,
    String? name,
  });

  /// Get pre-registered user by email
  Future<Map<String, dynamic>?> getPreRegisteredUser(String email);

  /// Get all pre-registered users
  Future<List<Map<String, dynamic>>> getAllPreRegisteredUsers();

  /// Deactivate pre-registered user
  Future<Unit> deactivatePreRegisteredUser(String email);
}
