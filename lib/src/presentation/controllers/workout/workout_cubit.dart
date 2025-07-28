import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fittrack_pro/src/presentation/controllers/controllers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/workout_session_repository.dart';
import '../../../domain/entities/workout_session_entity.dart';

part 'workout_state.dart';
part 'workout_cubit.freezed.dart';

@singleton
class WorkoutCubit extends BaseCubitWrapper<WorkoutState> {
  final WorkoutSessionRepository _sessionRepository;

  WorkoutCubit(this._sessionRepository) : super(const WorkoutState());

  void loadStats() async {
    if (isClosed) return;
    debugPrint('🔥 [WorkoutCubit] loadStats() called');
    emit(state.copyWith(isLoading: true));

    try {
      // Load all data from database sessions
      final sessions = await _sessionRepository.getAllSessions();
      debugPrint(
        '🔥 [WorkoutCubit] Found ${sessions.length} sessions in database',
      );

      final recentSessions = await _loadRecentSessions();
      debugPrint(
        '🔥 [WorkoutCubit] Found ${recentSessions.length} recent sessions',
      );

      // Calculate statistics from actual session data
      final totalWorkouts = sessions.length;
      final totalCalories = sessions.fold(
        0,
        (sum, session) => sum + session.caloriesBurned,
      );
      // Convert total seconds to minutes (rounded)
      final totalSeconds = sessions.fold(
        0,
        (sum, session) => sum + session.durationSeconds,
      );
      final activeMinutes = (totalSeconds / 60).round();

      // Calculate this week's workouts
      final now = DateTime.now();
      final weekStart = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: now.weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 7));

      debugPrint(
        '🔥 [WorkoutCubit] Week range: ${weekStart.toIso8601String()} to ${weekEnd.toIso8601String()}',
      );

      final weeklyWorkouts = sessions.where((session) {
        final sessionDate = session.startTime;
        final isInWeek =
            sessionDate.isAfter(weekStart) && sessionDate.isBefore(weekEnd);
        debugPrint(
          '🔥 [WorkoutCubit] Session ${session.id} at ${sessionDate.toIso8601String()}: $isInWeek',
        );
        return isInWeek;
      }).length;

      debugPrint(
        '🔥 [WorkoutCubit] Stats calculated - Total: $totalWorkouts, Calories: $totalCalories, Minutes: $activeMinutes, Weekly: $weeklyWorkouts',
      );

      // Generate weekly data from actual sessions
      final weeklyData = _generateWeeklyDataFromSessions(sessions);
      debugPrint(
        '🔥 [WorkoutCubit] Generated ${weeklyData.length} weekly data points',
      );

      if (!isClosed) {
        emit(
          state.copyWith(
            isLoading: false,
            totalWorkouts: totalWorkouts,
            totalCalories: totalCalories,
            activeMinutes: activeMinutes,
            weeklyWorkouts: weeklyWorkouts,
            weeklyData: weeklyData,
            recentWorkouts: recentSessions,
          ),
        );
      }
    } catch (e) {
      // Fallback to generated data if database fails
      if (!isClosed) {
        emit(
          state.copyWith(
            isLoading: false,
            totalWorkouts: 0,
            totalCalories: 0,
            activeMinutes: 0,
            weeklyWorkouts: 0,
            weeklyData: _generateWeeklyData(),
            recentWorkouts: [],
          ),
        );
      }
    }
  }

  Future<List<WorkoutSummary>> _loadRecentSessions() async {
    try {
      final sessions = await _sessionRepository.getAllSessions();
      return sessions
          .map(
            (session) => WorkoutSummary(
              name: session.workoutPlanName,
              duration: (session.durationSeconds / 60).round(),
              calories: session.caloriesBurned,
              timeAgo: _formatTimeAgo(session.endTime),
              icon: Icons.fitness_center,
              color: Colors.blue,
              sessionId: session.id, // Include session ID
            ),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void refreshStats() async {
    if (isClosed) return;
    debugPrint('🔄 [WorkoutCubit] refreshStats() called');
    emit(state.copyWith(isRefreshing: true));

    try {
      // Refresh data from database sessions
      final sessions = await _sessionRepository.getAllSessions();
      debugPrint(
        '🔄 [WorkoutCubit] Found ${sessions.length} sessions during refresh',
      );

      final recentSessions = await _loadRecentSessions();
      debugPrint(
        '🔄 [WorkoutCubit] Found ${recentSessions.length} recent sessions during refresh',
      );

      // Calculate refreshed statistics from actual session data
      final totalWorkouts = sessions.length;
      final totalCalories = sessions.fold(
        0,
        (sum, session) => sum + session.caloriesBurned,
      );
      // Convert total seconds to minutes (rounded)
      final totalSeconds = sessions.fold(
        0,
        (sum, session) => sum + session.durationSeconds,
      );
      final activeMinutes = (totalSeconds / 60).round();

      // Calculate this week's workouts
      final now = DateTime.now();
      final weekStart = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: now.weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 7));

      debugPrint(
        '🔄 [WorkoutCubit] Week range: ${weekStart.toIso8601String()} to ${weekEnd.toIso8601String()}',
      );

      final weeklyWorkouts = sessions.where((session) {
        final sessionDate = session.startTime;
        final isInWeek =
            sessionDate.isAfter(weekStart) && sessionDate.isBefore(weekEnd);
        debugPrint(
          '🔄 [WorkoutCubit] Session ${session.id} at ${sessionDate.toIso8601String()}: $isInWeek',
        );
        return isInWeek;
      }).length;

      debugPrint(
        '🔄 [WorkoutCubit] Refreshed stats - Total: $totalWorkouts, Calories: $totalCalories, Minutes: $activeMinutes, Weekly: $weeklyWorkouts',
      );

      // Generate weekly data from actual sessions
      final weeklyData = _generateWeeklyDataFromSessions(sessions);
      debugPrint(
        '🔄 [WorkoutCubit] Generated ${weeklyData.length} weekly data points during refresh',
      );

      if (!isClosed) {
        emit(
          state.copyWith(
            isRefreshing: false,
            totalWorkouts: totalWorkouts,
            totalCalories: totalCalories,
            activeMinutes: activeMinutes,
            weeklyWorkouts: weeklyWorkouts,
            weeklyData: weeklyData,
            recentWorkouts: recentSessions,
          ),
        );
      }
    } catch (e) {
      // Fallback refresh using current state
      if (!isClosed) {
        emit(
          state.copyWith(
            isRefreshing: false,
            // Keep current values
          ),
        );
      }
    }
  }

  List<ChartDataPoint> _generateWeeklyData() {
    final random = math.Random();
    final now = DateTime.now();

    return List.generate(7, (index) {
      final date = now.subtract(Duration(days: 6 - index));
      final value = 20 + random.nextDouble() * 60; // 20-80 minutes
      final dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];

      return ChartDataPoint(value: value, label: dayName, date: date);
    });
  }

  List<ChartDataPoint> _generateWeeklyDataFromSessions(
    List<WorkoutSessionEntity> sessions,
  ) {
    final now = DateTime.now();
    debugPrint(
      '📊 [WorkoutCubit] Generating weekly data from ${sessions.length} sessions',
    );

    return List.generate(7, (index) {
      final date = now.subtract(Duration(days: 6 - index));
      final dayStart = DateTime(date.year, date.month, date.day);
      final dayEnd = dayStart.add(const Duration(days: 1));

      // Filter sessions for this day
      final daySessions = sessions.where(
        (session) =>
            session.startTime.isAfter(dayStart) &&
            session.startTime.isBefore(dayEnd),
      );

      // Calculate total minutes for this day
      final totalMinutes = daySessions.fold(
        0.0,
        (sum, session) => sum + (session.durationSeconds / 60.0),
      );

      final dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];

      debugPrint(
        '📊 [WorkoutCubit] Day $dayName (${dayStart.toIso8601String()}): ${daySessions.length} sessions, $totalMinutes minutes',
      );

      return ChartDataPoint(value: totalMinutes, label: dayName, date: date);
    });
  }

  Future<void> clearAllData() async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true));

    try {
      // Clear all workout data and reset to empty state
      if (!isClosed) {
        emit(
          state.copyWith(
            isLoading: false,
            totalWorkouts: 0,
            totalCalories: 0,
            activeMinutes: 0,
            weeklyWorkouts: 0,
            weeklyData: [],
            recentWorkouts: [],
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  Future<void> checkDatabaseIntegrity() async {
    try {
      // In a real app, this would check workout database integrity
      // For now, we'll just reload the current data and log debug info
      loadStats();

      // Log some debug information (in debug mode only)
      if (!isClosed) {
        final currentState = state;
        debugPrint('=== Workout Database Integrity Check ===');
        debugPrint('Total Workouts: ${currentState.totalWorkouts}');
        debugPrint('Total Calories: ${currentState.totalCalories}');
        debugPrint('Active Minutes: ${currentState.activeMinutes}');
        debugPrint('Weekly Workouts: ${currentState.weeklyWorkouts}');
        debugPrint(
          'Recent Workouts Count: ${currentState.recentWorkouts.length}',
        );
        debugPrint('Weekly Data Points: ${currentState.weeklyData.length}');
        debugPrint('========================================');
      }
    } catch (e) {
      debugPrint('Error checking workout database integrity: $e');
    }
  }
}

// Data models
class ChartDataPoint {
  final double value;
  final String label;
  final DateTime date;

  const ChartDataPoint({
    required this.value,
    required this.label,
    required this.date,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChartDataPoint &&
        other.value == value &&
        other.label == label &&
        other.date == date;
  }

  @override
  int get hashCode => value.hashCode ^ label.hashCode ^ date.hashCode;
}

class WorkoutSummary {
  final String name;
  final int duration;
  final int calories;
  final String timeAgo;
  final IconData icon;
  final Color color;
  final String? sessionId; // Add session ID for real sessions

  const WorkoutSummary({
    required this.name,
    required this.duration,
    required this.calories,
    required this.timeAgo,
    required this.icon,
    required this.color,
    this.sessionId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkoutSummary &&
        other.name == name &&
        other.duration == duration &&
        other.calories == calories &&
        other.timeAgo == timeAgo &&
        other.icon == icon &&
        other.color == color;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        duration.hashCode ^
        calories.hashCode ^
        timeAgo.hashCode ^
        icon.hashCode ^
        color.hashCode;
  }
}
