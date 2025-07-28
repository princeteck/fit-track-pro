import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../../../core/extensions/context_extensions.dart';

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
            Semantics(
              label: 'Profile page header',
              child: Text(
                context.l10n?.profileTitle ?? 'Profile',
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headlineSmall
                      ?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
            Semantics(
              label: 'Profile settings',
              hint: 'Tap to access profile settings',
              button: true,
              child: Container(
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
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Profile Avatar and Info
        Column(
          children: [
            // Avatar
            Semantics(
              label: 'Profile picture for Sandra Gram',
              image: true,
              child: Container(
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
            ),

            const SizedBox(height: 16),

            // Name
            Semantics(
              label: 'User name',
              child: Text(
                'Sandra Gram',
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headlineSmall
                      ?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Location
            Semantics(
              label: 'User location: Denmark, Copenhagen',
              child: Text(
                'Denmark, Copenhagen',
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Follow stats
            Semantics(
              label: 'User statistics and actions',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFollowStat('Follow', '72'),
                  const SizedBox(width: 32),
                  _buildFollowStat('Followers', '162'),
                  const SizedBox(width: 16),
                  Semantics(
                    label: 'Export profile data',
                    hint: 'Tap to export your profile information',
                    button: true,
                    child: Container(
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
                  ),
                  const SizedBox(width: 16),
                  Semantics(
                    label: 'Edit profile',
                    hint: 'Tap to edit your profile information',
                    button: true,
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFollowStat(String label, String count) {
    return Semantics(
      label: '$count $label',
      value: count,
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void _onImageError(Object exception, StackTrace? stackTrace) {
    // Handle image loading error silently
  }
}
