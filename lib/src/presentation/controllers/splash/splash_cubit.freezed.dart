// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SplashState {
  bool get showLogo => throw _privateConstructorUsedError;
  bool get showAppName => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  bool get dependenciesReady => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AppStartupResult? get initialRoute => throw _privateConstructorUsedError;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
    SplashState value,
    $Res Function(SplashState) then,
  ) = _$SplashStateCopyWithImpl<$Res, SplashState>;
  @useResult
  $Res call({
    bool showLogo,
    bool showAppName,
    bool isComplete,
    bool dependenciesReady,
    bool hasError,
    String errorMessage,
    AppStartupResult? initialRoute,
  });
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLogo = null,
    Object? showAppName = null,
    Object? isComplete = null,
    Object? dependenciesReady = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? initialRoute = freezed,
  }) {
    return _then(
      _value.copyWith(
            showLogo: null == showLogo
                ? _value.showLogo
                : showLogo // ignore: cast_nullable_to_non_nullable
                      as bool,
            showAppName: null == showAppName
                ? _value.showAppName
                : showAppName // ignore: cast_nullable_to_non_nullable
                      as bool,
            isComplete: null == isComplete
                ? _value.isComplete
                : isComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            dependenciesReady: null == dependenciesReady
                ? _value.dependenciesReady
                : dependenciesReady // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasError: null == hasError
                ? _value.hasError
                : hasError // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            initialRoute: freezed == initialRoute
                ? _value.initialRoute
                : initialRoute // ignore: cast_nullable_to_non_nullable
                      as AppStartupResult?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SplashStateImplCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$$SplashStateImplCopyWith(
    _$SplashStateImpl value,
    $Res Function(_$SplashStateImpl) then,
  ) = __$$SplashStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool showLogo,
    bool showAppName,
    bool isComplete,
    bool dependenciesReady,
    bool hasError,
    String errorMessage,
    AppStartupResult? initialRoute,
  });
}

/// @nodoc
class __$$SplashStateImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateImpl>
    implements _$$SplashStateImplCopyWith<$Res> {
  __$$SplashStateImplCopyWithImpl(
    _$SplashStateImpl _value,
    $Res Function(_$SplashStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLogo = null,
    Object? showAppName = null,
    Object? isComplete = null,
    Object? dependenciesReady = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? initialRoute = freezed,
  }) {
    return _then(
      _$SplashStateImpl(
        showLogo: null == showLogo
            ? _value.showLogo
            : showLogo // ignore: cast_nullable_to_non_nullable
                  as bool,
        showAppName: null == showAppName
            ? _value.showAppName
            : showAppName // ignore: cast_nullable_to_non_nullable
                  as bool,
        isComplete: null == isComplete
            ? _value.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        dependenciesReady: null == dependenciesReady
            ? _value.dependenciesReady
            : dependenciesReady // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasError: null == hasError
            ? _value.hasError
            : hasError // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        initialRoute: freezed == initialRoute
            ? _value.initialRoute
            : initialRoute // ignore: cast_nullable_to_non_nullable
                  as AppStartupResult?,
      ),
    );
  }
}

/// @nodoc

class _$SplashStateImpl implements _SplashState {
  const _$SplashStateImpl({
    this.showLogo = false,
    this.showAppName = false,
    this.isComplete = false,
    this.dependenciesReady = false,
    this.hasError = false,
    this.errorMessage = '',
    this.initialRoute,
  });

  @override
  @JsonKey()
  final bool showLogo;
  @override
  @JsonKey()
  final bool showAppName;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  @JsonKey()
  final bool dependenciesReady;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final AppStartupResult? initialRoute;

  @override
  String toString() {
    return 'SplashState(showLogo: $showLogo, showAppName: $showAppName, isComplete: $isComplete, dependenciesReady: $dependenciesReady, hasError: $hasError, errorMessage: $errorMessage, initialRoute: $initialRoute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStateImpl &&
            (identical(other.showLogo, showLogo) ||
                other.showLogo == showLogo) &&
            (identical(other.showAppName, showAppName) ||
                other.showAppName == showAppName) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.dependenciesReady, dependenciesReady) ||
                other.dependenciesReady == dependenciesReady) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.initialRoute, initialRoute) ||
                other.initialRoute == initialRoute));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    showLogo,
    showAppName,
    isComplete,
    dependenciesReady,
    hasError,
    errorMessage,
    initialRoute,
  );

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStateImplCopyWith<_$SplashStateImpl> get copyWith =>
      __$$SplashStateImplCopyWithImpl<_$SplashStateImpl>(this, _$identity);
}

abstract class _SplashState implements SplashState {
  const factory _SplashState({
    final bool showLogo,
    final bool showAppName,
    final bool isComplete,
    final bool dependenciesReady,
    final bool hasError,
    final String errorMessage,
    final AppStartupResult? initialRoute,
  }) = _$SplashStateImpl;

  @override
  bool get showLogo;
  @override
  bool get showAppName;
  @override
  bool get isComplete;
  @override
  bool get dependenciesReady;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  AppStartupResult? get initialRoute;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashStateImplCopyWith<_$SplashStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
