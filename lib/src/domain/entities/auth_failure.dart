import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError({
    required String message,
    String? code,
  }) = _ServerError;

  const factory AuthFailure.networkError({required String message}) =
      _NetworkError;

  const factory AuthFailure.invalidCredentials({required String message}) =
      _InvalidCredentials;

  const factory AuthFailure.userNotFound({required String message}) =
      _UserNotFound;

  const factory AuthFailure.emailAlreadyInUse({required String message}) =
      _EmailAlreadyInUse;

  const factory AuthFailure.weakPassword({required String message}) =
      _WeakPassword;

  const factory AuthFailure.invalidEmail({required String message}) =
      _InvalidEmail;

  const factory AuthFailure.userDisabled({required String message}) =
      _UserDisabled;

  const factory AuthFailure.operationNotAllowed({required String message}) =
      _OperationNotAllowed;

  const factory AuthFailure.tooManyRequests({required String message}) =
      _TooManyRequests;

  const factory AuthFailure.unknownError({
    required String message,
    String? code,
  }) = _UnknownError;
}
