import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/ui/colors_constants.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;
  final double size;
  final Color? backgroundColor;
  final Color? borderColor;

  const SocialButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.size = 56.0,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: KColors.transparent,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: borderColor ?? (isDarkMode ? KColors.gray70 : KColors.gray30),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: SvgPicture.asset(iconPath, width: 24, height: 24),
          ),
        ),
      ),
    );
  }
}
