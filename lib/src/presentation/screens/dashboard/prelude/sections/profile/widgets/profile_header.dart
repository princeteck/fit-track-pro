import 'package:fittrack_pro/src/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uih/uih.dart';

import '../../../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../controllers/auth/auth_cubit.dart';
import '../../../../../../controllers/base/cubit_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: locator<AuthCubit>(),
      builder: (context, authState) {
        final user = authState.user;
        String displayName = (authState.status.isLoading)
            ? 'Loading...'
            : user?.name ?? user?.email.split('@').first ?? 'User';

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Semantics(
                  label: 'Profile page header',
                  child: Text(
                    context.l10n?.profileTitle ?? 'Profile',
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
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
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        KIcons.setting,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.surfaceContainer,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            Column(
              children: [
                Semantics(
                  label: 'Profile picture for $displayName',
                  image: true,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.onSurface,
                      image: user?.photoUrl != null
                          ? DecorationImage(
                              image: NetworkImage(user!.photoUrl!),
                              fit: BoxFit.cover,
                              onError: _onImageError,
                            )
                          : const DecorationImage(
                              image: AssetImage(
                                'assets/images/user_avatar.png',
                              ),
                              fit: BoxFit.cover,
                              onError: _onImageError,
                            ),
                    ),
                    child: Icon(
                      Icons.person,
                      color: context.colorScheme.surfaceContainer,
                      size: 40,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Semantics(
                  label: 'User name',
                  child: Text(
                    displayName,
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            // color: Colors.black,
                          ),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                Semantics(
                  label: 'User location: Denmark, Copenhagen',
                  child: Text(
                    context.l10n?.denmarkCopenhagen ?? 'Denmark, Copenhagen',
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Semantics(
                  label: 'User statistics and actions',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
      },
    );
  }

  static void _onImageError(Object exception, StackTrace? stackTrace) {}
}
