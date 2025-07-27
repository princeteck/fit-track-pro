import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';
import '../models/auth_response_model.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Mock user data
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

    // Mock authentication logic
    if (email == 'test@example.com' && password == 'password123') {
      final user = _mockUser.copyWith(
        email: email,
        lastLoginAt: DateTime.now(),
      );
      return _generateAuthResponse(user);
    } else if (email == 'disabled@example.com') {
      throw Exception('User account is disabled');
    } else if (email == 'invalid@example.com') {
      throw Exception('Invalid email format');
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<AuthResponseModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    // Mock API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (email == 'existing@example.com') {
      throw Exception('Email already in use');
    }

    if (password.length < 6) {
      throw Exception('Password is too weak');
    }

    final user = _mockUser.copyWith(
      id: 'new_user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
      isEmailVerified: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return _generateAuthResponse(user);
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
}
