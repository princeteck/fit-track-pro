import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../controllers/auth/auth_cubit.dart';
import '../../../../../../../controllers/base/cubit_state.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayNumber = now.day;
    final monthName = _getMonthName(now.month);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final user = authState.user;
        String displayName = (authState.status.isLoading)
            ? 'Loading...'
            : user?.name ?? user?.email.split('@').first ?? 'User';

        return Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                image: user?.photoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(user!.photoUrl!),
                        fit: BoxFit.cover,
                        onError: _onImageError,
                      )
                    : const DecorationImage(
                        image: AssetImage('assets/images/user_avatar.png'),
                        fit: BoxFit.cover,
                        onError: _onImageError,
                      ),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 24),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${context.l10n?.hello ?? 'Hello'}, $displayName',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${context.l10n?.today ?? 'Today'} $dayNumber $monthName',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
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
                  KIcons.search,
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
        );
      },
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

  static void _onImageError(Object exception, StackTrace? stackTrace) {}
}
