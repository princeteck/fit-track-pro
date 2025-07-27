import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A custom social media button widget that adapts to light/dark themes
///
/// Example usage:
/// ```dart
/// SocialButton(
///   iconPath: 'assets/icons/google.svg',
///   onPressed: () => _signInWithGoogle(),
/// )
/// ```
class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.size = 56.0,
  });

  final String iconPath;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A row of social media buttons
///
/// Example usage:
/// ```dart
/// SocialButtonRow(
///   onGooglePressed: () => _signInWithGoogle(),
///   onFacebookPressed: () => _signInWithFacebook(),
///   onApplePressed: () => _signInWithApple(),
/// )
/// ```
class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.onApplePressed,
    this.onInstagramPressed,
    this.spacing = 16.0,
  });

  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onApplePressed;
  final VoidCallback? onInstagramPressed;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final buttons = <Widget>[];

    if (onGooglePressed != null) {
      buttons.add(
        SocialButton(
          iconPath: 'assets/icons/google.svg',
          onPressed: onGooglePressed!,
        ),
      );
    }

    if (onFacebookPressed != null) {
      buttons.add(
        SocialButton(
          iconPath: 'assets/icons/fb.svg',
          onPressed: onFacebookPressed!,
        ),
      );
    }

    if (onApplePressed != null) {
      buttons.add(
        SocialButton(
          iconPath: 'assets/icons/apple.svg',
          onPressed: onApplePressed!,
        ),
      );
    }

    if (onInstagramPressed != null) {
      buttons.add(
        SocialButton(
          iconPath: 'assets/icons/instagram.svg',
          onPressed: onInstagramPressed!,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons
          .expand((button) => [button, SizedBox(width: spacing)])
          .take(buttons.length * 2 - 1)
          .toList(),
    );
  }
}
