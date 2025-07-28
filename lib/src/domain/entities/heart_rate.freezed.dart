// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heart_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HeartRate {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get bpm => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  HeartRateType get type => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt =>
      throw _privateConstructorUsedError; // Session-based monitoring data
  String? get sessionId => throw _privateConstructorUsedError;
  int? get sessionDurationSeconds => throw _privateConstructorUsedError;
  List<HeartRateReading> get readings => throw _privateConstructorUsedError;

  /// Create a copy of HeartRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateCopyWith<HeartRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateCopyWith<$Res> {
  factory $HeartRateCopyWith(HeartRate value, $Res Function(HeartRate) then) =
      _$HeartRateCopyWithImpl<$Res, HeartRate>;
  @useResult
  $Res call({
    String id,
    String userId,
    int bpm,
    DateTime timestamp,
    HeartRateType type,
    String? notes,
    DateTime createdAt,
    DateTime? updatedAt,
    String? sessionId,
    int? sessionDurationSeconds,
    List<HeartRateReading> readings,
  });
}

/// @nodoc
class _$HeartRateCopyWithImpl<$Res, $Val extends HeartRate>
    implements $HeartRateCopyWith<$Res> {
  _$HeartRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bpm = null,
    Object? timestamp = null,
    Object? type = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? sessionId = freezed,
    Object? sessionDurationSeconds = freezed,
    Object? readings = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            bpm: null == bpm
                ? _value.bpm
                : bpm // ignore: cast_nullable_to_non_nullable
                      as int,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as HeartRateType,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            sessionId: freezed == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionDurationSeconds: freezed == sessionDurationSeconds
                ? _value.sessionDurationSeconds
                : sessionDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            readings: null == readings
                ? _value.readings
                : readings // ignore: cast_nullable_to_non_nullable
                      as List<HeartRateReading>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HeartRateImplCopyWith<$Res>
    implements $HeartRateCopyWith<$Res> {
  factory _$$HeartRateImplCopyWith(
    _$HeartRateImpl value,
    $Res Function(_$HeartRateImpl) then,
  ) = __$$HeartRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    int bpm,
    DateTime timestamp,
    HeartRateType type,
    String? notes,
    DateTime createdAt,
    DateTime? updatedAt,
    String? sessionId,
    int? sessionDurationSeconds,
    List<HeartRateReading> readings,
  });
}

/// @nodoc
class __$$HeartRateImplCopyWithImpl<$Res>
    extends _$HeartRateCopyWithImpl<$Res, _$HeartRateImpl>
    implements _$$HeartRateImplCopyWith<$Res> {
  __$$HeartRateImplCopyWithImpl(
    _$HeartRateImpl _value,
    $Res Function(_$HeartRateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bpm = null,
    Object? timestamp = null,
    Object? type = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? sessionId = freezed,
    Object? sessionDurationSeconds = freezed,
    Object? readings = null,
  }) {
    return _then(
      _$HeartRateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        bpm: null == bpm
            ? _value.bpm
            : bpm // ignore: cast_nullable_to_non_nullable
                  as int,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HeartRateType,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sessionId: freezed == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionDurationSeconds: freezed == sessionDurationSeconds
            ? _value.sessionDurationSeconds
            : sessionDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        readings: null == readings
            ? _value._readings
            : readings // ignore: cast_nullable_to_non_nullable
                  as List<HeartRateReading>,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateImpl implements _HeartRate {
  const _$HeartRateImpl({
    required this.id,
    required this.userId,
    required this.bpm,
    required this.timestamp,
    this.type = HeartRateType.resting,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.sessionId,
    this.sessionDurationSeconds,
    final List<HeartRateReading> readings = const [],
  }) : _readings = readings;

  @override
  final String id;
  @override
  final String userId;
  @override
  final int bpm;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final HeartRateType type;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  // Session-based monitoring data
  @override
  final String? sessionId;
  @override
  final int? sessionDurationSeconds;
  final List<HeartRateReading> _readings;
  @override
  @JsonKey()
  List<HeartRateReading> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  String toString() {
    return 'HeartRate(id: $id, userId: $userId, bpm: $bpm, timestamp: $timestamp, type: $type, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, sessionDurationSeconds: $sessionDurationSeconds, readings: $readings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sessionDurationSeconds, sessionDurationSeconds) ||
                other.sessionDurationSeconds == sessionDurationSeconds) &&
            const DeepCollectionEquality().equals(other._readings, _readings));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    bpm,
    timestamp,
    type,
    notes,
    createdAt,
    updatedAt,
    sessionId,
    sessionDurationSeconds,
    const DeepCollectionEquality().hash(_readings),
  );

  /// Create a copy of HeartRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateImplCopyWith<_$HeartRateImpl> get copyWith =>
      __$$HeartRateImplCopyWithImpl<_$HeartRateImpl>(this, _$identity);
}

abstract class _HeartRate implements HeartRate {
  const factory _HeartRate({
    required final String id,
    required final String userId,
    required final int bpm,
    required final DateTime timestamp,
    final HeartRateType type,
    final String? notes,
    required final DateTime createdAt,
    final DateTime? updatedAt,
    final String? sessionId,
    final int? sessionDurationSeconds,
    final List<HeartRateReading> readings,
  }) = _$HeartRateImpl;

  @override
  String get id;
  @override
  String get userId;
  @override
  int get bpm;
  @override
  DateTime get timestamp;
  @override
  HeartRateType get type;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt; // Session-based monitoring data
  @override
  String? get sessionId;
  @override
  int? get sessionDurationSeconds;
  @override
  List<HeartRateReading> get readings;

  /// Create a copy of HeartRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateImplCopyWith<_$HeartRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HeartRateReading {
  int get bpm => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get intervalMs => throw _privateConstructorUsedError;

  /// Create a copy of HeartRateReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateReadingCopyWith<HeartRateReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateReadingCopyWith<$Res> {
  factory $HeartRateReadingCopyWith(
    HeartRateReading value,
    $Res Function(HeartRateReading) then,
  ) = _$HeartRateReadingCopyWithImpl<$Res, HeartRateReading>;
  @useResult
  $Res call({int bpm, DateTime timestamp, double intervalMs});
}

/// @nodoc
class _$HeartRateReadingCopyWithImpl<$Res, $Val extends HeartRateReading>
    implements $HeartRateReadingCopyWith<$Res> {
  _$HeartRateReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpm = null,
    Object? timestamp = null,
    Object? intervalMs = null,
  }) {
    return _then(
      _value.copyWith(
            bpm: null == bpm
                ? _value.bpm
                : bpm // ignore: cast_nullable_to_non_nullable
                      as int,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            intervalMs: null == intervalMs
                ? _value.intervalMs
                : intervalMs // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HeartRateReadingImplCopyWith<$Res>
    implements $HeartRateReadingCopyWith<$Res> {
  factory _$$HeartRateReadingImplCopyWith(
    _$HeartRateReadingImpl value,
    $Res Function(_$HeartRateReadingImpl) then,
  ) = __$$HeartRateReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int bpm, DateTime timestamp, double intervalMs});
}

/// @nodoc
class __$$HeartRateReadingImplCopyWithImpl<$Res>
    extends _$HeartRateReadingCopyWithImpl<$Res, _$HeartRateReadingImpl>
    implements _$$HeartRateReadingImplCopyWith<$Res> {
  __$$HeartRateReadingImplCopyWithImpl(
    _$HeartRateReadingImpl _value,
    $Res Function(_$HeartRateReadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpm = null,
    Object? timestamp = null,
    Object? intervalMs = null,
  }) {
    return _then(
      _$HeartRateReadingImpl(
        bpm: null == bpm
            ? _value.bpm
            : bpm // ignore: cast_nullable_to_non_nullable
                  as int,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        intervalMs: null == intervalMs
            ? _value.intervalMs
            : intervalMs // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateReadingImpl implements _HeartRateReading {
  const _$HeartRateReadingImpl({
    required this.bpm,
    required this.timestamp,
    required this.intervalMs,
  });

  @override
  final int bpm;
  @override
  final DateTime timestamp;
  @override
  final double intervalMs;

  @override
  String toString() {
    return 'HeartRateReading(bpm: $bpm, timestamp: $timestamp, intervalMs: $intervalMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateReadingImpl &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.intervalMs, intervalMs) ||
                other.intervalMs == intervalMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bpm, timestamp, intervalMs);

  /// Create a copy of HeartRateReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateReadingImplCopyWith<_$HeartRateReadingImpl> get copyWith =>
      __$$HeartRateReadingImplCopyWithImpl<_$HeartRateReadingImpl>(
        this,
        _$identity,
      );
}

abstract class _HeartRateReading implements HeartRateReading {
  const factory _HeartRateReading({
    required final int bpm,
    required final DateTime timestamp,
    required final double intervalMs,
  }) = _$HeartRateReadingImpl;

  @override
  int get bpm;
  @override
  DateTime get timestamp;
  @override
  double get intervalMs;

  /// Create a copy of HeartRateReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateReadingImplCopyWith<_$HeartRateReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HeartRateSession {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  HeartRateType get type => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  List<HeartRateReading> get readings => throw _privateConstructorUsedError;
  int? get averageBpm => throw _privateConstructorUsedError;
  int? get minBpm => throw _privateConstructorUsedError;
  int? get maxBpm => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of HeartRateSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateSessionCopyWith<HeartRateSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateSessionCopyWith<$Res> {
  factory $HeartRateSessionCopyWith(
    HeartRateSession value,
    $Res Function(HeartRateSession) then,
  ) = _$HeartRateSessionCopyWithImpl<$Res, HeartRateSession>;
  @useResult
  $Res call({
    String id,
    String userId,
    HeartRateType type,
    DateTime startTime,
    DateTime? endTime,
    int durationSeconds,
    List<HeartRateReading> readings,
    int? averageBpm,
    int? minBpm,
    int? maxBpm,
    String? notes,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$HeartRateSessionCopyWithImpl<$Res, $Val extends HeartRateSession>
    implements $HeartRateSessionCopyWith<$Res> {
  _$HeartRateSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationSeconds = null,
    Object? readings = null,
    Object? averageBpm = freezed,
    Object? minBpm = freezed,
    Object? maxBpm = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as HeartRateType,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            durationSeconds: null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            readings: null == readings
                ? _value.readings
                : readings // ignore: cast_nullable_to_non_nullable
                      as List<HeartRateReading>,
            averageBpm: freezed == averageBpm
                ? _value.averageBpm
                : averageBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            minBpm: freezed == minBpm
                ? _value.minBpm
                : minBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxBpm: freezed == maxBpm
                ? _value.maxBpm
                : maxBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HeartRateSessionImplCopyWith<$Res>
    implements $HeartRateSessionCopyWith<$Res> {
  factory _$$HeartRateSessionImplCopyWith(
    _$HeartRateSessionImpl value,
    $Res Function(_$HeartRateSessionImpl) then,
  ) = __$$HeartRateSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    HeartRateType type,
    DateTime startTime,
    DateTime? endTime,
    int durationSeconds,
    List<HeartRateReading> readings,
    int? averageBpm,
    int? minBpm,
    int? maxBpm,
    String? notes,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$HeartRateSessionImplCopyWithImpl<$Res>
    extends _$HeartRateSessionCopyWithImpl<$Res, _$HeartRateSessionImpl>
    implements _$$HeartRateSessionImplCopyWith<$Res> {
  __$$HeartRateSessionImplCopyWithImpl(
    _$HeartRateSessionImpl _value,
    $Res Function(_$HeartRateSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationSeconds = null,
    Object? readings = null,
    Object? averageBpm = freezed,
    Object? minBpm = freezed,
    Object? maxBpm = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$HeartRateSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HeartRateType,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        readings: null == readings
            ? _value._readings
            : readings // ignore: cast_nullable_to_non_nullable
                  as List<HeartRateReading>,
        averageBpm: freezed == averageBpm
            ? _value.averageBpm
            : averageBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        minBpm: freezed == minBpm
            ? _value.minBpm
            : minBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxBpm: freezed == maxBpm
            ? _value.maxBpm
            : maxBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateSessionImpl extends _HeartRateSession {
  const _$HeartRateSessionImpl({
    required this.id,
    required this.userId,
    required this.type,
    required this.startTime,
    this.endTime,
    required this.durationSeconds,
    final List<HeartRateReading> readings = const [],
    this.averageBpm,
    this.minBpm,
    this.maxBpm,
    this.notes,
    required this.createdAt,
    this.updatedAt,
  }) : _readings = readings,
       super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final HeartRateType type;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final int durationSeconds;
  final List<HeartRateReading> _readings;
  @override
  @JsonKey()
  List<HeartRateReading> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  final int? averageBpm;
  @override
  final int? minBpm;
  @override
  final int? maxBpm;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'HeartRateSession(id: $id, userId: $userId, type: $type, startTime: $startTime, endTime: $endTime, durationSeconds: $durationSeconds, readings: $readings, averageBpm: $averageBpm, minBpm: $minBpm, maxBpm: $maxBpm, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.averageBpm, averageBpm) ||
                other.averageBpm == averageBpm) &&
            (identical(other.minBpm, minBpm) || other.minBpm == minBpm) &&
            (identical(other.maxBpm, maxBpm) || other.maxBpm == maxBpm) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    type,
    startTime,
    endTime,
    durationSeconds,
    const DeepCollectionEquality().hash(_readings),
    averageBpm,
    minBpm,
    maxBpm,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of HeartRateSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateSessionImplCopyWith<_$HeartRateSessionImpl> get copyWith =>
      __$$HeartRateSessionImplCopyWithImpl<_$HeartRateSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _HeartRateSession extends HeartRateSession {
  const factory _HeartRateSession({
    required final String id,
    required final String userId,
    required final HeartRateType type,
    required final DateTime startTime,
    final DateTime? endTime,
    required final int durationSeconds,
    final List<HeartRateReading> readings,
    final int? averageBpm,
    final int? minBpm,
    final int? maxBpm,
    final String? notes,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$HeartRateSessionImpl;
  const _HeartRateSession._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  HeartRateType get type;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  int get durationSeconds;
  @override
  List<HeartRateReading> get readings;
  @override
  int? get averageBpm;
  @override
  int? get minBpm;
  @override
  int? get maxBpm;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of HeartRateSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateSessionImplCopyWith<_$HeartRateSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HeartRateStats {
  double get averageBpm => throw _privateConstructorUsedError;
  int get minBpm => throw _privateConstructorUsedError;
  int get maxBpm => throw _privateConstructorUsedError;
  int? get restingBpm => throw _privateConstructorUsedError;
  CustomDateTimeRange get dateRange => throw _privateConstructorUsedError;
  int get readingsCount => throw _privateConstructorUsedError;

  /// Create a copy of HeartRateStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateStatsCopyWith<HeartRateStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateStatsCopyWith<$Res> {
  factory $HeartRateStatsCopyWith(
    HeartRateStats value,
    $Res Function(HeartRateStats) then,
  ) = _$HeartRateStatsCopyWithImpl<$Res, HeartRateStats>;
  @useResult
  $Res call({
    double averageBpm,
    int minBpm,
    int maxBpm,
    int? restingBpm,
    CustomDateTimeRange dateRange,
    int readingsCount,
  });

  $CustomDateTimeRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class _$HeartRateStatsCopyWithImpl<$Res, $Val extends HeartRateStats>
    implements $HeartRateStatsCopyWith<$Res> {
  _$HeartRateStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageBpm = null,
    Object? minBpm = null,
    Object? maxBpm = null,
    Object? restingBpm = freezed,
    Object? dateRange = null,
    Object? readingsCount = null,
  }) {
    return _then(
      _value.copyWith(
            averageBpm: null == averageBpm
                ? _value.averageBpm
                : averageBpm // ignore: cast_nullable_to_non_nullable
                      as double,
            minBpm: null == minBpm
                ? _value.minBpm
                : minBpm // ignore: cast_nullable_to_non_nullable
                      as int,
            maxBpm: null == maxBpm
                ? _value.maxBpm
                : maxBpm // ignore: cast_nullable_to_non_nullable
                      as int,
            restingBpm: freezed == restingBpm
                ? _value.restingBpm
                : restingBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            dateRange: null == dateRange
                ? _value.dateRange
                : dateRange // ignore: cast_nullable_to_non_nullable
                      as CustomDateTimeRange,
            readingsCount: null == readingsCount
                ? _value.readingsCount
                : readingsCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of HeartRateStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomDateTimeRangeCopyWith<$Res> get dateRange {
    return $CustomDateTimeRangeCopyWith<$Res>(_value.dateRange, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HeartRateStatsImplCopyWith<$Res>
    implements $HeartRateStatsCopyWith<$Res> {
  factory _$$HeartRateStatsImplCopyWith(
    _$HeartRateStatsImpl value,
    $Res Function(_$HeartRateStatsImpl) then,
  ) = __$$HeartRateStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double averageBpm,
    int minBpm,
    int maxBpm,
    int? restingBpm,
    CustomDateTimeRange dateRange,
    int readingsCount,
  });

  @override
  $CustomDateTimeRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class __$$HeartRateStatsImplCopyWithImpl<$Res>
    extends _$HeartRateStatsCopyWithImpl<$Res, _$HeartRateStatsImpl>
    implements _$$HeartRateStatsImplCopyWith<$Res> {
  __$$HeartRateStatsImplCopyWithImpl(
    _$HeartRateStatsImpl _value,
    $Res Function(_$HeartRateStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageBpm = null,
    Object? minBpm = null,
    Object? maxBpm = null,
    Object? restingBpm = freezed,
    Object? dateRange = null,
    Object? readingsCount = null,
  }) {
    return _then(
      _$HeartRateStatsImpl(
        averageBpm: null == averageBpm
            ? _value.averageBpm
            : averageBpm // ignore: cast_nullable_to_non_nullable
                  as double,
        minBpm: null == minBpm
            ? _value.minBpm
            : minBpm // ignore: cast_nullable_to_non_nullable
                  as int,
        maxBpm: null == maxBpm
            ? _value.maxBpm
            : maxBpm // ignore: cast_nullable_to_non_nullable
                  as int,
        restingBpm: freezed == restingBpm
            ? _value.restingBpm
            : restingBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        dateRange: null == dateRange
            ? _value.dateRange
            : dateRange // ignore: cast_nullable_to_non_nullable
                  as CustomDateTimeRange,
        readingsCount: null == readingsCount
            ? _value.readingsCount
            : readingsCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$HeartRateStatsImpl implements _HeartRateStats {
  const _$HeartRateStatsImpl({
    required this.averageBpm,
    required this.minBpm,
    required this.maxBpm,
    this.restingBpm,
    required this.dateRange,
    required this.readingsCount,
  });

  @override
  final double averageBpm;
  @override
  final int minBpm;
  @override
  final int maxBpm;
  @override
  final int? restingBpm;
  @override
  final CustomDateTimeRange dateRange;
  @override
  final int readingsCount;

  @override
  String toString() {
    return 'HeartRateStats(averageBpm: $averageBpm, minBpm: $minBpm, maxBpm: $maxBpm, restingBpm: $restingBpm, dateRange: $dateRange, readingsCount: $readingsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateStatsImpl &&
            (identical(other.averageBpm, averageBpm) ||
                other.averageBpm == averageBpm) &&
            (identical(other.minBpm, minBpm) || other.minBpm == minBpm) &&
            (identical(other.maxBpm, maxBpm) || other.maxBpm == maxBpm) &&
            (identical(other.restingBpm, restingBpm) ||
                other.restingBpm == restingBpm) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.readingsCount, readingsCount) ||
                other.readingsCount == readingsCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    averageBpm,
    minBpm,
    maxBpm,
    restingBpm,
    dateRange,
    readingsCount,
  );

  /// Create a copy of HeartRateStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateStatsImplCopyWith<_$HeartRateStatsImpl> get copyWith =>
      __$$HeartRateStatsImplCopyWithImpl<_$HeartRateStatsImpl>(
        this,
        _$identity,
      );
}

abstract class _HeartRateStats implements HeartRateStats {
  const factory _HeartRateStats({
    required final double averageBpm,
    required final int minBpm,
    required final int maxBpm,
    final int? restingBpm,
    required final CustomDateTimeRange dateRange,
    required final int readingsCount,
  }) = _$HeartRateStatsImpl;

  @override
  double get averageBpm;
  @override
  int get minBpm;
  @override
  int get maxBpm;
  @override
  int? get restingBpm;
  @override
  CustomDateTimeRange get dateRange;
  @override
  int get readingsCount;

  /// Create a copy of HeartRateStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateStatsImplCopyWith<_$HeartRateStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomDateTimeRange {
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;

  /// Create a copy of CustomDateTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomDateTimeRangeCopyWith<CustomDateTimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomDateTimeRangeCopyWith<$Res> {
  factory $CustomDateTimeRangeCopyWith(
    CustomDateTimeRange value,
    $Res Function(CustomDateTimeRange) then,
  ) = _$CustomDateTimeRangeCopyWithImpl<$Res, CustomDateTimeRange>;
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class _$CustomDateTimeRangeCopyWithImpl<$Res, $Val extends CustomDateTimeRange>
    implements $CustomDateTimeRangeCopyWith<$Res> {
  _$CustomDateTimeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomDateTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null}) {
    return _then(
      _value.copyWith(
            start: null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            end: null == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomDateTimeRangeImplCopyWith<$Res>
    implements $CustomDateTimeRangeCopyWith<$Res> {
  factory _$$CustomDateTimeRangeImplCopyWith(
    _$CustomDateTimeRangeImpl value,
    $Res Function(_$CustomDateTimeRangeImpl) then,
  ) = __$$CustomDateTimeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class __$$CustomDateTimeRangeImplCopyWithImpl<$Res>
    extends _$CustomDateTimeRangeCopyWithImpl<$Res, _$CustomDateTimeRangeImpl>
    implements _$$CustomDateTimeRangeImplCopyWith<$Res> {
  __$$CustomDateTimeRangeImplCopyWithImpl(
    _$CustomDateTimeRangeImpl _value,
    $Res Function(_$CustomDateTimeRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomDateTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null}) {
    return _then(
      _$CustomDateTimeRangeImpl(
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        end: null == end
            ? _value.end
            : end // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$CustomDateTimeRangeImpl extends _CustomDateTimeRange {
  const _$CustomDateTimeRangeImpl({required this.start, required this.end})
    : super._();

  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'CustomDateTimeRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDateTimeRangeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of CustomDateTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomDateTimeRangeImplCopyWith<_$CustomDateTimeRangeImpl> get copyWith =>
      __$$CustomDateTimeRangeImplCopyWithImpl<_$CustomDateTimeRangeImpl>(
        this,
        _$identity,
      );
}

abstract class _CustomDateTimeRange extends CustomDateTimeRange {
  const factory _CustomDateTimeRange({
    required final DateTime start,
    required final DateTime end,
  }) = _$CustomDateTimeRangeImpl;
  const _CustomDateTimeRange._() : super._();

  @override
  DateTime get start;
  @override
  DateTime get end;

  /// Create a copy of CustomDateTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomDateTimeRangeImplCopyWith<_$CustomDateTimeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
