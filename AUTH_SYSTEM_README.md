# FitTrack Pro Authentication System

This document outlines the comprehensive authentication system implemented in FitTrack Pro, featuring clean architecture, bearer token support, SQLite local storage, and mock API integration.

## 🏗️ Architecture Overview

The authentication system follows Clean Architecture principles with clear separation of concerns:

```
lib/src/
├── domain/                 # Business logic layer
│   ├── entities/          # Core business objects
│   │   ├── user.dart
│   │   └── auth_failure.dart
│   ├── repositories/      # Abstract repository interfaces
│   │   └── auth_repository.dart
│   └── usecase/          # Application business rules
│       ├── base_usecase.dart
│       ├── sign_in_with_email_password_usecase.dart
│       ├── sign_up_with_email_password_usecase.dart
│       ├── sign_in_with_google_usecase.dart
│       ├── send_password_reset_email_usecase.dart
│       ├── resend_verification_email_usecase.dart
│       ├── sign_out_usecase.dart
│       └── get_current_user_usecase.dart
├── data/                  # Data layer
│   ├── models/           # Data transfer objects
│   │   ├── user_model.dart
│   │   └── auth_response_model.dart
│   ├── datasources/      # Data sources
│   │   ├── auth_remote_data_source.dart
│   │   ├── auth_remote_data_source_impl.dart
│   │   ├── auth_local_data_source.dart
│   │   ├── auth_local_data_source_impl.dart
│   │   └── database_helper.dart
│   └── repositories/     # Repository implementations
│       └── auth_repository_impl.dart
└── presentation/         # Presentation layer
    └── controllers/
        ├── base/
        │   └── cubit_state.dart
        └── auth/
            ├── auth_cubit.dart
            └── auth_state.dart
```

## 🔐 Authentication Features

### Core Authentication Methods
- **Email/Password Sign In**: Traditional email and password authentication
- **Email/Password Sign Up**: User registration with email verification
- **Google Authentication**: OAuth2 integration (mocked)
- **Password Reset**: Email-based password recovery
- **Email Verification**: Resend verification emails

### Security Features
- **Bearer Token Authentication**: JWT-style tokens with access/refresh mechanism
- **Password Encryption**: SHA-256 hashing for stored passwords
- **Secure Local Storage**: SQLite database with encrypted storage
- **Two-Factor Authentication**: 2FA support with secret key generation

## 🗄️ Database Schema

### Users Table
```sql
CREATE TABLE users (
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
);
```

### Auth Tokens Table
```sql
CREATE TABLE auth_tokens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id TEXT NOT NULL,
  access_token TEXT NOT NULL,
  refresh_token TEXT NOT NULL,
  token_type TEXT NOT NULL,
  expires_in INTEGER NOT NULL,
  created_at TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
```

### Pre-registered Users Table
```sql
CREATE TABLE pre_registered_users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT UNIQUE NOT NULL,
  encrypted_password TEXT NOT NULL,
  name TEXT,
  is_active INTEGER DEFAULT 1,
  created_at TEXT NOT NULL
);
```

## 🎯 Bearer Token System

### Token Structure
```dart
AuthResponseModel {
  user: UserModel,
  accessToken: "bearer_user123_1640995200_access",
  refreshToken: "bearer_user123_1640995200_refresh",
  tokenType: "Bearer",
  expiresIn: 3600  // seconds
}
```

### Token Storage
- Tokens are automatically stored in SQLite upon successful authentication
- Access tokens are used for API authorization
- Refresh tokens enable seamless session renewal
- Tokens are encrypted and associated with user IDs

## 🔄 State Management

### CubitState System
```dart
@freezed
class CubitState with _$CubitState {
  const factory CubitState.loading() = CubitStateLoading;
  const factory CubitState.loaded() = CubitStateLoaded;
  const factory CubitState.submitting() = CubitStateSubmitting;
  const factory CubitState.submitted() = CubitStateSubmitted;
  const factory CubitState.error({
    required String message,
    String? code,
    @Default(false) bool canRetry,
  }) = CubitStateError;
  const factory CubitState.initial() = CubitStateInitial;
}
```

### AuthState Structure
```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(CubitState.initial()) CubitState status,
    @Default(CubitState.initial()) CubitState signInStatus,
    @Default(CubitState.initial()) CubitState signUpStatus,
    @Default(CubitState.initial()) CubitState passwordResetStatus,
    @Default(CubitState.initial()) CubitState verificationEmailStatus,
    @Default(CubitState.initial()) CubitState twoFactorStatus,
    @Default(false) bool isAuthenticated,
    String? twoFactorSecret,
    String? errorMessage,
  }) = _AuthState;
}
```

## 🚀 Usage Examples

### Basic Authentication
```dart
// Sign in with email and password
await authCubit.signInWithEmailAndPassword(
  email: 'test@example.com',
  password: 'password123',
);

// Sign up new user
await authCubit.signUpWithEmailAndPassword(
  email: 'user@example.com',
  password: 'securePassword',
  name: 'John Doe',
);

// Google authentication
await authCubit.signInWithGoogle();

// Sign out
await authCubit.signOut();
```

### State Monitoring
```dart
BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if (state.signInStatus.isError) {
      // Handle error
      showErrorSnackBar(state.errorMessage ?? 'Authentication failed');
    }
    if (state.isAuthenticated) {
      // Navigate to authenticated area
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  },
  builder: (context, state) {
    if (state.signInStatus.isSubmitting) {
      return CircularProgressIndicator();
    }
    return LoginForm();
  },
);
```

### Local Storage Operations
```dart
// Add pre-registered user for quick login
await localDataSource.addPreRegisteredUser(
  email: 'quicklogin@example.com',
  encryptedPassword: 'hashedPassword',
  name: 'Quick User',
);

// Get all pre-registered users
final users = await localDataSource.getAllPreRegisteredUsers();

// Check if user is signed in locally
final isSignedIn = await localDataSource.isSignedIn();
```

## 🧪 Mock Data & Testing

### Test Credentials
- **Email**: `test@example.com`
- **Password**: `password123`
- **Google User**: Automatically generated with Google profile
- **Disabled Account**: `disabled@example.com`
- **Invalid Email**: `invalid@example.com`

### Error Scenarios
- Invalid credentials
- Email already in use
- Weak password (< 6 characters)
- User not found
- Account disabled
- Too many requests

## 🔧 Dependencies

### Required Packages
```yaml
dependencies:
  flutter_bloc: ^9.1.1
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  get_it: ^8.0.3
  dartz: ^0.10.1
  flutter_secure_storage: ^9.2.4
  injectable: ^2.5.0
  sqflite: ^2.4.1
  path: ^1.9.1
  crypto: ^3.0.5

dev_dependencies:
  freezed: ^2.4.6
  build_runner: ^2.4.15
  json_serializable: ^6.9.5
  injectable_generator: ^2.7.0
```

## 🎨 Code Generation

Run the following command to generate freezed and injectable code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 🔮 Future Enhancements

### Planned Features
1. **Biometric Authentication**: Fingerprint and Face ID support
2. **Social Login**: Facebook, Apple, Twitter integration
3. **Advanced 2FA**: TOTP, SMS, Push notifications
4. **Session Management**: Multiple device support
5. **Offline Authentication**: Enhanced offline capabilities
6. **Account Linking**: Multiple authentication methods per account
7. **Advanced Security**: Brute force protection, device tracking

### Data Expansion
- User preferences and settings
- Activity logs and security events
- Device management and trusted devices
- Backup and sync capabilities
- Advanced user profiles with fitness data

## 📱 Integration Guide

### Step 1: Initialize Dependencies
```dart
// In main.dart
await configureDependencies();
```

### Step 2: Provide AuthCubit
```dart
BlocProvider(
  create: (context) => locator<AuthCubit>()..initialize(),
  child: MyApp(),
)
```

### Step 3: Use in Widgets
```dart
// Access AuthCubit
final authCubit = context.read<AuthCubit>();

// Monitor authentication state
context.watch<AuthCubit>().state.isAuthenticated
```

## 🚨 Error Handling

The system provides comprehensive error handling with specific error types:

- `AuthFailure.invalidCredentials`: Wrong email/password
- `AuthFailure.userNotFound`: User doesn't exist
- `AuthFailure.emailAlreadyInUse`: Registration with existing email
- `AuthFailure.weakPassword`: Password doesn't meet requirements
- `AuthFailure.networkError`: Connection issues
- `AuthFailure.serverError`: Backend server errors
- `AuthFailure.unknownError`: Unexpected errors

Each error includes a user-friendly message and optional error code for detailed debugging.

---

This authentication system provides a robust foundation for secure user management in FitTrack Pro, with room for future enhancements and scalability.
