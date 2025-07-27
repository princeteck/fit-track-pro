import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.freezed.dart';

@freezed
class CubitState with _$CubitState {
  const factory CubitState.loading() = CubitStateLoading;
  const factory CubitState.loaded() = CubitStateLoaded;
  const factory CubitState.submitting() = CubitStateSubmitting;
  const factory CubitState.submitted() = CubitStateSubmitted;
  const factory CubitState.error({
    required String message,
    String? code,
    @Default(false) bool canRetry,
  }) = CubitStateError;
  const factory CubitState.initial() = CubitStateInitial;
}

/// Extension to provide convenient state checking methods
extension CubitStateX on CubitState {
  bool get isLoading => this is CubitStateLoading;
  bool get isLoaded => this is CubitStateLoaded;
  bool get isSubmitting => this is CubitStateSubmitting;
  bool get isSubmitted => this is CubitStateSubmitted;
  bool get isError => this is CubitStateError;
  bool get isInitial => this is CubitStateInitial;

  String? get errorMessage => mapOrNull(error: (state) => state.message);

  String? get errorCode => mapOrNull(error: (state) => state.code);

  bool get canRetry => mapOrNull(error: (state) => state.canRetry) ?? false;
}
