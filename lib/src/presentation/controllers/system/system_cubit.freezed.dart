// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SystemState {
  String get appName => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  AppThemeMode get themeMode => throw _privateConstructorUsedError;
  AppThemeMode get currentEffectiveTheme => throw _privateConstructorUsedError;

  /// Create a copy of SystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemStateCopyWith<SystemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemStateCopyWith<$Res> {
  factory $SystemStateCopyWith(
    SystemState value,
    $Res Function(SystemState) then,
  ) = _$SystemStateCopyWithImpl<$Res, SystemState>;
  @useResult
  $Res call({
    String appName,
    String appVersion,
    String buildNumber,
    bool isLoading,
    AppThemeMode themeMode,
    AppThemeMode currentEffectiveTheme,
  });
}

/// @nodoc
class _$SystemStateCopyWithImpl<$Res, $Val extends SystemState>
    implements $SystemStateCopyWith<$Res> {
  _$SystemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? appVersion = null,
    Object? buildNumber = null,
    Object? isLoading = null,
    Object? themeMode = null,
    Object? currentEffectiveTheme = null,
  }) {
    return _then(
      _value.copyWith(
            appName: null == appName
                ? _value.appName
                : appName // ignore: cast_nullable_to_non_nullable
                      as String,
            appVersion: null == appVersion
                ? _value.appVersion
                : appVersion // ignore: cast_nullable_to_non_nullable
                      as String,
            buildNumber: null == buildNumber
                ? _value.buildNumber
                : buildNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as AppThemeMode,
            currentEffectiveTheme: null == currentEffectiveTheme
                ? _value.currentEffectiveTheme
                : currentEffectiveTheme // ignore: cast_nullable_to_non_nullable
                      as AppThemeMode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemStateImplCopyWith<$Res>
    implements $SystemStateCopyWith<$Res> {
  factory _$$SystemStateImplCopyWith(
    _$SystemStateImpl value,
    $Res Function(_$SystemStateImpl) then,
  ) = __$$SystemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String appName,
    String appVersion,
    String buildNumber,
    bool isLoading,
    AppThemeMode themeMode,
    AppThemeMode currentEffectiveTheme,
  });
}

/// @nodoc
class __$$SystemStateImplCopyWithImpl<$Res>
    extends _$SystemStateCopyWithImpl<$Res, _$SystemStateImpl>
    implements _$$SystemStateImplCopyWith<$Res> {
  __$$SystemStateImplCopyWithImpl(
    _$SystemStateImpl _value,
    $Res Function(_$SystemStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? appVersion = null,
    Object? buildNumber = null,
    Object? isLoading = null,
    Object? themeMode = null,
    Object? currentEffectiveTheme = null,
  }) {
    return _then(
      _$SystemStateImpl(
        appName: null == appName
            ? _value.appName
            : appName // ignore: cast_nullable_to_non_nullable
                  as String,
        appVersion: null == appVersion
            ? _value.appVersion
            : appVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        buildNumber: null == buildNumber
            ? _value.buildNumber
            : buildNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as AppThemeMode,
        currentEffectiveTheme: null == currentEffectiveTheme
            ? _value.currentEffectiveTheme
            : currentEffectiveTheme // ignore: cast_nullable_to_non_nullable
                  as AppThemeMode,
      ),
    );
  }
}

/// @nodoc

class _$SystemStateImpl implements _SystemState {
  const _$SystemStateImpl({
    this.appName = '',
    this.appVersion = '',
    this.buildNumber = '',
    this.isLoading = false,
    this.themeMode = AppThemeMode.system,
    this.currentEffectiveTheme = AppThemeMode.system,
  });

  @override
  @JsonKey()
  final String appName;
  @override
  @JsonKey()
  final String appVersion;
  @override
  @JsonKey()
  final String buildNumber;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final AppThemeMode themeMode;
  @override
  @JsonKey()
  final AppThemeMode currentEffectiveTheme;

  @override
  String toString() {
    return 'SystemState(appName: $appName, appVersion: $appVersion, buildNumber: $buildNumber, isLoading: $isLoading, themeMode: $themeMode, currentEffectiveTheme: $currentEffectiveTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemStateImpl &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.currentEffectiveTheme, currentEffectiveTheme) ||
                other.currentEffectiveTheme == currentEffectiveTheme));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    appName,
    appVersion,
    buildNumber,
    isLoading,
    themeMode,
    currentEffectiveTheme,
  );

  /// Create a copy of SystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemStateImplCopyWith<_$SystemStateImpl> get copyWith =>
      __$$SystemStateImplCopyWithImpl<_$SystemStateImpl>(this, _$identity);
}

abstract class _SystemState implements SystemState {
  const factory _SystemState({
    final String appName,
    final String appVersion,
    final String buildNumber,
    final bool isLoading,
    final AppThemeMode themeMode,
    final AppThemeMode currentEffectiveTheme,
  }) = _$SystemStateImpl;

  @override
  String get appName;
  @override
  String get appVersion;
  @override
  String get buildNumber;
  @override
  bool get isLoading;
  @override
  AppThemeMode get themeMode;
  @override
  AppThemeMode get currentEffectiveTheme;

  /// Create a copy of SystemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemStateImplCopyWith<_$SystemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
