import 'dart:math' as math;
import 'package:flutter/material.dart';

class MorphingFabPainter extends CustomPainter {
  final double morphProgress;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isExpanded;

  MorphingFabPainter({
    required this.morphProgress,
    required this.primaryColor,
    required this.secondaryColor,
    required this.isExpanded,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [primaryColor, secondaryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final center = Offset(size.width / 2, size.height / 2);

    if (isExpanded) {
      // Draw expanded pill shape
      final expandedWidth = size.width * morphProgress;
      final expandedHeight = size.height;

      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          width: expandedWidth,
          height: expandedHeight,
        ),
        Radius.circular(expandedHeight / 2),
      );

      canvas.drawRRect(rect, paint);

      // Add ripple effect
      if (morphProgress > 0.5) {
        final ripplePaint = Paint()
          ..color = Colors.white.withValues(alpha: 0.2)
          ..style = PaintingStyle.fill;

        final rippleRadius = (morphProgress - 0.5) * 2 * size.width * 0.3;
        canvas.drawCircle(center, rippleRadius, ripplePaint);
      }
    } else {
      // Draw circular FAB
      final radius = math.min(size.width, size.height) / 2;
      canvas.drawCircle(center, radius, paint);

      // Add pulsing effect
      final pulsePaint = Paint()
        ..color = Colors.white.withValues(
          alpha: 0.1 + 0.1 * math.sin(morphProgress * math.pi * 2),
        )
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, radius * 0.8, pulsePaint);
    }

    // Draw shadow/glow effect
    final shadowPaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    if (isExpanded) {
      final shadowRect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          width: size.width * morphProgress * 0.9,
          height: size.height * 0.9,
        ),
        Radius.circular(size.height / 2),
      );

      canvas.drawRRect(shadowRect, shadowPaint);
    } else {
      canvas.drawCircle(
        center,
        math.min(size.width, size.height) / 2 * 0.9,
        shadowPaint,
      );
    }
  }

  @override
  bool shouldRepaint(MorphingFabPainter oldDelegate) {
    return oldDelegate.morphProgress != morphProgress ||
        oldDelegate.primaryColor != primaryColor ||
        oldDelegate.secondaryColor != secondaryColor ||
        oldDelegate.isExpanded != isExpanded;
  }
}
