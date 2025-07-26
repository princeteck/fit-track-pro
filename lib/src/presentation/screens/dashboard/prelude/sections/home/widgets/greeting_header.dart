import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/constants/ui/assets_constants.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayNumber = now.day;
    final monthName = _getMonthName(now.month);

    return Row(
      children: [
        // User Avatar
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            image: const DecorationImage(
              image: AssetImage('assets/images/user_avatar.png'),
              fit: BoxFit.cover,
              onError: _onImageError,
            ),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 24),
        ),

        const SizedBox(width: 12),

        // Greeting Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Sandra',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Today $dayNumber $monthName',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        // Search Icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
          ),
          child: Center(
            child: SvgPicture.asset(
              KIcons.search,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(Colors.grey[700]!, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  static void _onImageError(Object exception, StackTrace? stackTrace) {
    // Handle image loading error silently
  }
}
