import 'dart:math' as math;
import 'package:flutter/material.dart';

class ProgressRingPainter extends CustomPainter {
  final double progress;
  final double animationValue;
  final List<ProgressSegment> segments;
  final double strokeWidth;
  final Color backgroundColor;

  ProgressRingPainter({
    required this.progress,
    required this.animationValue,
    required this.segments,
    this.strokeWidth = 8.0,
    this.backgroundColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor.withValues(alpha: 0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress segments
    double startAngle = -math.pi / 2; // Start from top

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final segmentProgress = (progress * segments.length - i).clamp(0.0, 1.0);
      final animatedProgress = segmentProgress * animationValue;

      if (animatedProgress > 0) {
        final sweepAngle =
            (segment.percentage / 100) * 2 * math.pi * animatedProgress;

        final paint = Paint()
          ..shader = LinearGradient(
            colors: [segment.startColor, segment.endColor],
          ).createShader(Rect.fromCircle(center: center, radius: radius))
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
          paint,
        );
      }

      startAngle += (segment.percentage / 100) * 2 * math.pi;
    }

    // Draw center circle with glow effect
    final glowPaint = Paint()
      ..color = segments.first.endColor.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(center, radius * 0.3, glowPaint);

    final centerPaint = Paint()
      ..color = segments.first.endColor.withValues(alpha: 0.1);

    canvas.drawCircle(center, radius * 0.25, centerPaint);
  }

  @override
  bool shouldRepaint(ProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.animationValue != animationValue ||
        oldDelegate.segments != segments;
  }
}

class ProgressSegment {
  final double percentage;
  final Color startColor;
  final Color endColor;
  final String label;

  const ProgressSegment({
    required this.percentage,
    required this.startColor,
    required this.endColor,
    required this.label,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProgressSegment &&
        other.percentage == percentage &&
        other.startColor == startColor &&
        other.endColor == endColor &&
        other.label == label;
  }

  @override
  int get hashCode {
    return percentage.hashCode ^
        startColor.hashCode ^
        endColor.hashCode ^
        label.hashCode;
  }
}
