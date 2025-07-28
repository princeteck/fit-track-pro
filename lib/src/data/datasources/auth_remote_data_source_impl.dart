import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';
import '../models/auth_response_model.dart';
import 'auth_remote_data_source.dart';
import 'auth_local_data_source.dart';
import 'auth_local_data_source_impl.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthLocalDataSource _localDataSource;

  AuthRemoteDataSourceImpl(this._localDataSource);

  // Mock user database - stores registered users with email and password
  static final Map<String, Map<String, dynamic>> _mockUserDatabase = {
    'user@example.com': {
      'password': 'password123',
      'name': 'John Doe',
      'id': 'mock_user_123',
      'isEmailVerified': true,
      'createdAt': DateTime.now().toIso8601String(),
    },
    'test@example.com': {
      'password': 'password123',
      'name': 'Test User',
      'id': 'test_user_456',
      'isEmailVerified': true,
      'createdAt': DateTime.now().toIso8601String(),
    },
    'existing@example.com': {
      'password': 'existing123',
      'name': 'Existing User',
      'id': 'existing_user_789',
      'isEmailVerified': true,
      'createdAt': DateTime.now().toIso8601String(),
    },
  };

  // Mock registered emails database (derived from user database)
  static Set<String> get _registeredEmails => _mockUserDatabase.keys.toSet();

  // Mock user data template
  static const _mockUser = UserModel(
    id: 'mock_user_123',
    email: 'user@example.com',
    name: 'John Doe',
    photoUrl: 'https://via.placeholder.com/150',
    phoneNumber: '+1234567890',
    isEmailVerified: true,
    isPhoneVerified: false,
    isTwoFactorEnabled: false,
  );

  @override
  Future<AuthResponseModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 2));

    final normalizedEmail = email.toLowerCase().trim();

    // Debug logging

    // First check persistent storage (local database)
    final persistentUser = await _localDataSource.getPreRegisteredUser(
      normalizedEmail,
    );
    await _localDataSource.getAllPreRegisteredUsers();

    if (persistentUser != null) {
      // Verify password using the hash verification method
      final storedPassword = persistentUser['encrypted_password'];
      final authLocalImpl = _localDataSource as AuthLocalDataSourceImpl;

      if (authLocalImpl.verifyPassword(password, storedPassword)) {
        // Create user model from persistent data
        final user = _mockUser.copyWith(
          id:
              persistentUser['id']?.toString() ??
              'persistent_${DateTime.now().millisecondsSinceEpoch}',
          email: normalizedEmail,
          name:
              persistentUser['name'] ??
              persistentUser['email']?.split('@').first ??
              '',
          isEmailVerified: persistentUser['is_email_verified'] == 1,
          lastLoginAt: DateTime.now(),
        );

        final authResponse = _generateAuthResponse(user);

        return authResponse;
      } else {
        throw Exception('Invalid credentials');
      }
    }

    // Fallback to mock database for existing test users

    // Check if user exists in our mock database
    if (!_mockUserDatabase.containsKey(normalizedEmail)) {
      throw Exception('User not found');
    }

    final userData = _mockUserDatabase[normalizedEmail]!;

    // Check password
    if (userData['password'] != password) {
      throw Exception('Invalid credentials');
    }

    // Check for disabled accounts
    if (normalizedEmail == 'disabled@example.com') {
      throw Exception('User account is disabled');
    }

    // Create user model from stored data
    final user = _mockUser.copyWith(
      id: userData['id'],
      email: normalizedEmail,
      name: userData['name'],
      isEmailVerified: userData['isEmailVerified'] ?? true,
      lastLoginAt: DateTime.now(),
    );

    return _generateAuthResponse(user);
  }

  @override
  Future<AuthResponseModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 2));

    final normalizedEmail = email.toLowerCase().trim();

    // Debug logging

    // Check both persistent storage and mock database for existing users
    final persistentUser = await _localDataSource.getPreRegisteredUser(
      normalizedEmail,
    );
    await _localDataSource.getAllPreRegisteredUsers();

    // Check if email already exists in persistent storage
    if (persistentUser != null) {
      throw Exception('Email already in use');
    }

    // Check if email already exists in mock database
    if (_registeredEmails.contains(normalizedEmail)) {
      throw Exception('Email already in use');
    }

    // Mock password validation
    if (password.length < 6) {
      throw Exception('Password is too weak');
    }

    // Mock email format validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      throw Exception('Invalid email format');
    }

    // Generate new user ID
    final userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
    final currentTime = DateTime.now();

    // Store user in persistent storage (local database)
    await _localDataSource.addPreRegisteredUser(
      email: normalizedEmail,
      encryptedPassword:
          password, // This will be hashed by the local data source
      name: name ?? email.split('@').first,
    );

    // Verify the user was added by checking persistent storage again
    await _localDataSource.getAllPreRegisteredUsers();

    // Create user model for response
    final user = _mockUser.copyWith(
      id: userId,
      email: normalizedEmail,
      name: name ?? email.split('@').first,
      isEmailVerified: false,
      createdAt: currentTime,
      updatedAt: currentTime,
    );

    return _generateAuthResponse(user);
  }

  /// Helper method to check if email is already registered (for testing)
  static bool isEmailRegistered(String email) {
    return _registeredEmails.contains(email.toLowerCase().trim());
  }

  /// Helper method to get registered user count (for testing)
  static int getRegisteredUserCount() {
    return _mockUserDatabase.length;
  }

  /// Helper method to get all registered emails (for testing)
  static List<String> getAllRegisteredEmails() {
    return _registeredEmails.toList();
  }

  @override
  Future<AuthResponseModel> signInWithGoogle() async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 3));

    final user = _mockUser.copyWith(
      email: 'google.user@example.com',
      name: 'Google User',
      photoUrl: 'https://lh3.googleusercontent.com/mock',
      isEmailVerified: true,
      lastLoginAt: DateTime.now(),
    );

    return _generateAuthResponse(user);
  }

  @override
  Future<Unit> sendPasswordResetEmail({required String email}) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'notfound@example.com') {
      throw Exception('User not found');
    }

    return unit;
  }

  @override
  Future<Unit> resendVerificationEmail() async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 1));
    return unit;
  }

  @override
  Future<Unit> signOut() async {
    // Mock API call delay
    await Future.delayed(const Duration(milliseconds: 500));
    return unit;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // Mock API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock: return user if signed in, null if not
    return _mockUser;
  }

  @override
  Future<bool> isSignedIn() async {
    // Mock API call delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Mock: always return true for demonstration
    return true;
  }

  @override
  Future<String> enableTwoFactorAuth() async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Return mock QR code data or secret
    return 'MOCK_2FA_SECRET_KEY_123456';
  }

  @override
  Future<Unit> disableTwoFactorAuth() async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 1));
    return unit;
  }

  @override
  Future<Unit> verifyTwoFactorCode({required String code}) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 1));

    if (code != '123456') {
      throw Exception('Invalid verification code');
    }

    return unit;
  }

  @override
  Future<UserModel> updateUserProfile({String? name, String? photoUrl}) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 1));

    return _mockUser.copyWith(
      name: name ?? _mockUser.name,
      photoUrl: photoUrl ?? _mockUser.photoUrl,
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<Unit> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 2));

    if (currentPassword != 'password123') {
      throw Exception('Current password is incorrect');
    }

    if (newPassword.length < 6) {
      throw Exception('New password is too weak');
    }

    return unit;
  }

  @override
  Future<Unit> deleteAccount() async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 3));
    return unit;
  }

  @override
  Future<Unit> refreshToken() async {
    // Mock API call delay
    await Future.delayed(const Duration(milliseconds: 800));
    return unit;
  }

  /// Generate authentication response with bearer token
  AuthResponseModel _generateAuthResponse(UserModel user) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return AuthResponseModel(
      user: user,
      accessToken: 'bearer_${user.id}_${timestamp}_access',
      refreshToken: 'bearer_${user.id}_${timestamp}_refresh',
      tokenType: 'Bearer',
      expiresIn: 3600, // 1 hour in seconds
    );
  }

  @override
  Future<AuthResponseModel> signInWithInstagram() async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 3));

    final user = _mockUser.copyWith(
      email: 'instagram.user@example.com',
      name: 'Instagram User',
      photoUrl: 'https://instagram.com/mock',
      isEmailVerified: true,
      lastLoginAt: DateTime.now(),
    );

    return _generateAuthResponse(user);
  }
}
