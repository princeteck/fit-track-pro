// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heart_rate_monitor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HeartRateMonitorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateMonitorStateCopyWith<$Res> {
  factory $HeartRateMonitorStateCopyWith(
    HeartRateMonitorState value,
    $Res Function(HeartRateMonitorState) then,
  ) = _$HeartRateMonitorStateCopyWithImpl<$Res, HeartRateMonitorState>;
}

/// @nodoc
class _$HeartRateMonitorStateCopyWithImpl<
  $Res,
  $Val extends HeartRateMonitorState
>
    implements $HeartRateMonitorStateCopyWith<$Res> {
  _$HeartRateMonitorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HeartRateMonitorStateInitialImplCopyWith<$Res> {
  factory _$$HeartRateMonitorStateInitialImplCopyWith(
    _$HeartRateMonitorStateInitialImpl value,
    $Res Function(_$HeartRateMonitorStateInitialImpl) then,
  ) = __$$HeartRateMonitorStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HeartRateMonitorStateInitialImplCopyWithImpl<$Res>
    extends
        _$HeartRateMonitorStateCopyWithImpl<
          $Res,
          _$HeartRateMonitorStateInitialImpl
        >
    implements _$$HeartRateMonitorStateInitialImplCopyWith<$Res> {
  __$$HeartRateMonitorStateInitialImplCopyWithImpl(
    _$HeartRateMonitorStateInitialImpl _value,
    $Res Function(_$HeartRateMonitorStateInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HeartRateMonitorStateInitialImpl
    implements HeartRateMonitorStateInitial {
  const _$HeartRateMonitorStateInitialImpl();

  @override
  String toString() {
    return 'HeartRateMonitorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateMonitorStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
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
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HeartRateMonitorStateInitial implements HeartRateMonitorState {
  const factory HeartRateMonitorStateInitial() =
      _$HeartRateMonitorStateInitialImpl;
}

/// @nodoc
abstract class _$$HeartRateMonitorStateTypeSelectedImplCopyWith<$Res> {
  factory _$$HeartRateMonitorStateTypeSelectedImplCopyWith(
    _$HeartRateMonitorStateTypeSelectedImpl value,
    $Res Function(_$HeartRateMonitorStateTypeSelectedImpl) then,
  ) = __$$HeartRateMonitorStateTypeSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HeartRateType type});
}

/// @nodoc
class __$$HeartRateMonitorStateTypeSelectedImplCopyWithImpl<$Res>
    extends
        _$HeartRateMonitorStateCopyWithImpl<
          $Res,
          _$HeartRateMonitorStateTypeSelectedImpl
        >
    implements _$$HeartRateMonitorStateTypeSelectedImplCopyWith<$Res> {
  __$$HeartRateMonitorStateTypeSelectedImplCopyWithImpl(
    _$HeartRateMonitorStateTypeSelectedImpl _value,
    $Res Function(_$HeartRateMonitorStateTypeSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _$HeartRateMonitorStateTypeSelectedImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HeartRateType,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateMonitorStateTypeSelectedImpl
    implements HeartRateMonitorStateTypeSelected {
  const _$HeartRateMonitorStateTypeSelectedImpl({required this.type});

  @override
  final HeartRateType type;

  @override
  String toString() {
    return 'HeartRateMonitorState.typeSelected(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateMonitorStateTypeSelectedImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateMonitorStateTypeSelectedImplCopyWith<
    _$HeartRateMonitorStateTypeSelectedImpl
  >
  get copyWith =>
      __$$HeartRateMonitorStateTypeSelectedImplCopyWithImpl<
        _$HeartRateMonitorStateTypeSelectedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) {
    return typeSelected(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) {
    return typeSelected?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (typeSelected != null) {
      return typeSelected(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) {
    return typeSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) {
    return typeSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) {
    if (typeSelected != null) {
      return typeSelected(this);
    }
    return orElse();
  }
}

abstract class HeartRateMonitorStateTypeSelected
    implements HeartRateMonitorState {
  const factory HeartRateMonitorStateTypeSelected({
    required final HeartRateType type,
  }) = _$HeartRateMonitorStateTypeSelectedImpl;

  HeartRateType get type;

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateMonitorStateTypeSelectedImplCopyWith<
    _$HeartRateMonitorStateTypeSelectedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeartRateMonitorStateDurationSelectedImplCopyWith<$Res> {
  factory _$$HeartRateMonitorStateDurationSelectedImplCopyWith(
    _$HeartRateMonitorStateDurationSelectedImpl value,
    $Res Function(_$HeartRateMonitorStateDurationSelectedImpl) then,
  ) = __$$HeartRateMonitorStateDurationSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int durationSeconds, HeartRateType type});
}

/// @nodoc
class __$$HeartRateMonitorStateDurationSelectedImplCopyWithImpl<$Res>
    extends
        _$HeartRateMonitorStateCopyWithImpl<
          $Res,
          _$HeartRateMonitorStateDurationSelectedImpl
        >
    implements _$$HeartRateMonitorStateDurationSelectedImplCopyWith<$Res> {
  __$$HeartRateMonitorStateDurationSelectedImplCopyWithImpl(
    _$HeartRateMonitorStateDurationSelectedImpl _value,
    $Res Function(_$HeartRateMonitorStateDurationSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? durationSeconds = null, Object? type = null}) {
    return _then(
      _$HeartRateMonitorStateDurationSelectedImpl(
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HeartRateType,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateMonitorStateDurationSelectedImpl
    implements HeartRateMonitorStateDurationSelected {
  const _$HeartRateMonitorStateDurationSelectedImpl({
    required this.durationSeconds,
    required this.type,
  });

  @override
  final int durationSeconds;
  @override
  final HeartRateType type;

  @override
  String toString() {
    return 'HeartRateMonitorState.durationSelected(durationSeconds: $durationSeconds, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateMonitorStateDurationSelectedImpl &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, durationSeconds, type);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateMonitorStateDurationSelectedImplCopyWith<
    _$HeartRateMonitorStateDurationSelectedImpl
  >
  get copyWith =>
      __$$HeartRateMonitorStateDurationSelectedImplCopyWithImpl<
        _$HeartRateMonitorStateDurationSelectedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) {
    return durationSelected(durationSeconds, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) {
    return durationSelected?.call(durationSeconds, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (durationSelected != null) {
      return durationSelected(durationSeconds, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) {
    return durationSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) {
    return durationSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) {
    if (durationSelected != null) {
      return durationSelected(this);
    }
    return orElse();
  }
}

abstract class HeartRateMonitorStateDurationSelected
    implements HeartRateMonitorState {
  const factory HeartRateMonitorStateDurationSelected({
    required final int durationSeconds,
    required final HeartRateType type,
  }) = _$HeartRateMonitorStateDurationSelectedImpl;

  int get durationSeconds;
  HeartRateType get type;

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateMonitorStateDurationSelectedImplCopyWith<
    _$HeartRateMonitorStateDurationSelectedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeartRateMonitorStateMonitoringImplCopyWith<$Res> {
  factory _$$HeartRateMonitorStateMonitoringImplCopyWith(
    _$HeartRateMonitorStateMonitoringImpl value,
    $Res Function(_$HeartRateMonitorStateMonitoringImpl) then,
  ) = __$$HeartRateMonitorStateMonitoringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String sessionId,
    HeartRateType type,
    int durationSeconds,
    List<HeartRateReading> readings,
    int remainingSeconds,
    double progress,
  });
}

/// @nodoc
class __$$HeartRateMonitorStateMonitoringImplCopyWithImpl<$Res>
    extends
        _$HeartRateMonitorStateCopyWithImpl<
          $Res,
          _$HeartRateMonitorStateMonitoringImpl
        >
    implements _$$HeartRateMonitorStateMonitoringImplCopyWith<$Res> {
  __$$HeartRateMonitorStateMonitoringImplCopyWithImpl(
    _$HeartRateMonitorStateMonitoringImpl _value,
    $Res Function(_$HeartRateMonitorStateMonitoringImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? type = null,
    Object? durationSeconds = null,
    Object? readings = null,
    Object? remainingSeconds = null,
    Object? progress = null,
  }) {
    return _then(
      _$HeartRateMonitorStateMonitoringImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HeartRateType,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        readings: null == readings
            ? _value._readings
            : readings // ignore: cast_nullable_to_non_nullable
                  as List<HeartRateReading>,
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateMonitorStateMonitoringImpl
    implements HeartRateMonitorStateMonitoring {
  const _$HeartRateMonitorStateMonitoringImpl({
    required this.sessionId,
    required this.type,
    required this.durationSeconds,
    required final List<HeartRateReading> readings,
    required this.remainingSeconds,
    required this.progress,
  }) : _readings = readings;

  @override
  final String sessionId;
  @override
  final HeartRateType type;
  @override
  final int durationSeconds;
  final List<HeartRateReading> _readings;
  @override
  List<HeartRateReading> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  final int remainingSeconds;
  @override
  final double progress;

  @override
  String toString() {
    return 'HeartRateMonitorState.monitoring(sessionId: $sessionId, type: $type, durationSeconds: $durationSeconds, readings: $readings, remainingSeconds: $remainingSeconds, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateMonitorStateMonitoringImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    type,
    durationSeconds,
    const DeepCollectionEquality().hash(_readings),
    remainingSeconds,
    progress,
  );

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateMonitorStateMonitoringImplCopyWith<
    _$HeartRateMonitorStateMonitoringImpl
  >
  get copyWith =>
      __$$HeartRateMonitorStateMonitoringImplCopyWithImpl<
        _$HeartRateMonitorStateMonitoringImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) {
    return monitoring(
      sessionId,
      type,
      durationSeconds,
      readings,
      remainingSeconds,
      progress,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) {
    return monitoring?.call(
      sessionId,
      type,
      durationSeconds,
      readings,
      remainingSeconds,
      progress,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (monitoring != null) {
      return monitoring(
        sessionId,
        type,
        durationSeconds,
        readings,
        remainingSeconds,
        progress,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) {
    return monitoring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) {
    return monitoring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) {
    if (monitoring != null) {
      return monitoring(this);
    }
    return orElse();
  }
}

abstract class HeartRateMonitorStateMonitoring
    implements HeartRateMonitorState {
  const factory HeartRateMonitorStateMonitoring({
    required final String sessionId,
    required final HeartRateType type,
    required final int durationSeconds,
    required final List<HeartRateReading> readings,
    required final int remainingSeconds,
    required final double progress,
  }) = _$HeartRateMonitorStateMonitoringImpl;

  String get sessionId;
  HeartRateType get type;
  int get durationSeconds;
  List<HeartRateReading> get readings;
  int get remainingSeconds;
  double get progress;

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateMonitorStateMonitoringImplCopyWith<
    _$HeartRateMonitorStateMonitoringImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeartRateMonitorStateCompletedImplCopyWith<$Res> {
  factory _$$HeartRateMonitorStateCompletedImplCopyWith(
    _$HeartRateMonitorStateCompletedImpl value,
    $Res Function(_$HeartRateMonitorStateCompletedImpl) then,
  ) = __$$HeartRateMonitorStateCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String sessionId,
    HeartRateType type,
    List<HeartRateReading> readings,
    int averageBpm,
  });
}

/// @nodoc
class __$$HeartRateMonitorStateCompletedImplCopyWithImpl<$Res>
    extends
        _$HeartRateMonitorStateCopyWithImpl<
          $Res,
          _$HeartRateMonitorStateCompletedImpl
        >
    implements _$$HeartRateMonitorStateCompletedImplCopyWith<$Res> {
  __$$HeartRateMonitorStateCompletedImplCopyWithImpl(
    _$HeartRateMonitorStateCompletedImpl _value,
    $Res Function(_$HeartRateMonitorStateCompletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? type = null,
    Object? readings = null,
    Object? averageBpm = null,
  }) {
    return _then(
      _$HeartRateMonitorStateCompletedImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HeartRateType,
        readings: null == readings
            ? _value._readings
            : readings // ignore: cast_nullable_to_non_nullable
                  as List<HeartRateReading>,
        averageBpm: null == averageBpm
            ? _value.averageBpm
            : averageBpm // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateMonitorStateCompletedImpl
    implements HeartRateMonitorStateCompleted {
  const _$HeartRateMonitorStateCompletedImpl({
    required this.sessionId,
    required this.type,
    required final List<HeartRateReading> readings,
    required this.averageBpm,
  }) : _readings = readings;

  @override
  final String sessionId;
  @override
  final HeartRateType type;
  final List<HeartRateReading> _readings;
  @override
  List<HeartRateReading> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  final int averageBpm;

  @override
  String toString() {
    return 'HeartRateMonitorState.completed(sessionId: $sessionId, type: $type, readings: $readings, averageBpm: $averageBpm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateMonitorStateCompletedImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.averageBpm, averageBpm) ||
                other.averageBpm == averageBpm));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    type,
    const DeepCollectionEquality().hash(_readings),
    averageBpm,
  );

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateMonitorStateCompletedImplCopyWith<
    _$HeartRateMonitorStateCompletedImpl
  >
  get copyWith =>
      __$$HeartRateMonitorStateCompletedImplCopyWithImpl<
        _$HeartRateMonitorStateCompletedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) {
    return completed(sessionId, type, readings, averageBpm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) {
    return completed?.call(sessionId, type, readings, averageBpm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(sessionId, type, readings, averageBpm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class HeartRateMonitorStateCompleted implements HeartRateMonitorState {
  const factory HeartRateMonitorStateCompleted({
    required final String sessionId,
    required final HeartRateType type,
    required final List<HeartRateReading> readings,
    required final int averageBpm,
  }) = _$HeartRateMonitorStateCompletedImpl;

  String get sessionId;
  HeartRateType get type;
  List<HeartRateReading> get readings;
  int get averageBpm;

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateMonitorStateCompletedImplCopyWith<
    _$HeartRateMonitorStateCompletedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeartRateMonitorStateErrorImplCopyWith<$Res> {
  factory _$$HeartRateMonitorStateErrorImplCopyWith(
    _$HeartRateMonitorStateErrorImpl value,
    $Res Function(_$HeartRateMonitorStateErrorImpl) then,
  ) = __$$HeartRateMonitorStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HeartRateMonitorStateErrorImplCopyWithImpl<$Res>
    extends
        _$HeartRateMonitorStateCopyWithImpl<
          $Res,
          _$HeartRateMonitorStateErrorImpl
        >
    implements _$$HeartRateMonitorStateErrorImplCopyWith<$Res> {
  __$$HeartRateMonitorStateErrorImplCopyWithImpl(
    _$HeartRateMonitorStateErrorImpl _value,
    $Res Function(_$HeartRateMonitorStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$HeartRateMonitorStateErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateMonitorStateErrorImpl implements HeartRateMonitorStateError {
  const _$HeartRateMonitorStateErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'HeartRateMonitorState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateMonitorStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateMonitorStateErrorImplCopyWith<_$HeartRateMonitorStateErrorImpl>
  get copyWith =>
      __$$HeartRateMonitorStateErrorImplCopyWithImpl<
        _$HeartRateMonitorStateErrorImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(HeartRateType type) typeSelected,
    required TResult Function(int durationSeconds, HeartRateType type)
    durationSelected,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )
    monitoring,
    required TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )
    completed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(HeartRateType type)? typeSelected,
    TResult? Function(int durationSeconds, HeartRateType type)?
    durationSelected,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult? Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(HeartRateType type)? typeSelected,
    TResult Function(int durationSeconds, HeartRateType type)? durationSelected,
    TResult Function(
      String sessionId,
      HeartRateType type,
      int durationSeconds,
      List<HeartRateReading> readings,
      int remainingSeconds,
      double progress,
    )?
    monitoring,
    TResult Function(
      String sessionId,
      HeartRateType type,
      List<HeartRateReading> readings,
      int averageBpm,
    )?
    completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeartRateMonitorStateInitial value) initial,
    required TResult Function(HeartRateMonitorStateTypeSelected value)
    typeSelected,
    required TResult Function(HeartRateMonitorStateDurationSelected value)
    durationSelected,
    required TResult Function(HeartRateMonitorStateMonitoring value) monitoring,
    required TResult Function(HeartRateMonitorStateCompleted value) completed,
    required TResult Function(HeartRateMonitorStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeartRateMonitorStateInitial value)? initial,
    TResult? Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult? Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult? Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult? Function(HeartRateMonitorStateCompleted value)? completed,
    TResult? Function(HeartRateMonitorStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeartRateMonitorStateInitial value)? initial,
    TResult Function(HeartRateMonitorStateTypeSelected value)? typeSelected,
    TResult Function(HeartRateMonitorStateDurationSelected value)?
    durationSelected,
    TResult Function(HeartRateMonitorStateMonitoring value)? monitoring,
    TResult Function(HeartRateMonitorStateCompleted value)? completed,
    TResult Function(HeartRateMonitorStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HeartRateMonitorStateError implements HeartRateMonitorState {
  const factory HeartRateMonitorStateError({required final String message}) =
      _$HeartRateMonitorStateErrorImpl;

  String get message;

  /// Create a copy of HeartRateMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateMonitorStateErrorImplCopyWith<_$HeartRateMonitorStateErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
