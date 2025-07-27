// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
    AuthFailure value,
    $Res Function(AuthFailure) then,
  ) = _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
    _$ServerErrorImpl value,
    $Res Function(_$ServerErrorImpl) then,
  ) = __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
    _$ServerErrorImpl _value,
    $Res Function(_$ServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$ServerErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthFailure.serverError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return serverError(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return serverError?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements AuthFailure {
  const factory _ServerError({
    required final String message,
    final String? code,
  }) = _$ServerErrorImpl;

  @override
  String get message;
  String? get code;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
    _$NetworkErrorImpl value,
    $Res Function(_$NetworkErrorImpl) then,
  ) = __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
    _$NetworkErrorImpl _value,
    $Res Function(_$NetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NetworkErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NetworkErrorImpl implements _NetworkError {
  const _$NetworkErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.networkError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements AuthFailure {
  const factory _NetworkError({required final String message}) =
      _$NetworkErrorImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidCredentialsImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$InvalidCredentialsImplCopyWith(
    _$InvalidCredentialsImpl value,
    $Res Function(_$InvalidCredentialsImpl) then,
  ) = __$$InvalidCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidCredentialsImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidCredentialsImpl>
    implements _$$InvalidCredentialsImplCopyWith<$Res> {
  __$$InvalidCredentialsImplCopyWithImpl(
    _$InvalidCredentialsImpl _value,
    $Res Function(_$InvalidCredentialsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$InvalidCredentialsImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$InvalidCredentialsImpl implements _InvalidCredentials {
  const _$InvalidCredentialsImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.invalidCredentials(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidCredentialsImplCopyWith<_$InvalidCredentialsImpl> get copyWith =>
      __$$InvalidCredentialsImplCopyWithImpl<_$InvalidCredentialsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return invalidCredentials(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return invalidCredentials?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class _InvalidCredentials implements AuthFailure {
  const factory _InvalidCredentials({required final String message}) =
      _$InvalidCredentialsImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidCredentialsImplCopyWith<_$InvalidCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserNotFoundImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$UserNotFoundImplCopyWith(
    _$UserNotFoundImpl value,
    $Res Function(_$UserNotFoundImpl) then,
  ) = __$$UserNotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserNotFoundImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$UserNotFoundImpl>
    implements _$$UserNotFoundImplCopyWith<$Res> {
  __$$UserNotFoundImplCopyWithImpl(
    _$UserNotFoundImpl _value,
    $Res Function(_$UserNotFoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UserNotFoundImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UserNotFoundImpl implements _UserNotFound {
  const _$UserNotFoundImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.userNotFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotFoundImplCopyWith<_$UserNotFoundImpl> get copyWith =>
      __$$UserNotFoundImplCopyWithImpl<_$UserNotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return userNotFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return userNotFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements AuthFailure {
  const factory _UserNotFound({required final String message}) =
      _$UserNotFoundImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNotFoundImplCopyWith<_$UserNotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$EmailAlreadyInUseImplCopyWith(
    _$EmailAlreadyInUseImpl value,
    $Res Function(_$EmailAlreadyInUseImpl) then,
  ) = __$$EmailAlreadyInUseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EmailAlreadyInUseImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$EmailAlreadyInUseImpl>
    implements _$$EmailAlreadyInUseImplCopyWith<$Res> {
  __$$EmailAlreadyInUseImplCopyWithImpl(
    _$EmailAlreadyInUseImpl _value,
    $Res Function(_$EmailAlreadyInUseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$EmailAlreadyInUseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$EmailAlreadyInUseImpl implements _EmailAlreadyInUse {
  const _$EmailAlreadyInUseImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyInUseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAlreadyInUseImplCopyWith<_$EmailAlreadyInUseImpl> get copyWith =>
      __$$EmailAlreadyInUseImplCopyWithImpl<_$EmailAlreadyInUseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return emailAlreadyInUse(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return emailAlreadyInUse?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class _EmailAlreadyInUse implements AuthFailure {
  const factory _EmailAlreadyInUse({required final String message}) =
      _$EmailAlreadyInUseImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailAlreadyInUseImplCopyWith<_$EmailAlreadyInUseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeakPasswordImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$WeakPasswordImplCopyWith(
    _$WeakPasswordImpl value,
    $Res Function(_$WeakPasswordImpl) then,
  ) = __$$WeakPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$WeakPasswordImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$WeakPasswordImpl>
    implements _$$WeakPasswordImplCopyWith<$Res> {
  __$$WeakPasswordImplCopyWithImpl(
    _$WeakPasswordImpl _value,
    $Res Function(_$WeakPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$WeakPasswordImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$WeakPasswordImpl implements _WeakPassword {
  const _$WeakPasswordImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.weakPassword(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeakPasswordImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeakPasswordImplCopyWith<_$WeakPasswordImpl> get copyWith =>
      __$$WeakPasswordImplCopyWithImpl<_$WeakPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return weakPassword(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return weakPassword?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return weakPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return weakPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword(this);
    }
    return orElse();
  }
}

abstract class _WeakPassword implements AuthFailure {
  const factory _WeakPassword({required final String message}) =
      _$WeakPasswordImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeakPasswordImplCopyWith<_$WeakPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidEmailImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$InvalidEmailImplCopyWith(
    _$InvalidEmailImpl value,
    $Res Function(_$InvalidEmailImpl) then,
  ) = __$$InvalidEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidEmailImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidEmailImpl>
    implements _$$InvalidEmailImplCopyWith<$Res> {
  __$$InvalidEmailImplCopyWithImpl(
    _$InvalidEmailImpl _value,
    $Res Function(_$InvalidEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$InvalidEmailImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$InvalidEmailImpl implements _InvalidEmail {
  const _$InvalidEmailImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.invalidEmail(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailImplCopyWith<_$InvalidEmailImpl> get copyWith =>
      __$$InvalidEmailImplCopyWithImpl<_$InvalidEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return invalidEmail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return invalidEmail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmail implements AuthFailure {
  const factory _InvalidEmail({required final String message}) =
      _$InvalidEmailImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidEmailImplCopyWith<_$InvalidEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserDisabledImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$UserDisabledImplCopyWith(
    _$UserDisabledImpl value,
    $Res Function(_$UserDisabledImpl) then,
  ) = __$$UserDisabledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserDisabledImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$UserDisabledImpl>
    implements _$$UserDisabledImplCopyWith<$Res> {
  __$$UserDisabledImplCopyWithImpl(
    _$UserDisabledImpl _value,
    $Res Function(_$UserDisabledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UserDisabledImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UserDisabledImpl implements _UserDisabled {
  const _$UserDisabledImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.userDisabled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDisabledImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDisabledImplCopyWith<_$UserDisabledImpl> get copyWith =>
      __$$UserDisabledImplCopyWithImpl<_$UserDisabledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return userDisabled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return userDisabled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return userDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return userDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled(this);
    }
    return orElse();
  }
}

abstract class _UserDisabled implements AuthFailure {
  const factory _UserDisabled({required final String message}) =
      _$UserDisabledImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDisabledImplCopyWith<_$UserDisabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OperationNotAllowedImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$OperationNotAllowedImplCopyWith(
    _$OperationNotAllowedImpl value,
    $Res Function(_$OperationNotAllowedImpl) then,
  ) = __$$OperationNotAllowedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OperationNotAllowedImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$OperationNotAllowedImpl>
    implements _$$OperationNotAllowedImplCopyWith<$Res> {
  __$$OperationNotAllowedImplCopyWithImpl(
    _$OperationNotAllowedImpl _value,
    $Res Function(_$OperationNotAllowedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$OperationNotAllowedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OperationNotAllowedImpl implements _OperationNotAllowed {
  const _$OperationNotAllowedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.operationNotAllowed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationNotAllowedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationNotAllowedImplCopyWith<_$OperationNotAllowedImpl> get copyWith =>
      __$$OperationNotAllowedImplCopyWithImpl<_$OperationNotAllowedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return operationNotAllowed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return operationNotAllowed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return operationNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return operationNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(this);
    }
    return orElse();
  }
}

abstract class _OperationNotAllowed implements AuthFailure {
  const factory _OperationNotAllowed({required final String message}) =
      _$OperationNotAllowedImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationNotAllowedImplCopyWith<_$OperationNotAllowedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TooManyRequestsImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$TooManyRequestsImplCopyWith(
    _$TooManyRequestsImpl value,
    $Res Function(_$TooManyRequestsImpl) then,
  ) = __$$TooManyRequestsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TooManyRequestsImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$TooManyRequestsImpl>
    implements _$$TooManyRequestsImplCopyWith<$Res> {
  __$$TooManyRequestsImplCopyWithImpl(
    _$TooManyRequestsImpl _value,
    $Res Function(_$TooManyRequestsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TooManyRequestsImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TooManyRequestsImpl implements _TooManyRequests {
  const _$TooManyRequestsImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.tooManyRequests(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TooManyRequestsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TooManyRequestsImplCopyWith<_$TooManyRequestsImpl> get copyWith =>
      __$$TooManyRequestsImplCopyWithImpl<_$TooManyRequestsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return tooManyRequests(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return tooManyRequests?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return tooManyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return tooManyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests(this);
    }
    return orElse();
  }
}

abstract class _TooManyRequests implements AuthFailure {
  const factory _TooManyRequests({required final String message}) =
      _$TooManyRequestsImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TooManyRequestsImplCopyWith<_$TooManyRequestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
    _$UnknownErrorImpl value,
    $Res Function(_$UnknownErrorImpl) then,
  ) = __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
    _$UnknownErrorImpl _value,
    $Res Function(_$UnknownErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$UnknownErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnknownErrorImpl implements _UnknownError {
  const _$UnknownErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthFailure.unknownError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) userNotFound,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) weakPassword,
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) userDisabled,
    required TResult Function(String message) operationNotAllowed,
    required TResult Function(String message) tooManyRequests,
    required TResult Function(String message, String? code) unknownError,
  }) {
    return unknownError(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? userNotFound,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? weakPassword,
    TResult? Function(String message)? invalidEmail,
    TResult? Function(String message)? userDisabled,
    TResult? Function(String message)? operationNotAllowed,
    TResult? Function(String message)? tooManyRequests,
    TResult? Function(String message, String? code)? unknownError,
  }) {
    return unknownError?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? userNotFound,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? weakPassword,
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? userDisabled,
    TResult Function(String message)? operationNotAllowed,
    TResult Function(String message)? tooManyRequests,
    TResult Function(String message, String? code)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_WeakPassword value) weakPassword,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_UserDisabled value) userDisabled,
    required TResult Function(_OperationNotAllowed value) operationNotAllowed,
    required TResult Function(_TooManyRequests value) tooManyRequests,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(_WeakPassword value)? weakPassword,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_UserDisabled value)? userDisabled,
    TResult? Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult? Function(_TooManyRequests value)? tooManyRequests,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_WeakPassword value)? weakPassword,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_UserDisabled value)? userDisabled,
    TResult Function(_OperationNotAllowed value)? operationNotAllowed,
    TResult Function(_TooManyRequests value)? tooManyRequests,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError implements AuthFailure {
  const factory _UnknownError({
    required final String message,
    final String? code,
  }) = _$UnknownErrorImpl;

  @override
  String get message;
  String? get code;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
