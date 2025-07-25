// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walkthrough_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WalkthroughState {
  int get currentIndex => throw _privateConstructorUsedError;
  bool get isLastSlide => throw _privateConstructorUsedError;
  bool get hasSkipped => throw _privateConstructorUsedError;
  double get backgroundGradientPosition => throw _privateConstructorUsedError;

  /// Create a copy of WalkthroughState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalkthroughStateCopyWith<WalkthroughState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkthroughStateCopyWith<$Res> {
  factory $WalkthroughStateCopyWith(
    WalkthroughState value,
    $Res Function(WalkthroughState) then,
  ) = _$WalkthroughStateCopyWithImpl<$Res, WalkthroughState>;
  @useResult
  $Res call({
    int currentIndex,
    bool isLastSlide,
    bool hasSkipped,
    double backgroundGradientPosition,
  });
}

/// @nodoc
class _$WalkthroughStateCopyWithImpl<$Res, $Val extends WalkthroughState>
    implements $WalkthroughStateCopyWith<$Res> {
  _$WalkthroughStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalkthroughState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isLastSlide = null,
    Object? hasSkipped = null,
    Object? backgroundGradientPosition = null,
  }) {
    return _then(
      _value.copyWith(
            currentIndex: null == currentIndex
                ? _value.currentIndex
                : currentIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            isLastSlide: null == isLastSlide
                ? _value.isLastSlide
                : isLastSlide // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasSkipped: null == hasSkipped
                ? _value.hasSkipped
                : hasSkipped // ignore: cast_nullable_to_non_nullable
                      as bool,
            backgroundGradientPosition: null == backgroundGradientPosition
                ? _value.backgroundGradientPosition
                : backgroundGradientPosition // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WalkthroughStateImplCopyWith<$Res>
    implements $WalkthroughStateCopyWith<$Res> {
  factory _$$WalkthroughStateImplCopyWith(
    _$WalkthroughStateImpl value,
    $Res Function(_$WalkthroughStateImpl) then,
  ) = __$$WalkthroughStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentIndex,
    bool isLastSlide,
    bool hasSkipped,
    double backgroundGradientPosition,
  });
}

/// @nodoc
class __$$WalkthroughStateImplCopyWithImpl<$Res>
    extends _$WalkthroughStateCopyWithImpl<$Res, _$WalkthroughStateImpl>
    implements _$$WalkthroughStateImplCopyWith<$Res> {
  __$$WalkthroughStateImplCopyWithImpl(
    _$WalkthroughStateImpl _value,
    $Res Function(_$WalkthroughStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalkthroughState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isLastSlide = null,
    Object? hasSkipped = null,
    Object? backgroundGradientPosition = null,
  }) {
    return _then(
      _$WalkthroughStateImpl(
        currentIndex: null == currentIndex
            ? _value.currentIndex
            : currentIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        isLastSlide: null == isLastSlide
            ? _value.isLastSlide
            : isLastSlide // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasSkipped: null == hasSkipped
            ? _value.hasSkipped
            : hasSkipped // ignore: cast_nullable_to_non_nullable
                  as bool,
        backgroundGradientPosition: null == backgroundGradientPosition
            ? _value.backgroundGradientPosition
            : backgroundGradientPosition // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$WalkthroughStateImpl implements _WalkthroughState {
  const _$WalkthroughStateImpl({
    this.currentIndex = 0,
    this.isLastSlide = false,
    this.hasSkipped = false,
    this.backgroundGradientPosition = 0.0,
  });

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final bool isLastSlide;
  @override
  @JsonKey()
  final bool hasSkipped;
  @override
  @JsonKey()
  final double backgroundGradientPosition;

  @override
  String toString() {
    return 'WalkthroughState(currentIndex: $currentIndex, isLastSlide: $isLastSlide, hasSkipped: $hasSkipped, backgroundGradientPosition: $backgroundGradientPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkthroughStateImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.isLastSlide, isLastSlide) ||
                other.isLastSlide == isLastSlide) &&
            (identical(other.hasSkipped, hasSkipped) ||
                other.hasSkipped == hasSkipped) &&
            (identical(
                  other.backgroundGradientPosition,
                  backgroundGradientPosition,
                ) ||
                other.backgroundGradientPosition ==
                    backgroundGradientPosition));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentIndex,
    isLastSlide,
    hasSkipped,
    backgroundGradientPosition,
  );

  /// Create a copy of WalkthroughState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkthroughStateImplCopyWith<_$WalkthroughStateImpl> get copyWith =>
      __$$WalkthroughStateImplCopyWithImpl<_$WalkthroughStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WalkthroughState implements WalkthroughState {
  const factory _WalkthroughState({
    final int currentIndex,
    final bool isLastSlide,
    final bool hasSkipped,
    final double backgroundGradientPosition,
  }) = _$WalkthroughStateImpl;

  @override
  int get currentIndex;
  @override
  bool get isLastSlide;
  @override
  bool get hasSkipped;
  @override
  double get backgroundGradientPosition;

  /// Create a copy of WalkthroughState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalkthroughStateImplCopyWith<_$WalkthroughStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
