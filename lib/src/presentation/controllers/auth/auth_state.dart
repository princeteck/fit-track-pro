part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(CubitState.initial()) CubitState status,
    @Default(CubitState.initial()) CubitState signInStatus,
    @Default(CubitState.initial()) CubitState signUpStatus,
    @Default(CubitState.initial()) CubitState signOutStatus,
    @Default(CubitState.initial()) CubitState passwordResetStatus,
    @Default(CubitState.initial()) CubitState verificationEmailStatus,
    @Default(CubitState.initial()) CubitState twoFactorStatus,
    @Default(false) bool isAuthenticated,
    String? twoFactorSecret,
    String? errorMessage,
  }) = _AuthState;
}
