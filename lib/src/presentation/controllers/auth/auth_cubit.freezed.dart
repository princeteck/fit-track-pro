// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  User? get user => throw _privateConstructorUsedError;
  CubitState get status => throw _privateConstructorUsedError;
  CubitState get signInStatus => throw _privateConstructorUsedError;
  CubitState get signUpStatus => throw _privateConstructorUsedError;
  CubitState get passwordResetStatus => throw _privateConstructorUsedError;
  CubitState get verificationEmailStatus => throw _privateConstructorUsedError;
  CubitState get twoFactorStatus => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  String? get twoFactorSecret => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({
    User? user,
    CubitState status,
    CubitState signInStatus,
    CubitState signUpStatus,
    CubitState passwordResetStatus,
    CubitState verificationEmailStatus,
    CubitState twoFactorStatus,
    bool isAuthenticated,
    String? twoFactorSecret,
    String? errorMessage,
  });

  $UserCopyWith<$Res>? get user;
  $CubitStateCopyWith<$Res> get status;
  $CubitStateCopyWith<$Res> get signInStatus;
  $CubitStateCopyWith<$Res> get signUpStatus;
  $CubitStateCopyWith<$Res> get passwordResetStatus;
  $CubitStateCopyWith<$Res> get verificationEmailStatus;
  $CubitStateCopyWith<$Res> get twoFactorStatus;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? signInStatus = null,
    Object? signUpStatus = null,
    Object? passwordResetStatus = null,
    Object? verificationEmailStatus = null,
    Object? twoFactorStatus = null,
    Object? isAuthenticated = null,
    Object? twoFactorSecret = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CubitState,
            signInStatus: null == signInStatus
                ? _value.signInStatus
                : signInStatus // ignore: cast_nullable_to_non_nullable
                      as CubitState,
            signUpStatus: null == signUpStatus
                ? _value.signUpStatus
                : signUpStatus // ignore: cast_nullable_to_non_nullable
                      as CubitState,
            passwordResetStatus: null == passwordResetStatus
                ? _value.passwordResetStatus
                : passwordResetStatus // ignore: cast_nullable_to_non_nullable
                      as CubitState,
            verificationEmailStatus: null == verificationEmailStatus
                ? _value.verificationEmailStatus
                : verificationEmailStatus // ignore: cast_nullable_to_non_nullable
                      as CubitState,
            twoFactorStatus: null == twoFactorStatus
                ? _value.twoFactorStatus
                : twoFactorStatus // ignore: cast_nullable_to_non_nullable
                      as CubitState,
            isAuthenticated: null == isAuthenticated
                ? _value.isAuthenticated
                : isAuthenticated // ignore: cast_nullable_to_non_nullable
                      as bool,
            twoFactorSecret: freezed == twoFactorSecret
                ? _value.twoFactorSecret
                : twoFactorSecret // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<$Res> get status {
    return $CubitStateCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<$Res> get signInStatus {
    return $CubitStateCopyWith<$Res>(_value.signInStatus, (value) {
      return _then(_value.copyWith(signInStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<$Res> get signUpStatus {
    return $CubitStateCopyWith<$Res>(_value.signUpStatus, (value) {
      return _then(_value.copyWith(signUpStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<$Res> get passwordResetStatus {
    return $CubitStateCopyWith<$Res>(_value.passwordResetStatus, (value) {
      return _then(_value.copyWith(passwordResetStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<$Res> get verificationEmailStatus {
    return $CubitStateCopyWith<$Res>(_value.verificationEmailStatus, (value) {
      return _then(_value.copyWith(verificationEmailStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<$Res> get twoFactorStatus {
    return $CubitStateCopyWith<$Res>(_value.twoFactorStatus, (value) {
      return _then(_value.copyWith(twoFactorStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
    _$AuthStateImpl value,
    $Res Function(_$AuthStateImpl) then,
  ) = __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    User? user,
    CubitState status,
    CubitState signInStatus,
    CubitState signUpStatus,
    CubitState passwordResetStatus,
    CubitState verificationEmailStatus,
    CubitState twoFactorStatus,
    bool isAuthenticated,
    String? twoFactorSecret,
    String? errorMessage,
  });

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $CubitStateCopyWith<$Res> get status;
  @override
  $CubitStateCopyWith<$Res> get signInStatus;
  @override
  $CubitStateCopyWith<$Res> get signUpStatus;
  @override
  $CubitStateCopyWith<$Res> get passwordResetStatus;
  @override
  $CubitStateCopyWith<$Res> get verificationEmailStatus;
  @override
  $CubitStateCopyWith<$Res> get twoFactorStatus;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
    _$AuthStateImpl _value,
    $Res Function(_$AuthStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? signInStatus = null,
    Object? signUpStatus = null,
    Object? passwordResetStatus = null,
    Object? verificationEmailStatus = null,
    Object? twoFactorStatus = null,
    Object? isAuthenticated = null,
    Object? twoFactorSecret = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$AuthStateImpl(
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CubitState,
        signInStatus: null == signInStatus
            ? _value.signInStatus
            : signInStatus // ignore: cast_nullable_to_non_nullable
                  as CubitState,
        signUpStatus: null == signUpStatus
            ? _value.signUpStatus
            : signUpStatus // ignore: cast_nullable_to_non_nullable
                  as CubitState,
        passwordResetStatus: null == passwordResetStatus
            ? _value.passwordResetStatus
            : passwordResetStatus // ignore: cast_nullable_to_non_nullable
                  as CubitState,
        verificationEmailStatus: null == verificationEmailStatus
            ? _value.verificationEmailStatus
            : verificationEmailStatus // ignore: cast_nullable_to_non_nullable
                  as CubitState,
        twoFactorStatus: null == twoFactorStatus
            ? _value.twoFactorStatus
            : twoFactorStatus // ignore: cast_nullable_to_non_nullable
                  as CubitState,
        isAuthenticated: null == isAuthenticated
            ? _value.isAuthenticated
            : isAuthenticated // ignore: cast_nullable_to_non_nullable
                  as bool,
        twoFactorSecret: freezed == twoFactorSecret
            ? _value.twoFactorSecret
            : twoFactorSecret // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({
    this.user,
    this.status = const CubitState.initial(),
    this.signInStatus = const CubitState.initial(),
    this.signUpStatus = const CubitState.initial(),
    this.passwordResetStatus = const CubitState.initial(),
    this.verificationEmailStatus = const CubitState.initial(),
    this.twoFactorStatus = const CubitState.initial(),
    this.isAuthenticated = false,
    this.twoFactorSecret,
    this.errorMessage,
  });

  @override
  final User? user;
  @override
  @JsonKey()
  final CubitState status;
  @override
  @JsonKey()
  final CubitState signInStatus;
  @override
  @JsonKey()
  final CubitState signUpStatus;
  @override
  @JsonKey()
  final CubitState passwordResetStatus;
  @override
  @JsonKey()
  final CubitState verificationEmailStatus;
  @override
  @JsonKey()
  final CubitState twoFactorStatus;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  final String? twoFactorSecret;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthState(user: $user, status: $status, signInStatus: $signInStatus, signUpStatus: $signUpStatus, passwordResetStatus: $passwordResetStatus, verificationEmailStatus: $verificationEmailStatus, twoFactorStatus: $twoFactorStatus, isAuthenticated: $isAuthenticated, twoFactorSecret: $twoFactorSecret, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.signUpStatus, signUpStatus) ||
                other.signUpStatus == signUpStatus) &&
            (identical(other.passwordResetStatus, passwordResetStatus) ||
                other.passwordResetStatus == passwordResetStatus) &&
            (identical(
                  other.verificationEmailStatus,
                  verificationEmailStatus,
                ) ||
                other.verificationEmailStatus == verificationEmailStatus) &&
            (identical(other.twoFactorStatus, twoFactorStatus) ||
                other.twoFactorStatus == twoFactorStatus) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.twoFactorSecret, twoFactorSecret) ||
                other.twoFactorSecret == twoFactorSecret) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    status,
    signInStatus,
    signUpStatus,
    passwordResetStatus,
    verificationEmailStatus,
    twoFactorStatus,
    isAuthenticated,
    twoFactorSecret,
    errorMessage,
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({
    final User? user,
    final CubitState status,
    final CubitState signInStatus,
    final CubitState signUpStatus,
    final CubitState passwordResetStatus,
    final CubitState verificationEmailStatus,
    final CubitState twoFactorStatus,
    final bool isAuthenticated,
    final String? twoFactorSecret,
    final String? errorMessage,
  }) = _$AuthStateImpl;

  @override
  User? get user;
  @override
  CubitState get status;
  @override
  CubitState get signInStatus;
  @override
  CubitState get signUpStatus;
  @override
  CubitState get passwordResetStatus;
  @override
  CubitState get verificationEmailStatus;
  @override
  CubitState get twoFactorStatus;
  @override
  bool get isAuthenticated;
  @override
  String? get twoFactorSecret;
  @override
  String? get errorMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
