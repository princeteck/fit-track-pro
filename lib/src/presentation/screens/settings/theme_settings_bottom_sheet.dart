import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/ui/assets_constants.dart';
import '../../../core/di/di.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../domain/entities/theme_mode_enum.dart';
import '../../controllers/system/system_cubit.dart';

class ThemeSettingsBottomSheet extends StatefulWidget {
  const ThemeSettingsBottomSheet({super.key});

  @override
  State<ThemeSettingsBottomSheet> createState() =>
      _ThemeSettingsBottomSheetState();
}

class _ThemeSettingsBottomSheetState extends State<ThemeSettingsBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _animationController.forward();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle indicator
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          context.l10n?.themeTitle ?? 'Theme',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: SvgPicture.asset(
                            KIcons.arrowRight,
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      context.l10n?.themeDescription ??
                          'Choose your preferred theme mode',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Theme options
                  BlocBuilder<SystemCubit, SystemState>(
                    bloc: locator<SystemCubit>(),
                    builder: (context, systemState) {
                      return Column(
                        children: [
                          _ThemeOption(
                            title: context.l10n?.themeLightTitle ?? 'Light',
                            subtitle:
                                context.l10n?.themeLightSubtitle ??
                                'Use light theme',
                            icon: Icons.light_mode_outlined,
                            isSelected:
                                systemState.themeMode == AppThemeMode.light,
                            onTap: () => _selectTheme(AppThemeMode.light),
                          ),

                          _ThemeOption(
                            title: context.l10n?.themeDarkTitle ?? 'Dark',
                            subtitle:
                                context.l10n?.themeDarkSubtitle ??
                                'Use dark theme',
                            icon: Icons.dark_mode_outlined,
                            isSelected:
                                systemState.themeMode == AppThemeMode.dark,
                            onTap: () => _selectTheme(AppThemeMode.dark),
                          ),

                          _ThemeOption(
                            title: context.l10n?.themeSystemTitle ?? 'System',
                            subtitle:
                                context.l10n?.themeSystemSubtitle ??
                                'Follow system setting',
                            icon: Icons.settings_outlined,
                            isSelected:
                                systemState.themeMode == AppThemeMode.system,
                            onTap: () => _selectTheme(AppThemeMode.system),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectTheme(AppThemeMode themeMode) async {
    try {
      await locator<SystemCubit>().setThemeMode(themeMode);

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to change theme: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline.withValues(alpha: 0.2),
                width: isSelected ? 2 : 1,
              ),
              color: isSelected
                  ? theme.colorScheme.primary.withValues(alpha: 0.05)
                  : Colors.transparent,
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? theme.colorScheme.primary.withValues(alpha: 0.1)
                        : theme.colorScheme.surface,
                  ),
                  child: Icon(
                    icon,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 24,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: theme.colorScheme.primary,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
