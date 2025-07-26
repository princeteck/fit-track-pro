import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/constants/ui/assets_constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top bar with title and settings
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40), // Placeholder for balance
            Text(
              'Profile',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
              ),
              child: Center(
                child: SvgPicture.asset(
                  KIcons.setting,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    Colors.grey[700]!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Profile Avatar and Info
        Column(
          children: [
            // Avatar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                image: const DecorationImage(
                  image: AssetImage('assets/images/user_avatar.png'),
                  fit: BoxFit.cover,
                  onError: _onImageError,
                ),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 16),

            // Name
            Text(
              'Sandra Gram',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 4),

            // Location
            Text(
              'Denmark, Copenhagen',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 16),

            // Follow stats
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFollowStat('Follow', '72'),
                const SizedBox(width: 32),
                _buildFollowStat('Followers', '162'),
                const SizedBox(width: 16),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      KIcons.exportUp,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.grey[700]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      KIcons.edit,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.grey[700]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFollowStat(String label, String count) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  static void _onImageError(Object exception, StackTrace? stackTrace) {
    // Handle image loading error silently
  }
}
