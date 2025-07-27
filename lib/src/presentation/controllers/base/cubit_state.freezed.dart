// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CubitStateCopyWith<$Res> {
  factory $CubitStateCopyWith(
    CubitState value,
    $Res Function(CubitState) then,
  ) = _$CubitStateCopyWithImpl<$Res, CubitState>;
}

/// @nodoc
class _$CubitStateCopyWithImpl<$Res, $Val extends CubitState>
    implements $CubitStateCopyWith<$Res> {
  _$CubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CubitStateLoadingImplCopyWith<$Res> {
  factory _$$CubitStateLoadingImplCopyWith(
    _$CubitStateLoadingImpl value,
    $Res Function(_$CubitStateLoadingImpl) then,
  ) = __$$CubitStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CubitStateLoadingImplCopyWithImpl<$Res>
    extends _$CubitStateCopyWithImpl<$Res, _$CubitStateLoadingImpl>
    implements _$$CubitStateLoadingImplCopyWith<$Res> {
  __$$CubitStateLoadingImplCopyWithImpl(
    _$CubitStateLoadingImpl _value,
    $Res Function(_$CubitStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CubitStateLoadingImpl implements CubitStateLoading {
  const _$CubitStateLoadingImpl();

  @override
  String toString() {
    return 'CubitState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CubitStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CubitStateLoading implements CubitState {
  const factory CubitStateLoading() = _$CubitStateLoadingImpl;
}

/// @nodoc
abstract class _$$CubitStateLoadedImplCopyWith<$Res> {
  factory _$$CubitStateLoadedImplCopyWith(
    _$CubitStateLoadedImpl value,
    $Res Function(_$CubitStateLoadedImpl) then,
  ) = __$$CubitStateLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CubitStateLoadedImplCopyWithImpl<$Res>
    extends _$CubitStateCopyWithImpl<$Res, _$CubitStateLoadedImpl>
    implements _$$CubitStateLoadedImplCopyWith<$Res> {
  __$$CubitStateLoadedImplCopyWithImpl(
    _$CubitStateLoadedImpl _value,
    $Res Function(_$CubitStateLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CubitStateLoadedImpl implements CubitStateLoaded {
  const _$CubitStateLoadedImpl();

  @override
  String toString() {
    return 'CubitState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CubitStateLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CubitStateLoaded implements CubitState {
  const factory CubitStateLoaded() = _$CubitStateLoadedImpl;
}

/// @nodoc
abstract class _$$CubitStateSubmittingImplCopyWith<$Res> {
  factory _$$CubitStateSubmittingImplCopyWith(
    _$CubitStateSubmittingImpl value,
    $Res Function(_$CubitStateSubmittingImpl) then,
  ) = __$$CubitStateSubmittingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CubitStateSubmittingImplCopyWithImpl<$Res>
    extends _$CubitStateCopyWithImpl<$Res, _$CubitStateSubmittingImpl>
    implements _$$CubitStateSubmittingImplCopyWith<$Res> {
  __$$CubitStateSubmittingImplCopyWithImpl(
    _$CubitStateSubmittingImpl _value,
    $Res Function(_$CubitStateSubmittingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CubitStateSubmittingImpl implements CubitStateSubmitting {
  const _$CubitStateSubmittingImpl();

  @override
  String toString() {
    return 'CubitState.submitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CubitStateSubmittingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class CubitStateSubmitting implements CubitState {
  const factory CubitStateSubmitting() = _$CubitStateSubmittingImpl;
}

/// @nodoc
abstract class _$$CubitStateSubmittedImplCopyWith<$Res> {
  factory _$$CubitStateSubmittedImplCopyWith(
    _$CubitStateSubmittedImpl value,
    $Res Function(_$CubitStateSubmittedImpl) then,
  ) = __$$CubitStateSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CubitStateSubmittedImplCopyWithImpl<$Res>
    extends _$CubitStateCopyWithImpl<$Res, _$CubitStateSubmittedImpl>
    implements _$$CubitStateSubmittedImplCopyWith<$Res> {
  __$$CubitStateSubmittedImplCopyWithImpl(
    _$CubitStateSubmittedImpl _value,
    $Res Function(_$CubitStateSubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CubitStateSubmittedImpl implements CubitStateSubmitted {
  const _$CubitStateSubmittedImpl();

  @override
  String toString() {
    return 'CubitState.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CubitStateSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class CubitStateSubmitted implements CubitState {
  const factory CubitStateSubmitted() = _$CubitStateSubmittedImpl;
}

/// @nodoc
abstract class _$$CubitStateErrorImplCopyWith<$Res> {
  factory _$$CubitStateErrorImplCopyWith(
    _$CubitStateErrorImpl value,
    $Res Function(_$CubitStateErrorImpl) then,
  ) = __$$CubitStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code, bool canRetry});
}

/// @nodoc
class __$$CubitStateErrorImplCopyWithImpl<$Res>
    extends _$CubitStateCopyWithImpl<$Res, _$CubitStateErrorImpl>
    implements _$$CubitStateErrorImplCopyWith<$Res> {
  __$$CubitStateErrorImplCopyWithImpl(
    _$CubitStateErrorImpl _value,
    $Res Function(_$CubitStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? canRetry = null,
  }) {
    return _then(
      _$CubitStateErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        canRetry: null == canRetry
            ? _value.canRetry
            : canRetry // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CubitStateErrorImpl implements CubitStateError {
  const _$CubitStateErrorImpl({
    required this.message,
    this.code,
    this.canRetry = false,
  });

  @override
  final String message;
  @override
  final String? code;
  @override
  @JsonKey()
  final bool canRetry;

  @override
  String toString() {
    return 'CubitState.error(message: $message, code: $code, canRetry: $canRetry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CubitStateErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.canRetry, canRetry) ||
                other.canRetry == canRetry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, canRetry);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CubitStateErrorImplCopyWith<_$CubitStateErrorImpl> get copyWith =>
      __$$CubitStateErrorImplCopyWithImpl<_$CubitStateErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) {
    return error(message, code, canRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) {
    return error?.call(message, code, canRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code, canRetry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CubitStateError implements CubitState {
  const factory CubitStateError({
    required final String message,
    final String? code,
    final bool canRetry,
  }) = _$CubitStateErrorImpl;

  String get message;
  String? get code;
  bool get canRetry;

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CubitStateErrorImplCopyWith<_$CubitStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CubitStateInitialImplCopyWith<$Res> {
  factory _$$CubitStateInitialImplCopyWith(
    _$CubitStateInitialImpl value,
    $Res Function(_$CubitStateInitialImpl) then,
  ) = __$$CubitStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CubitStateInitialImplCopyWithImpl<$Res>
    extends _$CubitStateCopyWithImpl<$Res, _$CubitStateInitialImpl>
    implements _$$CubitStateInitialImplCopyWith<$Res> {
  __$$CubitStateInitialImplCopyWithImpl(
    _$CubitStateInitialImpl _value,
    $Res Function(_$CubitStateInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CubitStateInitialImpl implements CubitStateInitial {
  const _$CubitStateInitialImpl();

  @override
  String toString() {
    return 'CubitState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CubitStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message, String? code, bool canRetry)
    error,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
    TResult? Function(String message, String? code, bool canRetry)? error,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message, String? code, bool canRetry)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitStateLoading value) loading,
    required TResult Function(CubitStateLoaded value) loaded,
    required TResult Function(CubitStateSubmitting value) submitting,
    required TResult Function(CubitStateSubmitted value) submitted,
    required TResult Function(CubitStateError value) error,
    required TResult Function(CubitStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitStateLoading value)? loading,
    TResult? Function(CubitStateLoaded value)? loaded,
    TResult? Function(CubitStateSubmitting value)? submitting,
    TResult? Function(CubitStateSubmitted value)? submitted,
    TResult? Function(CubitStateError value)? error,
    TResult? Function(CubitStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitStateLoading value)? loading,
    TResult Function(CubitStateLoaded value)? loaded,
    TResult Function(CubitStateSubmitting value)? submitting,
    TResult Function(CubitStateSubmitted value)? submitted,
    TResult Function(CubitStateError value)? error,
    TResult Function(CubitStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CubitStateInitial implements CubitState {
  const factory CubitStateInitial() = _$CubitStateInitialImpl;
}
