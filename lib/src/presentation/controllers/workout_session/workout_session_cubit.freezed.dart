// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutSessionState {
  bool get isActive => throw _privateConstructorUsedError;
  bool get isPaused => throw _privateConstructorUsedError;
  bool get isSessionComplete => throw _privateConstructorUsedError;
  int get elapsedTime => throw _privateConstructorUsedError;
  int get totalDurationSeconds =>
      throw _privateConstructorUsedError; // Default 30 minutes
  int get heartRate => throw _privateConstructorUsedError;
  int get caloriesBurned => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  int get currentExerciseIndex => throw _privateConstructorUsedError;
  int get currentSet => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;
  List<String> get exercises => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionStateCopyWith<WorkoutSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionStateCopyWith(
    WorkoutSessionState value,
    $Res Function(WorkoutSessionState) then,
  ) = _$WorkoutSessionStateCopyWithImpl<$Res, WorkoutSessionState>;
  @useResult
  $Res call({
    bool isActive,
    bool isPaused,
    bool isSessionComplete,
    int elapsedTime,
    int totalDurationSeconds,
    int heartRate,
    int caloriesBurned,
    double progress,
    int currentExerciseIndex,
    int currentSet,
    int totalSets,
    List<String> exercises,
    DateTime? startTime,
    DateTime? endTime,
  });
}

/// @nodoc
class _$WorkoutSessionStateCopyWithImpl<$Res, $Val extends WorkoutSessionState>
    implements $WorkoutSessionStateCopyWith<$Res> {
  _$WorkoutSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? isPaused = null,
    Object? isSessionComplete = null,
    Object? elapsedTime = null,
    Object? totalDurationSeconds = null,
    Object? heartRate = null,
    Object? caloriesBurned = null,
    Object? progress = null,
    Object? currentExerciseIndex = null,
    Object? currentSet = null,
    Object? totalSets = null,
    Object? exercises = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPaused: null == isPaused
                ? _value.isPaused
                : isPaused // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSessionComplete: null == isSessionComplete
                ? _value.isSessionComplete
                : isSessionComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            elapsedTime: null == elapsedTime
                ? _value.elapsedTime
                : elapsedTime // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDurationSeconds: null == totalDurationSeconds
                ? _value.totalDurationSeconds
                : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            heartRate: null == heartRate
                ? _value.heartRate
                : heartRate // ignore: cast_nullable_to_non_nullable
                      as int,
            caloriesBurned: null == caloriesBurned
                ? _value.caloriesBurned
                : caloriesBurned // ignore: cast_nullable_to_non_nullable
                      as int,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double,
            currentExerciseIndex: null == currentExerciseIndex
                ? _value.currentExerciseIndex
                : currentExerciseIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            currentSet: null == currentSet
                ? _value.currentSet
                : currentSet // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSets: null == totalSets
                ? _value.totalSets
                : totalSets // ignore: cast_nullable_to_non_nullable
                      as int,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionStateImplCopyWith<$Res>
    implements $WorkoutSessionStateCopyWith<$Res> {
  factory _$$WorkoutSessionStateImplCopyWith(
    _$WorkoutSessionStateImpl value,
    $Res Function(_$WorkoutSessionStateImpl) then,
  ) = __$$WorkoutSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isActive,
    bool isPaused,
    bool isSessionComplete,
    int elapsedTime,
    int totalDurationSeconds,
    int heartRate,
    int caloriesBurned,
    double progress,
    int currentExerciseIndex,
    int currentSet,
    int totalSets,
    List<String> exercises,
    DateTime? startTime,
    DateTime? endTime,
  });
}

/// @nodoc
class __$$WorkoutSessionStateImplCopyWithImpl<$Res>
    extends _$WorkoutSessionStateCopyWithImpl<$Res, _$WorkoutSessionStateImpl>
    implements _$$WorkoutSessionStateImplCopyWith<$Res> {
  __$$WorkoutSessionStateImplCopyWithImpl(
    _$WorkoutSessionStateImpl _value,
    $Res Function(_$WorkoutSessionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? isPaused = null,
    Object? isSessionComplete = null,
    Object? elapsedTime = null,
    Object? totalDurationSeconds = null,
    Object? heartRate = null,
    Object? caloriesBurned = null,
    Object? progress = null,
    Object? currentExerciseIndex = null,
    Object? currentSet = null,
    Object? totalSets = null,
    Object? exercises = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(
      _$WorkoutSessionStateImpl(
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPaused: null == isPaused
            ? _value.isPaused
            : isPaused // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSessionComplete: null == isSessionComplete
            ? _value.isSessionComplete
            : isSessionComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        elapsedTime: null == elapsedTime
            ? _value.elapsedTime
            : elapsedTime // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDurationSeconds: null == totalDurationSeconds
            ? _value.totalDurationSeconds
            : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        heartRate: null == heartRate
            ? _value.heartRate
            : heartRate // ignore: cast_nullable_to_non_nullable
                  as int,
        caloriesBurned: null == caloriesBurned
            ? _value.caloriesBurned
            : caloriesBurned // ignore: cast_nullable_to_non_nullable
                  as int,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        currentExerciseIndex: null == currentExerciseIndex
            ? _value.currentExerciseIndex
            : currentExerciseIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        currentSet: null == currentSet
            ? _value.currentSet
            : currentSet // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSets: null == totalSets
            ? _value.totalSets
            : totalSets // ignore: cast_nullable_to_non_nullable
                  as int,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutSessionStateImpl implements _WorkoutSessionState {
  const _$WorkoutSessionStateImpl({
    this.isActive = false,
    this.isPaused = false,
    this.isSessionComplete = false,
    this.elapsedTime = 0,
    this.totalDurationSeconds = 1800,
    this.heartRate = 0,
    this.caloriesBurned = 0,
    this.progress = 0.0,
    this.currentExerciseIndex = 0,
    this.currentSet = 1,
    this.totalSets = 3,
    final List<String> exercises = const [
      'Push-ups',
      'Squats',
      'Planks',
      'Jumping Jacks',
      'Burpees',
    ],
    this.startTime,
    this.endTime,
  }) : _exercises = exercises;

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isPaused;
  @override
  @JsonKey()
  final bool isSessionComplete;
  @override
  @JsonKey()
  final int elapsedTime;
  @override
  @JsonKey()
  final int totalDurationSeconds;
  // Default 30 minutes
  @override
  @JsonKey()
  final int heartRate;
  @override
  @JsonKey()
  final int caloriesBurned;
  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final int currentExerciseIndex;
  @override
  @JsonKey()
  final int currentSet;
  @override
  @JsonKey()
  final int totalSets;
  final List<String> _exercises;
  @override
  @JsonKey()
  List<String> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;

  @override
  String toString() {
    return 'WorkoutSessionState(isActive: $isActive, isPaused: $isPaused, isSessionComplete: $isSessionComplete, elapsedTime: $elapsedTime, totalDurationSeconds: $totalDurationSeconds, heartRate: $heartRate, caloriesBurned: $caloriesBurned, progress: $progress, currentExerciseIndex: $currentExerciseIndex, currentSet: $currentSet, totalSets: $totalSets, exercises: $exercises, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionStateImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.isSessionComplete, isSessionComplete) ||
                other.isSessionComplete == isSessionComplete) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime) &&
            (identical(other.totalDurationSeconds, totalDurationSeconds) ||
                other.totalDurationSeconds == totalDurationSeconds) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.currentExerciseIndex, currentExerciseIndex) ||
                other.currentExerciseIndex == currentExerciseIndex) &&
            (identical(other.currentSet, currentSet) ||
                other.currentSet == currentSet) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isActive,
    isPaused,
    isSessionComplete,
    elapsedTime,
    totalDurationSeconds,
    heartRate,
    caloriesBurned,
    progress,
    currentExerciseIndex,
    currentSet,
    totalSets,
    const DeepCollectionEquality().hash(_exercises),
    startTime,
    endTime,
  );

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionStateImplCopyWith<_$WorkoutSessionStateImpl> get copyWith =>
      __$$WorkoutSessionStateImplCopyWithImpl<_$WorkoutSessionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutSessionState implements WorkoutSessionState {
  const factory _WorkoutSessionState({
    final bool isActive,
    final bool isPaused,
    final bool isSessionComplete,
    final int elapsedTime,
    final int totalDurationSeconds,
    final int heartRate,
    final int caloriesBurned,
    final double progress,
    final int currentExerciseIndex,
    final int currentSet,
    final int totalSets,
    final List<String> exercises,
    final DateTime? startTime,
    final DateTime? endTime,
  }) = _$WorkoutSessionStateImpl;

  @override
  bool get isActive;
  @override
  bool get isPaused;
  @override
  bool get isSessionComplete;
  @override
  int get elapsedTime;
  @override
  int get totalDurationSeconds; // Default 30 minutes
  @override
  int get heartRate;
  @override
  int get caloriesBurned;
  @override
  double get progress;
  @override
  int get currentExerciseIndex;
  @override
  int get currentSet;
  @override
  int get totalSets;
  @override
  List<String> get exercises;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionStateImplCopyWith<_$WorkoutSessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
