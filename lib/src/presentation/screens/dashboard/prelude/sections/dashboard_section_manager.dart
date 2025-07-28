import 'package:fittrack_pro/src/presentation/screens/workout/workout_stats_dashboard.dart';
import 'package:flutter/material.dart';

import 'home/home_section.dart';
import 'profile/profile_section.dart';
import 'stats/stats_section.dart';

class DashboardSectionManager {
  static Widget getSectionByIndex(int index) {
    switch (index) {
      case 0:
        return const HomeSectionImpl();
      case 1:
        return const WorkoutStatsDashboard();
      case 2:
        return const StatsSectionImpl();
      case 3:
        return const ProfileSectionImpl();
      default:
        return const HomeSectionImpl();
    }
  }
}
