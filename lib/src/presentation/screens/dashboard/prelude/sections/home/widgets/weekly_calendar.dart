import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  int selectedDay = 3; // Wednesday (0-indexed)

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            final day = weekStart.add(Duration(days: index));
            final isSelected = index == selectedDay;
            final isToday = _isSameDay(day, now);

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDay = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 40,
                height: 60,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _getDayName(day.weekday),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isSelected ? Colors.white : Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : (isToday ? Colors.black : Colors.transparent),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: isSelected
                                    ? Colors.black
                                    : (isToday ? Colors.white : Colors.black),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  String _getDayName(int weekday) {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[weekday % 7];
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
