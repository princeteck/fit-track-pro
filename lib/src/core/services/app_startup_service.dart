import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../storage/local_storage.dart';
import '../../data/datasources/auth_local_data_source.dart';

@singleton
class AppStartupService {
  final LocalStorage _localStorage;
  final AuthLocalDataSource _authLocalDataSource;

  static const String _onboardingCompletedKey = 'onboarding_completed';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';

  AppStartupService(this._localStorage, this._authLocalDataSource);

  /// Check if onboarding has been completed
  Future<bool> isOnboardingCompleted() async {
    try {
      final completed = await _localStorage.read(_onboardingCompletedKey);
      return completed == 'true';
    } catch (e) {
      debugPrint('Error checking onboarding status: $e');
      return false;
    }
  }

  /// Mark onboarding as completed
  Future<void> markOnboardingCompleted() async {
    try {
      await _localStorage.write(_onboardingCompletedKey, 'true');
    } catch (e) {
      debugPrint('Error marking onboarding as completed: $e');
    }
  }

  /// Check if user has valid authentication
  Future<bool> hasValidAuthentication() async {
    try {
      final accessToken = await _authLocalDataSource.getAccessToken();
      if (accessToken == null || accessToken.isEmpty) {
        return false;
      }

      // Check if token is expired
      if (await _isTokenExpired(accessToken)) {
        // Try to refresh token
        return await _attemptTokenRefresh();
      }

      return true;
    } catch (e) {
      debugPrint('Error checking authentication: $e');
      return false;
    }
  }

  /// Check if JWT token is expired
  Future<bool> _isTokenExpired(String token) async {
    try {
      // Check expiry from secure storage first
      final expiryString = await _localStorage.read(_tokenExpiryKey);
      if (expiryString != null) {
        final expiry = DateTime.parse(expiryString);
        if (DateTime.now().isAfter(expiry)) {
          return true;
        }
      }

      // Token is valid if we reach here
      return false;
    } catch (e) {
      debugPrint('Error checking token expiry: $e');
      // If we can't determine expiry, consider it expired for safety
      return true;
    }
  }

  /// Attempt to refresh the access token
  Future<bool> _attemptTokenRefresh() async {
    try {
      final refreshToken = await _authLocalDataSource.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        return false;
      }

      // Check if refresh token is expired
      if (await _isTokenExpired(refreshToken)) {
        // Refresh token is expired, user needs to sign in again
        await clearAuthData();
        return false;
      }

      // TODO: Implement refresh token API call
      // For now, return false to require re-authentication
      return false;
    } catch (e) {
      debugPrint('Error refreshing token: $e');
      return false;
    }
  }

  /// Save authentication tokens
  Future<void> saveAuthTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    try {
      await Future.wait([
        _localStorage.write(_accessTokenKey, accessToken),
        _localStorage.write(_refreshTokenKey, refreshToken),
        _localStorage.write(_tokenExpiryKey, expiresAt.toIso8601String()),
      ]);
    } catch (e) {
      debugPrint('Error saving auth tokens: $e');
    }
  }

  /// Clear all authentication data
  Future<void> clearAuthData() async {
    try {
      await Future.wait([
        _localStorage.delete(_accessTokenKey),
        _localStorage.delete(_refreshTokenKey),
        _localStorage.delete(_tokenExpiryKey),
        _authLocalDataSource.clearAuthData(),
      ]);
    } catch (e) {
      debugPrint('Error clearing auth data: $e');
    }
  }

  /// Determine the initial route based on app state
  Future<AppStartupResult> determineInitialRoute() async {
    try {
      final isOnboardingComplete = await isOnboardingCompleted();

      if (!isOnboardingComplete) {
        return AppStartupResult.onboarding;
      }

      final hasValidAuth = await hasValidAuthentication();

      if (hasValidAuth) {
        return AppStartupResult.dashboard;
      }

      return AppStartupResult.signIn;
    } catch (e) {
      debugPrint('Error determining initial route: $e');
      return AppStartupResult.onboarding;
    }
  }
}

enum AppStartupResult { onboarding, signIn, dashboard }
