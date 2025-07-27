import 'package:dartz/dartz.dart';

import '../entities/auth_failure.dart';
import '../entities/user.dart';

/// Auth response entity for domain layer
class AuthResponse {
  final User user;
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  const AuthResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });
}

abstract class AuthRepository {
  /// Sign in with email and password
  Future<Either<AuthFailure, AuthResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up with email and password
  Future<Either<AuthFailure, AuthResponse>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  });

  /// Sign in with Google
  Future<Either<AuthFailure, AuthResponse>> signInWithGoogle();

  /// Sign in with Instagram
  Future<Either<AuthFailure, AuthResponse>> signInWithInstagram();

  /// Send password reset email
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail({
    required String email,
  });

  /// Resend verification email
  Future<Either<AuthFailure, Unit>> resendVerificationEmail();

  /// Sign out
  Future<Either<AuthFailure, Unit>> signOut();

  /// Get current user
  Future<Either<AuthFailure, User?>> getCurrentUser();

  /// Check if user is signed in
  Future<bool> isSignedIn();

  /// Enable two-factor authentication
  Future<Either<AuthFailure, String>> enableTwoFactorAuth();

  /// Disable two-factor authentication
  Future<Either<AuthFailure, Unit>> disableTwoFactorAuth();

  /// Verify two-factor authentication code
  Future<Either<AuthFailure, Unit>> verifyTwoFactorCode({required String code});

  /// Update user profile
  Future<Either<AuthFailure, User>> updateUserProfile({
    String? name,
    String? photoUrl,
  });

  /// Change password
  Future<Either<AuthFailure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Delete user account
  Future<Either<AuthFailure, Unit>> deleteAccount();

  /// Refresh authentication token
  Future<Either<AuthFailure, Unit>> refreshToken();
}
