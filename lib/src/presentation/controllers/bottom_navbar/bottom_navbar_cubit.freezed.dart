// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BottomNavbarState {
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isScrollingDown => throw _privateConstructorUsedError;

  /// Create a copy of BottomNavbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomNavbarStateCopyWith<BottomNavbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavbarStateCopyWith<$Res> {
  factory $BottomNavbarStateCopyWith(
    BottomNavbarState value,
    $Res Function(BottomNavbarState) then,
  ) = _$BottomNavbarStateCopyWithImpl<$Res, BottomNavbarState>;
  @useResult
  $Res call({int selectedIndex, bool isVisible, bool isScrollingDown});
}

/// @nodoc
class _$BottomNavbarStateCopyWithImpl<$Res, $Val extends BottomNavbarState>
    implements $BottomNavbarStateCopyWith<$Res> {
  _$BottomNavbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? isVisible = null,
    Object? isScrollingDown = null,
  }) {
    return _then(
      _value.copyWith(
            selectedIndex: null == selectedIndex
                ? _value.selectedIndex
                : selectedIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            isVisible: null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            isScrollingDown: null == isScrollingDown
                ? _value.isScrollingDown
                : isScrollingDown // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BottomNavbarStateImplCopyWith<$Res>
    implements $BottomNavbarStateCopyWith<$Res> {
  factory _$$BottomNavbarStateImplCopyWith(
    _$BottomNavbarStateImpl value,
    $Res Function(_$BottomNavbarStateImpl) then,
  ) = __$$BottomNavbarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex, bool isVisible, bool isScrollingDown});
}

/// @nodoc
class __$$BottomNavbarStateImplCopyWithImpl<$Res>
    extends _$BottomNavbarStateCopyWithImpl<$Res, _$BottomNavbarStateImpl>
    implements _$$BottomNavbarStateImplCopyWith<$Res> {
  __$$BottomNavbarStateImplCopyWithImpl(
    _$BottomNavbarStateImpl _value,
    $Res Function(_$BottomNavbarStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BottomNavbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? isVisible = null,
    Object? isScrollingDown = null,
  }) {
    return _then(
      _$BottomNavbarStateImpl(
        selectedIndex: null == selectedIndex
            ? _value.selectedIndex
            : selectedIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        isVisible: null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isScrollingDown: null == isScrollingDown
            ? _value.isScrollingDown
            : isScrollingDown // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$BottomNavbarStateImpl implements _BottomNavbarState {
  const _$BottomNavbarStateImpl({
    this.selectedIndex = 0,
    this.isVisible = true,
    this.isScrollingDown = false,
  });

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool isVisible;
  @override
  @JsonKey()
  final bool isScrollingDown;

  @override
  String toString() {
    return 'BottomNavbarState(selectedIndex: $selectedIndex, isVisible: $isVisible, isScrollingDown: $isScrollingDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavbarStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isScrollingDown, isScrollingDown) ||
                other.isScrollingDown == isScrollingDown));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedIndex, isVisible, isScrollingDown);

  /// Create a copy of BottomNavbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavbarStateImplCopyWith<_$BottomNavbarStateImpl> get copyWith =>
      __$$BottomNavbarStateImplCopyWithImpl<_$BottomNavbarStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BottomNavbarState implements BottomNavbarState {
  const factory _BottomNavbarState({
    final int selectedIndex,
    final bool isVisible,
    final bool isScrollingDown,
  }) = _$BottomNavbarStateImpl;

  @override
  int get selectedIndex;
  @override
  bool get isVisible;
  @override
  bool get isScrollingDown;

  /// Create a copy of BottomNavbarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomNavbarStateImplCopyWith<_$BottomNavbarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
