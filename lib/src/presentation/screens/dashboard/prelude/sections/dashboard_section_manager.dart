import 'package:flutter/material.dart';

import 'home/home_section.dart';
import 'profile/profile_section.dart';
import 'stats/stats_section.dart';
import 'workout/workouts_section.dart';

class DashboardSectionManager {
  static Widget getSectionByIndex(int index) {
    switch (index) {
      case 0:
        return const HomeSectionImpl();
      case 1:
        return const WorkoutSectionImpl();
      case 2:
        return const StatsSectionImpl();
      case 3:
        return const ProfileSectionImpl();
      default:
        return const HomeSectionImpl();
    }
  }
}
