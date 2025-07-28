import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';

class HeartStatsSectionHeader extends StatefulWidget {
  final String title;
  final String value;
  final String unit;
  final VoidCallback? onTap;

  const HeartStatsSectionHeader({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    this.onTap,
  });

  @override
  State<HeartStatsSectionHeader> createState() =>
      _HeartStatsSectionHeaderState();
}

class _HeartStatsSectionHeaderState extends State<HeartStatsSectionHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 10,
      ),

      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 5),

      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 12,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 8,
      ),

      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 50),
    ]).animate(_animationController);

    _updateAnimation();
  }

  @override
  void didUpdateWidget(HeartStatsSectionHeader oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _updateAnimation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateAnimation() {
    if (widget.value.isEmpty || widget.value == '--') {
      _stopHeartbeatAnimation();
    } else {
      _startHeartbeatAnimation();
    }
  }

  void _startHeartbeatAnimation() {
    if (!_animationController.isAnimating) {
      _animationController.repeat();
    }
  }

  void _stopHeartbeatAnimation() {
    if (_animationController.isAnimating) {
      _animationController.stop();
      _animationController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFE91E63).withValues(alpha: 0.9),
            const Color(0xFFF44336).withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  textStyle: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: widget.value.isNotEmpty && widget.value != '--'
                    ? AnimatedBuilder(
                        animation: _scaleAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: SvgPicture.asset(
                              KIcons.heartSolid,
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          );
                        },
                      )
                    : SvgPicture.asset(
                        KIcons.heartSolid,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.value,
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                    ),
                  ),
                ),
                TextSpan(
                  text: ' ${widget.unit}',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Last reading: ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
            style: GoogleFonts.inter(
              textStyle: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
