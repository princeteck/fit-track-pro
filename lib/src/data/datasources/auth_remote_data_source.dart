import 'package:dartz/dartz.dart';

import '../models/user_model.dart';
import '../models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  /// Sign in with email and password
  Future<AuthResponseModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up with email and password
  Future<AuthResponseModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  });

  /// Sign in with Google
  Future<AuthResponseModel> signInWithGoogle();

  /// Send password reset email
  Future<Unit> sendPasswordResetEmail({required String email});

  /// Resend verification email
  Future<Unit> resendVerificationEmail();

  /// Sign out
  Future<Unit> signOut();

  /// Get current user
  Future<UserModel?> getCurrentUser();

  /// Check if user is signed in
  Future<bool> isSignedIn();

  /// Enable two-factor authentication
  Future<String> enableTwoFactorAuth();

  /// Disable two-factor authentication
  Future<Unit> disableTwoFactorAuth();

  /// Verify two-factor authentication code
  Future<Unit> verifyTwoFactorCode({required String code});

  /// Update user profile
  Future<UserModel> updateUserProfile({String? name, String? photoUrl});

  /// Change password
  Future<Unit> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Delete user account
  Future<Unit> deleteAccount();

  /// Refresh authentication token
  Future<Unit> refreshToken();
}
