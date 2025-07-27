import 'package:fittrack_pro/src/presentation/screens/auth/sign_in_screen.dart';
import 'package:fittrack_pro/src/presentation/screens/settings/locale_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../controllers/auth/auth_cubit.dart';
import '../../../../../../controllers/system/system_cubit.dart';

class ProfileMenuSection extends StatefulWidget {
  const ProfileMenuSection({super.key});

  @override
  State<ProfileMenuSection> createState() => _ProfileMenuSectionState();
}

class _ProfileMenuSectionState extends State<ProfileMenuSection> {
  bool _isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: context.l10n?.profileGeneral ?? 'General'),
        _MenuTile(
          icon: KIcons.setting,
          title: context.l10n?.profileNotifications ?? 'Notifications',
          subtitle: null,
          hasNotification: false,
          hasSwitch: true,
          switchValue: true,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.user,
          title: context.l10n?.profilePersonalInfo ?? 'Personal Information',
          subtitle: null,
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.documentText,
          title: context.l10n?.profileCoachContact ?? 'Coach Contact',
          subtitle: '15+',
          hasNotification: true,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.grid,
          title: context.l10n?.profileLanguage ?? 'Language',
          subtitle: context.l10n?.profileLanguageValue ?? 'English (EN)',
          hasNotification: false,
          onTap: () {
            context.push(LocaleSettingsScreen.path);
          },
        ),
        _MenuTile(
          icon: KIcons.setting,
          title: context.l10n?.profileDarkMode ?? 'Dark Mode',
          subtitle: null,
          hasNotification: false,
          hasSwitch: true,
          switchValue: true,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.chart,
          title: context.l10n?.profileLinkedDevices ?? 'Linked Devices',
          subtitle: context.l10n?.profileLinkedDevicesValue ?? 'Apple Watch',
          hasNotification: false,
          onTap: () {},
        ),

        const SizedBox(height: 24),

        _SectionHeader(
          title: context.l10n?.profileSecurityPrivacy ?? 'Security & Privacy',
          isBeta: true,
        ),
        _MenuTile(
          icon: KIcons.lockClose,
          title: context.l10n?.profileMainSecurity ?? 'Main Security',
          subtitle: null,
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.eye,
          title: context.l10n?.profileEnableBiometric ?? 'Enable Biometric',
          subtitle: null,
          hasNotification: false,
          hasSwitch: true,
          switchValue: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.documentText,
          title: context.l10n?.profilePrivacyPolicy ?? 'Privacy Policy',
          subtitle: '3+',
          hasNotification: true,
          onTap: () {},
        ),

        const SizedBox(height: 24),

        _SectionHeader(
          title: context.l10n?.profileHelpSupport ?? 'Help & Support',
        ),
        _MenuTile(
          icon: KIcons.star,
          title: context.l10n?.profileAboutUs ?? 'About Us',
          subtitle: null,
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.documentText,
          title: context.l10n?.profileHelpCenter ?? 'Help Center',
          subtitle: null,
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.edit,
          title: context.l10n?.profileSubmitFeedback ?? 'Submit Feedback',
          subtitle: null,
          hasNotification: false,
          onTap: () {},
        ),

        const SizedBox(height: 24),

        _SectionHeader(
          title: context.l10n?.profileDangerZone ?? 'Danger Zone',
          isWarning: true,
        ),
        _MenuTile(
          icon: KIcons.export,
          title: context.l10n?.profileCloseAccount ?? 'Close Account',
          subtitle: null,
          hasNotification: false,
          isDanger: true,
          onTap: () {},
        ),

        const SizedBox(height: 24),

        _SectionHeader(title: context.l10n?.profileLogOut ?? 'Log Out'),
        _MenuTile(
          icon: KIcons.arrowRight,
          title: context.l10n?.profileSignOut ?? 'Sign Out',
          subtitle: null,
          hasNotification: false,
          isLoading: _isSigningOut,
          onTap: _isSigningOut
              ? () {}
              : () {
                  _handleSignOut(context);
                },
        ),

        const SizedBox(height: 32),

        BlocBuilder<SystemCubit, SystemState>(
          bloc: locator<SystemCubit>(),
          builder: (context, systemState) {
            final systemCubit = locator<SystemCubit>();
            final currentYear = DateTime.now().year;
            final displayVersion = systemState.isLoading
                ? context.l10n?.profileLoading('...') ?? 'Loading...'
                : systemCubit.appDisplayVersion;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      KIcons.logo,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.grey[600]!,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      displayVersion,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n?.profileRightsReserved(currentYear) ??
                      '© $currentYear Rights Reserved',
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 11,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  void _handleSignOut(BuildContext context) async {
    final navigator = context.go;
    final messenger = ScaffoldMessenger.of(context);

    final shouldSignOut = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(context.l10n?.profileSignOutTitle ?? 'Sign Out'),
        content: Text(
          context.l10n?.profileSignOutMessage ??
              'Are you sure you want to sign out?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(context.l10n?.profileCancel ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(context.l10n?.profileSignOut ?? 'Sign Out'),
          ),
        ],
      ),
    );

    if (shouldSignOut == true && mounted) {
      setState(() {
        _isSigningOut = true;
      });

      try {
        final authCubit = locator<AuthCubit>();
        await authCubit.signOut();

        if (mounted) {
          navigator(SignInScreen.name);
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isSigningOut = false;
          });

          messenger.showSnackBar(
            SnackBar(
              content: Text('Sign out failed: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool isBeta;
  final bool isWarning;

  const _SectionHeader({
    required this.title,
    this.isBeta = false,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isWarning ? Colors.red[600] : Colors.grey[800],
              ),
            ),
          ),
          if (isBeta) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                context.l10n?.profileBeta ?? 'Beta',
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
          if (isWarning) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                context.l10n?.profileWarning ?? 'Warning',
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.red[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MenuTile extends StatefulWidget {
  final String icon;
  final String title;
  final String? subtitle;
  final bool hasNotification;
  final bool hasSwitch;
  final bool switchValue;
  final bool isDanger;
  final bool isLoading;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.hasNotification = false,
    this.hasSwitch = false,
    this.switchValue = false,
    this.isDanger = false,
    this.isLoading = false,
    required this.onTap,
  });

  @override
  State<_MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<_MenuTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: widget.onTap,
      child: Semantics(
        label: widget.title,
        hint: widget.subtitle != null
            ? 'Current value: ${widget.subtitle}'
            : widget.hasSwitch
            ? 'Toggle switch, currently ${widget.switchValue ? 'enabled' : 'disabled'}'
            : 'Tap to access ${widget.title}',
        button: true,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  color: widget.isDanger ? Colors.red[50] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: widget.isDanger
                      ? Border.all(color: Colors.red[200]!, width: 1)
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isDanger
                            ? Colors.red[100]
                            : Colors.grey[100],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          widget.icon,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            widget.isDanger
                                ? Colors.red[600]!
                                : Colors.grey[700]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: widget.isDanger
                                        ? Colors.red[600]
                                        : Colors.black,
                                  ),
                            ),
                          ),
                          if (widget.subtitle != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              widget.subtitle!,
                              style: GoogleFonts.inter(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    if (widget.isLoading) ...[
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.orange,
                          ),
                        ),
                      ),
                    ] else if (widget.hasNotification) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          widget.subtitle ?? '',
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],

                    if (widget.hasSwitch)
                      Semantics(
                        label: '${widget.title} toggle',
                        value: widget.switchValue ? 'Enabled' : 'Disabled',
                        child: Switch(
                          value: widget.switchValue,
                          onChanged: (bool? value) {},
                          activeColor: Colors.orange,
                          inactiveThumbColor: Colors.grey[400],
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      )
                    else if (!widget.hasNotification && !widget.isLoading)
                      SvgPicture.asset(
                        KIcons.arrowRight,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.grey[400]!,
                          BlendMode.srcIn,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
