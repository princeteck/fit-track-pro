import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/constants/ui/assets_constants.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MenuTile(
          icon: KIcons.routing,
          title: 'Physical activity',
          subtitle: '2 days ago',
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.chart,
          title: 'Statistics',
          subtitle: 'This year: 109 kilometers',
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.routing,
          title: 'Routes',
          subtitle: '7',
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.trophy,
          title: 'Best time',
          subtitle: 'Show all',
          hasNotification: false,
          onTap: () {},
        ),
        _MenuTile(
          icon: KIcons.heart,
          title: 'Equipment',
          subtitle: 'Nike Pegasus 3000: 130.4 km',
          hasNotification: false,
          onTap: () {},
        ),
      ],
    );
  }
}

class _MenuTile extends StatefulWidget {
  final String icon;
  final String title;
  final String subtitle;
  final bool hasNotification;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.hasNotification,
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
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        widget.icon,
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

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.subtitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ),

                  // Arrow
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
    );
  }
}
