import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecase/get_current_user_usecase.dart';
import '../../../domain/usecase/resend_verification_email_usecase.dart';
import '../../../domain/usecase/send_password_reset_email_usecase.dart';
import '../../../domain/usecase/sign_in_with_email_password_usecase.dart';
import '../../../domain/usecase/sign_in_with_google_usecase.dart';
import '../../../domain/usecase/sign_in_with_instagram_usecase.dart';
import '../../../domain/usecase/sign_out_usecase.dart';
import '../../../domain/usecase/sign_up_with_email_password_usecase.dart';
import '../../../domain/entities/auth_failure.dart';
import '../../../domain/usecase/base_usecase.dart';
import '../../../core/services/app_startup_service.dart';
import '../base/base_cubit_wrapper.dart';
import '../base/cubit_state.dart';
import '../bottom_navbar/bottom_navbar_cubit.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends BaseCubitWrapper<AuthState> {
  late SignInWithEmailAndPasswordUseCase _signInWithEmailPasswordUseCase;
  late SignUpWithEmailAndPasswordUseCase _signUpWithEmailPasswordUseCase;
  late SignInWithGoogleUseCase _signInWithGoogleUseCase;
  late SignInWithInstagramUseCase _signInWithInstagramUseCase;
  late SignOutUseCase _signOutUseCase;
  late SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;
  late ResendVerificationEmailUseCase _resendVerificationEmailUseCase;
  late GetCurrentUserUseCase _getCurrentUserUseCase;
  late AppStartupService _appStartupService;

  AuthCubit() : super(const AuthState()) {
    _signInWithEmailPasswordUseCase =
        injector<SignInWithEmailAndPasswordUseCase>();
    _signUpWithEmailPasswordUseCase =
        injector<SignUpWithEmailAndPasswordUseCase>();
    _signInWithGoogleUseCase = injector<SignInWithGoogleUseCase>();
    _signOutUseCase = injector<SignOutUseCase>();
    _sendPasswordResetEmailUseCase = injector<SendPasswordResetEmailUseCase>();
    _resendVerificationEmailUseCase =
        injector<ResendVerificationEmailUseCase>();
    _getCurrentUserUseCase = injector<GetCurrentUserUseCase>();
    _appStartupService = injector<AppStartupService>();
  }

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        signInStatus: const CubitState.submitting(),
        errorMessage: null,
      ),
    );

    final result = await _signInWithEmailPasswordUseCase(
      SignInParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          signInStatus: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
        ),
      ),
      (authResponse) async {
        try {
          final expiresAt = DateTime.now().add(
            Duration(seconds: authResponse.expiresIn),
          );

          await _appStartupService.saveAuthTokens(
            accessToken: authResponse.accessToken,
            refreshToken: authResponse.refreshToken,
            expiresAt: expiresAt,
          );

          emit(
            state.copyWith(
              signInStatus: const CubitState.submitted(),
              user: authResponse.user,
              isAuthenticated: true,
              errorMessage: null,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              signInStatus: CubitState.error(
                message: 'Failed to save authentication data',
                canRetry: true,
              ),
              errorMessage: 'Failed to save authentication data',
            ),
          );
        }
      },
    );
  }

  Future<void> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        signUpStatus: const CubitState.submitting(),
        errorMessage: null,
      ),
    );

    final result = await _signUpWithEmailPasswordUseCase(
      SignUpParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          signUpStatus: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
        ),
      ),
      (authResponse) => emit(
        state.copyWith(
          signUpStatus: const CubitState.submitted(),
          user: authResponse.user,
          isAuthenticated: true,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(
      state.copyWith(status: const CubitState.submitting(), errorMessage: null),
    );

    final result = await _signInWithGoogleUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
        ),
      ),
      (authResponse) => emit(
        state.copyWith(
          status: const CubitState.submitted(),
          user: authResponse.user,
          isAuthenticated: true,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> signInWithInstagram() async {
    emit(
      state.copyWith(status: const CubitState.submitting(), errorMessage: null),
    );

    final result = await _signInWithInstagramUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
        ),
      ),
      (authResponse) => emit(
        state.copyWith(
          status: const CubitState.submitted(),
          user: authResponse.user,
          isAuthenticated: true,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> signOut() async {
    emit(
      state.copyWith(status: const CubitState.submitting(), errorMessage: null),
    );

    try {
      final signOutResult = await _signOutUseCase(NoParams());

      await _appStartupService.clearAuthData();

      injector<BottomNavbarCubit>().reset();

      signOutResult.fold(
        (failure) => emit(
          state.copyWith(
            status: CubitState.error(
              message: _getErrorMessage(failure),
              canRetry: true,
            ),
            errorMessage: _getErrorMessage(failure),
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: const CubitState.submitted(),
            user: null,
            isAuthenticated: false,
            errorMessage: null,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CubitState.error(
            message: 'Sign out failed: ${e.toString()}',
            canRetry: true,
          ),
          errorMessage: 'Sign out failed: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(
      state.copyWith(
        passwordResetStatus: const CubitState.submitting(),
        errorMessage: null,
      ),
    );

    final result = await _sendPasswordResetEmailUseCase(
      PasswordResetParams(email: email),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          passwordResetStatus: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          passwordResetStatus: const CubitState.submitted(),
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> resendVerificationEmail({required String email}) async {
    emit(
      state.copyWith(
        verificationEmailStatus: const CubitState.submitting(),
        errorMessage: null,
      ),
    );

    final result = await _resendVerificationEmailUseCase(const NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          verificationEmailStatus: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          verificationEmailStatus: const CubitState.submitted(),
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> getCurrentUser() async {
    emit(
      state.copyWith(status: const CubitState.loading(), errorMessage: null),
    );

    final result = await _getCurrentUserUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CubitState.error(
            message: _getErrorMessage(failure),
            canRetry: true,
          ),
          errorMessage: _getErrorMessage(failure),
          isAuthenticated: false,
        ),
      ),
      (user) => emit(
        state.copyWith(
          status: const CubitState.loaded(),
          user: user,
          isAuthenticated: true,
          errorMessage: null,
        ),
      ),
    );
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  void resetSignInStatus() {
    emit(state.copyWith(signInStatus: const CubitState.initial()));
  }

  void resetSignUpStatus() {
    emit(state.copyWith(signUpStatus: const CubitState.initial()));
  }

  void resetPasswordResetStatus() {
    emit(state.copyWith(passwordResetStatus: const CubitState.initial()));
  }

  void resetVerificationEmailStatus() {
    emit(state.copyWith(verificationEmailStatus: const CubitState.initial()));
  }

  String _getErrorMessage(AuthFailure failure) {
    return failure.when(
      serverError: (message, code) => message,
      networkError: (message) => message,
      invalidCredentials: (message) => message,
      userNotFound: (message) => message,
      emailAlreadyInUse: (message) => message,
      weakPassword: (message) => message,
      invalidEmail: (message) => message,
      userDisabled: (message) => message,
      operationNotAllowed: (message) => message,
      tooManyRequests: (message) => message,
      unknownError: (message, code) => message,
    );
  }
}
