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
    emit(state.copyWith(isLoading: true));

    try {
      final sessions = await _sessionRepository.getAllSessions();

      final recentSessions = await _loadRecentSessions();
      final totalWorkouts = sessions.length;
      final totalCalories = sessions.fold(
        0,
        (sum, session) => sum + session.caloriesBurned,
      );

      final totalSeconds = sessions.fold(
        0,
        (sum, session) => sum + session.durationSeconds,
      );
      final activeMinutes = (totalSeconds / 60).round();

      final now = DateTime.now();
      final weekStart = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: now.weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 7));

      final weeklyWorkouts = sessions.where((session) {
        final sessionDate = session.startTime;
        final isInWeek =
            sessionDate.isAfter(weekStart) && sessionDate.isBefore(weekEnd);
        return isInWeek;
      }).length;

      final weeklyData = _generateWeeklyDataFromSessions(sessions);
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
              sessionId: session.id,
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
    emit(state.copyWith(isRefreshing: true));

    try {
      final sessions = await _sessionRepository.getAllSessions();

      final recentSessions = await _loadRecentSessions();

      final totalWorkouts = sessions.length;
      final totalCalories = sessions.fold(
        0,
        (sum, session) => sum + session.caloriesBurned,
      );

      final totalSeconds = sessions.fold(
        0,
        (sum, session) => sum + session.durationSeconds,
      );
      final activeMinutes = (totalSeconds / 60).round();

      final now = DateTime.now();
      final weekStart = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: now.weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 7));

      final weeklyWorkouts = sessions.where((session) {
        final sessionDate = session.startTime;
        final isInWeek =
            sessionDate.isAfter(weekStart) && sessionDate.isBefore(weekEnd);
        return isInWeek;
      }).length;

      final weeklyData = _generateWeeklyDataFromSessions(sessions);

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
      if (!isClosed) {
        emit(state.copyWith(isRefreshing: false));
      }
    }
  }

  void forceRefreshStats() {
    if (isClosed) return;
    debugPrint('🚀 [WorkoutCubit] Force refresh triggered');
    refreshStats();
  }

  List<ChartDataPoint> _generateWeeklyData() {
    final random = math.Random();
    final now = DateTime.now();

    return List.generate(7, (index) {
      final date = now.subtract(Duration(days: 6 - index));
      final value = 20 + random.nextDouble() * 60;
      final dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];

      return ChartDataPoint(value: value, label: dayName, date: date);
    });
  }

  List<ChartDataPoint> _generateWeeklyDataFromSessions(
    List<WorkoutSessionEntity> sessions,
  ) {
    final now = DateTime.now();

    return List.generate(7, (index) {
      final date = now.subtract(Duration(days: 6 - index));
      final dayStart = DateTime(date.year, date.month, date.day);
      final dayEnd = dayStart.add(const Duration(days: 1));

      final daySessions = sessions.where(
        (session) =>
            session.startTime.isAfter(dayStart) &&
            session.startTime.isBefore(dayEnd),
      );

      final totalMinutes = daySessions.fold(
        0.0,
        (sum, session) => sum + (session.durationSeconds / 60.0),
      );

      final dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];

      return ChartDataPoint(value: totalMinutes, label: dayName, date: date);
    });
  }

  Future<void> clearAllData() async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true));

    try {
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
      loadStats();

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
  final String? sessionId;

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
