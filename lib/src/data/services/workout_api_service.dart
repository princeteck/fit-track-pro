import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/controllers/workout/workout_cubit.dart';

@singleton
class WorkoutApiService {
  static const String _mockDataPath = 'lib/src/data/mock_data/workout.json';

  Future<Map<String, dynamic>> _loadMockData() async {
    try {
      final jsonString = await rootBundle.loadString(_mockDataPath);
      return json.decode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      // Fallback to hardcoded data if file loading fails
      return _getFallbackData();
    }
  }

  Future<WorkoutStatsResponse> getWorkoutStats() async {
    final data = await _loadMockData();
    final stats = data['stats'] as Map<String, dynamic>;

    return WorkoutStatsResponse(
      totalWorkouts: stats['totalWorkouts'] as int,
      totalCalories: stats['totalCalories'] as int,
      activeMinutes: stats['activeMinutes'] as int,
      weeklyWorkouts: stats['weeklyWorkouts'] as int,
    );
  }

  Future<List<ChartDataPoint>> getWeeklyData() async {
    final data = await _loadMockData();
    final weeklyData = data['weeklyData'] as List<dynamic>;

    return weeklyData.map((item) {
      final itemMap = item as Map<String, dynamic>;
      return ChartDataPoint(
        value: (itemMap['value'] as num).toDouble(),
        label: itemMap['label'] as String,
        date: DateTime.parse(itemMap['date'] as String),
      );
    }).toList();
  }

  Future<List<WorkoutSummary>> getRecentWorkouts() async {
    final data = await _loadMockData();
    final recentWorkouts = data['recentWorkouts'] as List<dynamic>;

    return recentWorkouts.map((item) {
      final itemMap = item as Map<String, dynamic>;
      return WorkoutSummary(
        name: itemMap['name'] as String,
        duration: itemMap['duration'] as int,
        calories: itemMap['calories'] as int,
        timeAgo: itemMap['timeAgo'] as String,
        icon: _getIconFromName(itemMap['iconName'] as String),
        color: Color(int.parse(itemMap['colorValue'] as String)),
      );
    }).toList();
  }

  Future<List<WorkoutPlan>> getWorkoutPlans() async {
    final data = await _loadMockData();
    final workoutPlans = data['workoutPlans'] as List<dynamic>;

    return workoutPlans.map((item) {
      final itemMap = item as Map<String, dynamic>;
      final exercises = (itemMap['exercises'] as List<dynamic>)
          .map((ex) => WorkoutExercise.fromJson(ex as Map<String, dynamic>))
          .toList();

      return WorkoutPlan(
        id: itemMap['id'] as String,
        title: itemMap['title'] as String,
        subtitle: itemMap['subtitle'] as String,
        duration: itemMap['duration'] as String,
        calories: itemMap['calories'] as String,
        difficulty: itemMap['difficulty'] as String,
        imageAsset: itemMap['imageAsset'] as String,
        color: Color(int.parse(itemMap['colorValue'] as String)),
        exercises: exercises,
      );
    }).toList();
  }

  Future<List<SessionTemplate>> getSessionTemplates() async {
    final data = await _loadMockData();
    final templates = data['sessionTemplates'] as List<dynamic>;

    return templates.map((item) {
      final itemMap = item as Map<String, dynamic>;
      return SessionTemplate(
        id: itemMap['id'] as String,
        name: itemMap['name'] as String,
        duration: itemMap['duration'] as int,
        exercises: (itemMap['exercises'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        totalSets: itemMap['totalSets'] as int,
      );
    }).toList();
  }

  Future<UserProgress> getUserProgress() async {
    final data = await _loadMockData();
    final progress = data['userProgress'] as Map<String, dynamic>;
    final achievements = (progress['achievements'] as List<dynamic>).map((
      item,
    ) {
      final itemMap = item as Map<String, dynamic>;
      return Achievement(
        id: itemMap['id'] as String,
        name: itemMap['name'] as String,
        description: itemMap['description'] as String,
        unlockedAt: DateTime.parse(itemMap['unlockedAt'] as String),
        icon: _getIconFromName(itemMap['iconName'] as String),
      );
    }).toList();

    return UserProgress(
      currentStreak: progress['currentStreak'] as int,
      longestStreak: progress['longestStreak'] as int,
      totalSessionsCompleted: progress['totalSessionsCompleted'] as int,
      averageSessionDuration: (progress['averageSessionDuration'] as num)
          .toDouble(),
      totalCaloriesBurned: progress['totalCaloriesBurned'] as int,
      favoriteWorkoutType: progress['favoriteWorkoutType'] as String,
      weeklyGoal: progress['weeklyGoal'] as int,
      monthlyGoal: progress['monthlyGoal'] as int,
      achievements: achievements,
    );
  }

  // Simulate API delay
  Future<void> _simulateNetworkDelay() async {
    final random = math.Random();
    final delay = 300 + random.nextInt(700); // 300-1000ms
    await Future.delayed(Duration(milliseconds: delay));
  }

  Future<WorkoutStatsResponse> getWorkoutStatsWithDelay() async {
    await _simulateNetworkDelay();
    return getWorkoutStats();
  }

  Future<List<ChartDataPoint>> getWeeklyDataWithDelay() async {
    await _simulateNetworkDelay();
    return getWeeklyData();
  }

  Future<List<WorkoutSummary>> getRecentWorkoutsWithDelay() async {
    await _simulateNetworkDelay();
    return getRecentWorkouts();
  }

  IconData _getIconFromName(String iconName) {
    switch (iconName) {
      case 'directions_run':
        return Icons.directions_run;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'self_improvement':
        return Icons.self_improvement;
      case 'flash_on':
        return Icons.flash_on;
      case 'directions_bike':
        return Icons.directions_bike;
      case 'emoji_events':
        return Icons.emoji_events;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'whatshot':
        return Icons.whatshot;
      default:
        return Icons.fitness_center;
    }
  }

  Map<String, dynamic> _getFallbackData() {
    return {
      'stats': {
        'totalWorkouts': 42,
        'totalCalories': 3240,
        'activeMinutes': 1080,
        'weeklyWorkouts': 5,
      },
      'weeklyData': [
        {'value': 45.5, 'label': 'Mon', 'date': '2025-07-21T00:00:00.000Z'},
        {'value': 62.3, 'label': 'Tue', 'date': '2025-07-22T00:00:00.000Z'},
        {'value': 38.7, 'label': 'Wed', 'date': '2025-07-23T00:00:00.000Z'},
        {'value': 71.2, 'label': 'Thu', 'date': '2025-07-24T00:00:00.000Z'},
        {'value': 54.8, 'label': 'Fri', 'date': '2025-07-25T00:00:00.000Z'},
        {'value': 80.1, 'label': 'Sat', 'date': '2025-07-26T00:00:00.000Z'},
        {'value': 43.9, 'label': 'Sun', 'date': '2025-07-27T00:00:00.000Z'},
      ],
      'recentWorkouts': [
        {
          'name': 'Morning Run',
          'duration': 35,
          'calories': 280,
          'timeAgo': '2 hours ago',
          'iconName': 'directions_run',
          'colorValue': '0xFF2196F3',
        },
        {
          'name': 'Strength Training',
          'duration': 48,
          'calories': 195,
          'timeAgo': '5 hours ago',
          'iconName': 'fitness_center',
          'colorValue': '0xFFFF9800',
        },
      ],
    };
  }
}

// Data models for API responses
class WorkoutStatsResponse {
  final int totalWorkouts;
  final int totalCalories;
  final int activeMinutes;
  final int weeklyWorkouts;

  const WorkoutStatsResponse({
    required this.totalWorkouts,
    required this.totalCalories,
    required this.activeMinutes,
    required this.weeklyWorkouts,
  });
}

class WorkoutPlan {
  final String id;
  final String title;
  final String subtitle;
  final String duration;
  final String calories;
  final String difficulty;
  final String imageAsset;
  final Color color;
  final List<WorkoutExercise> exercises;

  const WorkoutPlan({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.calories,
    required this.difficulty,
    required this.imageAsset,
    required this.color,
    required this.exercises,
  });
}

class WorkoutExercise {
  final String name;
  final int sets;
  final int reps;
  final int restTime;
  final int? duration;
  final String description;

  const WorkoutExercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.restTime,
    this.duration,
    required this.description,
  });

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) {
    return WorkoutExercise(
      name: json['name'] as String,
      sets: json['sets'] as int,
      reps: json['reps'] as int,
      restTime: json['restTime'] as int,
      duration: json['duration'] as int?,
      description: json['description'] as String,
    );
  }
}

class SessionTemplate {
  final String id;
  final String name;
  final int duration;
  final List<String> exercises;
  final int totalSets;

  const SessionTemplate({
    required this.id,
    required this.name,
    required this.duration,
    required this.exercises,
    required this.totalSets,
  });
}

class UserProgress {
  final int currentStreak;
  final int longestStreak;
  final int totalSessionsCompleted;
  final double averageSessionDuration;
  final int totalCaloriesBurned;
  final String favoriteWorkoutType;
  final int weeklyGoal;
  final int monthlyGoal;
  final List<Achievement> achievements;

  const UserProgress({
    required this.currentStreak,
    required this.longestStreak,
    required this.totalSessionsCompleted,
    required this.averageSessionDuration,
    required this.totalCaloriesBurned,
    required this.favoriteWorkoutType,
    required this.weeklyGoal,
    required this.monthlyGoal,
    required this.achievements,
  });
}

class Achievement {
  final String id;
  final String name;
  final String description;
  final DateTime unlockedAt;
  final IconData icon;

  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.unlockedAt,
    required this.icon,
  });
}
