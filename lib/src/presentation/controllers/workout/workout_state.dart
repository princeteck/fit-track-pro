part of 'workout_cubit.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(0) int totalWorkouts,
    @Default(0) int totalCalories,
    @Default(0) int activeMinutes,
    @Default(0) int weeklyWorkouts,
    @Default([]) List<ChartDataPoint> weeklyData,
    @Default([]) List<WorkoutSummary> recentWorkouts,
  }) = _WorkoutState;
}
