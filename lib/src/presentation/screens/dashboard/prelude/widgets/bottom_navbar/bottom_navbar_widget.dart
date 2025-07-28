import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../controllers/bottom_navbar/bottom_navbar_cubit.dart';

class BottomNavBarWidget extends StatefulWidget {
  final Function(int)? onTabChanged;
  final ScrollController? scrollController;
  final Color backgroundColor;
  final Color activeIndicatorColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final double height;
  final double iconSize;
  final double indicatorSize;
  final Duration animationDuration;
  final Curve animationCurve;

  const BottomNavBarWidget({
    super.key,
    this.onTabChanged,
    this.scrollController,
    this.backgroundColor = Colors.black,
    this.activeIndicatorColor = Colors.white,
    this.activeIconColor = Colors.black,
    this.inactiveIconColor = Colors.white,
    this.height = 80.0,
    this.iconSize = 26.0,
    this.indicatorSize = 56.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOutCubic,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _indicatorController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _indicatorAnimation;

  double _lastScrollPosition = 0.0;
  bool _isScrollingDown = false;
  static const double _scrollThreshold = 100.0;

  final List<NavItem> _navItems = [
    NavItem(icon: KIcons.home, label: 'Home'),
    NavItem(icon: KIcons.category, label: 'Categories'),
    NavItem(icon: KIcons.chart, label: 'Stats'),
    NavItem(icon: KIcons.user, label: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupScrollListener();
  }

  void _setupAnimations() {
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _indicatorController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _slideController,
            curve: widget.animationCurve,
          ),
        );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _slideController, curve: widget.animationCurve),
    );

    _indicatorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _indicatorController,
        curve: widget.animationCurve,
      ),
    );

    _slideController.forward();
  }

  void _setupScrollListener() {
    widget.scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scrollController == null) return;

    final currentPosition = widget.scrollController!.position.pixels;
    final isScrollingDown = currentPosition > _lastScrollPosition;
    final scrollDistance = (currentPosition - _lastScrollPosition).abs();

    if (scrollDistance > 5.0) {
      if (isScrollingDown != _isScrollingDown) {
        setState(() {
          _isScrollingDown = isScrollingDown;
        });

        final shouldHide =
            isScrollingDown && currentPosition > _scrollThreshold;
        final shouldShow =
            !isScrollingDown || currentPosition <= _scrollThreshold;

        if (shouldHide && _slideController.isCompleted) {
          _slideController.reverse();
          locator<BottomNavbarCubit>().updateVisibility(false);
        } else if (shouldShow && !_slideController.isCompleted) {
          _slideController.forward();
          locator<BottomNavbarCubit>().updateVisibility(true);
        }
      }
    }

    _lastScrollPosition = currentPosition;
  }

  void _onTabTapped(int index) {
    HapticFeedback.lightImpact();

    locator<BottomNavbarCubit>().changeTab(index);
    widget.onTabChanged?.call(index);

    _indicatorController.reset();
    _indicatorController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _indicatorController.dispose();
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      bloc: locator<BottomNavbarCubit>(),
      builder: (context, state) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 24),
              child: Container(
                height: 80,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    _LiquidIndicator(
                      selectedIndex: state.selectedIndex,
                      itemCount: _navItems.length,
                      color: widget.activeIndicatorColor,
                      size: 60,
                      animationDuration: widget.animationDuration,
                      animationCurve: widget.animationCurve,
                      animation: _indicatorAnimation,
                    ),

                    Row(
                      children: _navItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        final isSelected = index == state.selectedIndex;

                        return _NavBarItem(
                          item: item,
                          isSelected: isSelected,
                          onTap: () => _onTabTapped(index),
                          activeIconColor: widget.activeIconColor,
                          inactiveIconColor: widget.inactiveIconColor,
                          iconSize: widget.iconSize,
                          animationDuration: widget.animationDuration,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LiquidIndicator extends StatelessWidget {
  final int selectedIndex;
  final int itemCount;
  final Color color;
  final double size;
  final Duration animationDuration;
  final Curve animationCurve;
  final Animation<double> animation;

  const _LiquidIndicator({
    required this.selectedIndex,
    required this.itemCount,
    required this.color,
    required this.size,
    required this.animationDuration,
    required this.animationCurve,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: animationDuration,
      curve: animationCurve,
      tween: Tween<double>(begin: 0, end: selectedIndex.toDouble()),
      builder: (context, value, child) {
        final progress = (value - value.floor()).abs();
        final isTransitioning = progress > 0.01 && progress < 0.99;
        final squeezeIntensity = isTransitioning
            ? (0.15 * (4 * progress * (1 - progress)))
            : 0.0;

        return Positioned(
          left: _calculatePosition(context, value),
          top: (80 - size) / 2,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.scale(
                scaleX: 1.0 + (squeezeIntensity * 0.3),
                scaleY: 1.0 - squeezeIntensity,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  double _calculatePosition(BuildContext context, double index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 40;
    final itemWidth = containerWidth / itemCount;
    final centerOffset = (itemWidth - size) / 2;

    return (index * itemWidth) + centerOffset;
  }
}

class _NavBarItem extends StatefulWidget {
  final NavItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final double iconSize;
  final Duration animationDuration;

  const _NavBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.activeIconColor,
    required this.inactiveIconColor,
    required this.iconSize,
    required this.animationDuration,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _bounceController.forward().then((_) {
      _bounceController.reverse();
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _handleTap,
        onTapDown: (_) => _bounceController.forward(),
        onTapCancel: () => _bounceController.reverse(),
        child: AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _bounceAnimation.value,
              child: SizedBox(
                height: 80,
                child: Center(
                  child: SvgPicture.asset(
                    widget.item.icon,
                    width: widget.iconSize,
                    height: widget.iconSize,
                    colorFilter: ColorFilter.mode(
                      widget.isSelected
                          ? widget.activeIconColor
                          : widget.inactiveIconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;

  const NavItem({required this.icon, required this.label});
}
