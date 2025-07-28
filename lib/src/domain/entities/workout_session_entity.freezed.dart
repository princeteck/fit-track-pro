// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutSessionEntity _$WorkoutSessionEntityFromJson(Map<String, dynamic> json) {
  return _WorkoutSessionEntity.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSessionEntity {
  String get id => throw _privateConstructorUsedError;
  String get workoutPlanId => throw _privateConstructorUsedError;
  String get workoutPlanName => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  int get totalDurationSeconds => throw _privateConstructorUsedError;
  int get caloriesBurned => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  List<WorkoutSensorData> get sensorData => throw _privateConstructorUsedError;
  List<String> get exercisesCompleted => throw _privateConstructorUsedError;
  int get setsCompleted => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSessionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionEntityCopyWith<WorkoutSessionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionEntityCopyWith<$Res> {
  factory $WorkoutSessionEntityCopyWith(
    WorkoutSessionEntity value,
    $Res Function(WorkoutSessionEntity) then,
  ) = _$WorkoutSessionEntityCopyWithImpl<$Res, WorkoutSessionEntity>;
  @useResult
  $Res call({
    String id,
    String workoutPlanId,
    String workoutPlanName,
    DateTime startTime,
    DateTime endTime,
    int durationSeconds,
    int totalDurationSeconds,
    int caloriesBurned,
    double progress,
    List<WorkoutSensorData> sensorData,
    List<String> exercisesCompleted,
    int setsCompleted,
  });
}

/// @nodoc
class _$WorkoutSessionEntityCopyWithImpl<
  $Res,
  $Val extends WorkoutSessionEntity
>
    implements $WorkoutSessionEntityCopyWith<$Res> {
  _$WorkoutSessionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutPlanId = null,
    Object? workoutPlanName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? durationSeconds = null,
    Object? totalDurationSeconds = null,
    Object? caloriesBurned = null,
    Object? progress = null,
    Object? sensorData = null,
    Object? exercisesCompleted = null,
    Object? setsCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutPlanId: null == workoutPlanId
                ? _value.workoutPlanId
                : workoutPlanId // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutPlanName: null == workoutPlanName
                ? _value.workoutPlanName
                : workoutPlanName // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            durationSeconds: null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDurationSeconds: null == totalDurationSeconds
                ? _value.totalDurationSeconds
                : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            caloriesBurned: null == caloriesBurned
                ? _value.caloriesBurned
                : caloriesBurned // ignore: cast_nullable_to_non_nullable
                      as int,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double,
            sensorData: null == sensorData
                ? _value.sensorData
                : sensorData // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutSensorData>,
            exercisesCompleted: null == exercisesCompleted
                ? _value.exercisesCompleted
                : exercisesCompleted // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            setsCompleted: null == setsCompleted
                ? _value.setsCompleted
                : setsCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionEntityImplCopyWith<$Res>
    implements $WorkoutSessionEntityCopyWith<$Res> {
  factory _$$WorkoutSessionEntityImplCopyWith(
    _$WorkoutSessionEntityImpl value,
    $Res Function(_$WorkoutSessionEntityImpl) then,
  ) = __$$WorkoutSessionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String workoutPlanId,
    String workoutPlanName,
    DateTime startTime,
    DateTime endTime,
    int durationSeconds,
    int totalDurationSeconds,
    int caloriesBurned,
    double progress,
    List<WorkoutSensorData> sensorData,
    List<String> exercisesCompleted,
    int setsCompleted,
  });
}

/// @nodoc
class __$$WorkoutSessionEntityImplCopyWithImpl<$Res>
    extends _$WorkoutSessionEntityCopyWithImpl<$Res, _$WorkoutSessionEntityImpl>
    implements _$$WorkoutSessionEntityImplCopyWith<$Res> {
  __$$WorkoutSessionEntityImplCopyWithImpl(
    _$WorkoutSessionEntityImpl _value,
    $Res Function(_$WorkoutSessionEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutPlanId = null,
    Object? workoutPlanName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? durationSeconds = null,
    Object? totalDurationSeconds = null,
    Object? caloriesBurned = null,
    Object? progress = null,
    Object? sensorData = null,
    Object? exercisesCompleted = null,
    Object? setsCompleted = null,
  }) {
    return _then(
      _$WorkoutSessionEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutPlanId: null == workoutPlanId
            ? _value.workoutPlanId
            : workoutPlanId // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutPlanName: null == workoutPlanName
            ? _value.workoutPlanName
            : workoutPlanName // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDurationSeconds: null == totalDurationSeconds
            ? _value.totalDurationSeconds
            : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        caloriesBurned: null == caloriesBurned
            ? _value.caloriesBurned
            : caloriesBurned // ignore: cast_nullable_to_non_nullable
                  as int,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        sensorData: null == sensorData
            ? _value._sensorData
            : sensorData // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutSensorData>,
        exercisesCompleted: null == exercisesCompleted
            ? _value._exercisesCompleted
            : exercisesCompleted // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        setsCompleted: null == setsCompleted
            ? _value.setsCompleted
            : setsCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSessionEntityImpl implements _WorkoutSessionEntity {
  const _$WorkoutSessionEntityImpl({
    required this.id,
    required this.workoutPlanId,
    required this.workoutPlanName,
    required this.startTime,
    required this.endTime,
    required this.durationSeconds,
    required this.totalDurationSeconds,
    required this.caloriesBurned,
    required this.progress,
    required final List<WorkoutSensorData> sensorData,
    final List<String> exercisesCompleted = const [],
    this.setsCompleted = 0,
  }) : _sensorData = sensorData,
       _exercisesCompleted = exercisesCompleted;

  factory _$WorkoutSessionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSessionEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String workoutPlanId;
  @override
  final String workoutPlanName;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int durationSeconds;
  @override
  final int totalDurationSeconds;
  @override
  final int caloriesBurned;
  @override
  final double progress;
  final List<WorkoutSensorData> _sensorData;
  @override
  List<WorkoutSensorData> get sensorData {
    if (_sensorData is EqualUnmodifiableListView) return _sensorData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensorData);
  }

  final List<String> _exercisesCompleted;
  @override
  @JsonKey()
  List<String> get exercisesCompleted {
    if (_exercisesCompleted is EqualUnmodifiableListView)
      return _exercisesCompleted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercisesCompleted);
  }

  @override
  @JsonKey()
  final int setsCompleted;

  @override
  String toString() {
    return 'WorkoutSessionEntity(id: $id, workoutPlanId: $workoutPlanId, workoutPlanName: $workoutPlanName, startTime: $startTime, endTime: $endTime, durationSeconds: $durationSeconds, totalDurationSeconds: $totalDurationSeconds, caloriesBurned: $caloriesBurned, progress: $progress, sensorData: $sensorData, exercisesCompleted: $exercisesCompleted, setsCompleted: $setsCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutPlanId, workoutPlanId) ||
                other.workoutPlanId == workoutPlanId) &&
            (identical(other.workoutPlanName, workoutPlanName) ||
                other.workoutPlanName == workoutPlanName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.totalDurationSeconds, totalDurationSeconds) ||
                other.totalDurationSeconds == totalDurationSeconds) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality().equals(
              other._sensorData,
              _sensorData,
            ) &&
            const DeepCollectionEquality().equals(
              other._exercisesCompleted,
              _exercisesCompleted,
            ) &&
            (identical(other.setsCompleted, setsCompleted) ||
                other.setsCompleted == setsCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workoutPlanId,
    workoutPlanName,
    startTime,
    endTime,
    durationSeconds,
    totalDurationSeconds,
    caloriesBurned,
    progress,
    const DeepCollectionEquality().hash(_sensorData),
    const DeepCollectionEquality().hash(_exercisesCompleted),
    setsCompleted,
  );

  /// Create a copy of WorkoutSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionEntityImplCopyWith<_$WorkoutSessionEntityImpl>
  get copyWith =>
      __$$WorkoutSessionEntityImplCopyWithImpl<_$WorkoutSessionEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSessionEntityImplToJson(this);
  }
}

abstract class _WorkoutSessionEntity implements WorkoutSessionEntity {
  const factory _WorkoutSessionEntity({
    required final String id,
    required final String workoutPlanId,
    required final String workoutPlanName,
    required final DateTime startTime,
    required final DateTime endTime,
    required final int durationSeconds,
    required final int totalDurationSeconds,
    required final int caloriesBurned,
    required final double progress,
    required final List<WorkoutSensorData> sensorData,
    final List<String> exercisesCompleted,
    final int setsCompleted,
  }) = _$WorkoutSessionEntityImpl;

  factory _WorkoutSessionEntity.fromJson(Map<String, dynamic> json) =
      _$WorkoutSessionEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get workoutPlanId;
  @override
  String get workoutPlanName;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get durationSeconds;
  @override
  int get totalDurationSeconds;
  @override
  int get caloriesBurned;
  @override
  double get progress;
  @override
  List<WorkoutSensorData> get sensorData;
  @override
  List<String> get exercisesCompleted;
  @override
  int get setsCompleted;

  /// Create a copy of WorkoutSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionEntityImplCopyWith<_$WorkoutSessionEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WorkoutSensorData _$WorkoutSensorDataFromJson(Map<String, dynamic> json) {
  return _WorkoutSensorData.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSensorData {
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get elapsedSeconds => throw _privateConstructorUsedError;
  int get heartRate => throw _privateConstructorUsedError;
  double get calories => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  bool get isPaused => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSensorData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSensorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSensorDataCopyWith<WorkoutSensorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSensorDataCopyWith<$Res> {
  factory $WorkoutSensorDataCopyWith(
    WorkoutSensorData value,
    $Res Function(WorkoutSensorData) then,
  ) = _$WorkoutSensorDataCopyWithImpl<$Res, WorkoutSensorData>;
  @useResult
  $Res call({
    DateTime timestamp,
    int elapsedSeconds,
    int heartRate,
    double calories,
    double progress,
    bool isPaused,
  });
}

/// @nodoc
class _$WorkoutSensorDataCopyWithImpl<$Res, $Val extends WorkoutSensorData>
    implements $WorkoutSensorDataCopyWith<$Res> {
  _$WorkoutSensorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSensorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? elapsedSeconds = null,
    Object? heartRate = null,
    Object? calories = null,
    Object? progress = null,
    Object? isPaused = null,
  }) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            elapsedSeconds: null == elapsedSeconds
                ? _value.elapsedSeconds
                : elapsedSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            heartRate: null == heartRate
                ? _value.heartRate
                : heartRate // ignore: cast_nullable_to_non_nullable
                      as int,
            calories: null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as double,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double,
            isPaused: null == isPaused
                ? _value.isPaused
                : isPaused // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSensorDataImplCopyWith<$Res>
    implements $WorkoutSensorDataCopyWith<$Res> {
  factory _$$WorkoutSensorDataImplCopyWith(
    _$WorkoutSensorDataImpl value,
    $Res Function(_$WorkoutSensorDataImpl) then,
  ) = __$$WorkoutSensorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime timestamp,
    int elapsedSeconds,
    int heartRate,
    double calories,
    double progress,
    bool isPaused,
  });
}

/// @nodoc
class __$$WorkoutSensorDataImplCopyWithImpl<$Res>
    extends _$WorkoutSensorDataCopyWithImpl<$Res, _$WorkoutSensorDataImpl>
    implements _$$WorkoutSensorDataImplCopyWith<$Res> {
  __$$WorkoutSensorDataImplCopyWithImpl(
    _$WorkoutSensorDataImpl _value,
    $Res Function(_$WorkoutSensorDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSensorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? elapsedSeconds = null,
    Object? heartRate = null,
    Object? calories = null,
    Object? progress = null,
    Object? isPaused = null,
  }) {
    return _then(
      _$WorkoutSensorDataImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        elapsedSeconds: null == elapsedSeconds
            ? _value.elapsedSeconds
            : elapsedSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        heartRate: null == heartRate
            ? _value.heartRate
            : heartRate // ignore: cast_nullable_to_non_nullable
                  as int,
        calories: null == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as double,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        isPaused: null == isPaused
            ? _value.isPaused
            : isPaused // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSensorDataImpl implements _WorkoutSensorData {
  const _$WorkoutSensorDataImpl({
    required this.timestamp,
    required this.elapsedSeconds,
    required this.heartRate,
    required this.calories,
    required this.progress,
    this.isPaused = false,
  });

  factory _$WorkoutSensorDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSensorDataImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final int elapsedSeconds;
  @override
  final int heartRate;
  @override
  final double calories;
  @override
  final double progress;
  @override
  @JsonKey()
  final bool isPaused;

  @override
  String toString() {
    return 'WorkoutSensorData(timestamp: $timestamp, elapsedSeconds: $elapsedSeconds, heartRate: $heartRate, calories: $calories, progress: $progress, isPaused: $isPaused)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSensorDataImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.elapsedSeconds, elapsedSeconds) ||
                other.elapsedSeconds == elapsedSeconds) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    timestamp,
    elapsedSeconds,
    heartRate,
    calories,
    progress,
    isPaused,
  );

  /// Create a copy of WorkoutSensorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSensorDataImplCopyWith<_$WorkoutSensorDataImpl> get copyWith =>
      __$$WorkoutSensorDataImplCopyWithImpl<_$WorkoutSensorDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSensorDataImplToJson(this);
  }
}

abstract class _WorkoutSensorData implements WorkoutSensorData {
  const factory _WorkoutSensorData({
    required final DateTime timestamp,
    required final int elapsedSeconds,
    required final int heartRate,
    required final double calories,
    required final double progress,
    final bool isPaused,
  }) = _$WorkoutSensorDataImpl;

  factory _WorkoutSensorData.fromJson(Map<String, dynamic> json) =
      _$WorkoutSensorDataImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  int get elapsedSeconds;
  @override
  int get heartRate;
  @override
  double get calories;
  @override
  double get progress;
  @override
  bool get isPaused;

  /// Create a copy of WorkoutSensorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSensorDataImplCopyWith<_$WorkoutSensorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
