import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/auth_failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_response_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  /// Helper method to convert AuthResponseModel to AuthResponse
  AuthResponse _toAuthResponse(AuthResponseModel model) {
    return AuthResponse(
      user: model.user.toEntity(),
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      tokenType: model.tokenType,
      expiresIn: model.expiresIn,
    );
  }

  @override
  Future<Either<AuthFailure, AuthResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store auth response locally
      await _localDataSource.saveAuthResponse(result);

      return Right(_toAuthResponse(result));
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthResponse>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final result = await _remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      // Store auth response locally
      await _localDataSource.saveAuthResponse(result);

      return Right(_toAuthResponse(result));
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthResponse>> signInWithGoogle() async {
    try {
      final result = await _remoteDataSource.signInWithGoogle();

      // Store auth response locally
      await _localDataSource.saveAuthResponse(result);

      return Right(_toAuthResponse(result));
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      await _localDataSource.clearAuthData();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _remoteDataSource.sendPasswordResetEmail(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> resendVerificationEmail() async {
    try {
      await _remoteDataSource.resendVerificationEmail();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, String>> enableTwoFactorAuth() async {
    try {
      final secret = await _remoteDataSource.enableTwoFactorAuth();
      return Right(secret);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyTwoFactorCode({
    required String code,
  }) async {
    try {
      await _remoteDataSource.verifyTwoFactorCode(code: code);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, User?>> getCurrentUser() async {
    try {
      // Try to get cached user first
      final cachedUser = await _localDataSource.getCurrentUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }

      // If no cached user, try remote
      final user = await _remoteDataSource.getCurrentUser();
      if (user != null) {
        await _localDataSource.saveUser(user);
        return Right(user.toEntity());
      }

      return const Right(null);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      return await _localDataSource.isSignedIn();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> deleteAccount() async {
    try {
      await _remoteDataSource.deleteAccount();
      await _localDataSource.clearAuthData();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> disableTwoFactorAuth() async {
    try {
      await _remoteDataSource.disableTwoFactorAuth();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> refreshToken() async {
    try {
      await _remoteDataSource.refreshToken();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, User>> updateUserProfile({
    String? name,
    String? photoUrl,
  }) async {
    try {
      final result = await _remoteDataSource.updateUserProfile(
        name: name,
        photoUrl: photoUrl,
      );

      await _localDataSource.saveUser(result);
      return Right(result.toEntity());
    } catch (e) {
      return Left(AuthFailure.unknownError(message: e.toString()));
    }
  }
}
