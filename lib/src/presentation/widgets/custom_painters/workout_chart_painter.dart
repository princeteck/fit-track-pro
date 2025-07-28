import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../controllers/workout/workout_cubit.dart';

class WorkoutChartPainter extends CustomPainter {
  final List<ChartDataPoint> data;
  final double animationValue;
  final ThemeData theme;

  WorkoutChartPainter({
    required this.data,
    required this.animationValue,
    required this.theme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()..style = PaintingStyle.fill;

    final padding = const EdgeInsets.all(20);
    final chartRect = Rect.fromLTWH(
      padding.left,
      padding.top,
      size.width - padding.horizontal,
      size.height - padding.vertical,
    );

    final maxValue = data.map((e) => e.value).reduce(math.max);
    final minValue = data.map((e) => e.value).reduce(math.min);
    var valueRange = maxValue - minValue;

    if (valueRange == 0) {
      valueRange = 1.0;
    }

    _drawGridLines(canvas, chartRect);

    _drawLineChart(canvas, chartRect, paint, fillPaint, minValue, valueRange);

    _drawDataPoints(canvas, chartRect, minValue, valueRange);

    _drawLabels(canvas, chartRect, size);
  }

  void _drawGridLines(Canvas canvas, Rect chartRect) {
    final gridPaint = Paint()
      ..color = theme.colorScheme.outline.withValues(alpha: 0.1)
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 4; i++) {
      final y = chartRect.top + (chartRect.height / 4) * i;
      canvas.drawLine(
        Offset(chartRect.left, y),
        Offset(chartRect.right, y),
        gridPaint,
      );
    }

    if (data.length == 1) {
      final x = chartRect.left + chartRect.width / 2;
      canvas.drawLine(
        Offset(x, chartRect.top),
        Offset(x, chartRect.bottom),
        gridPaint,
      );
    } else {
      for (int i = 0; i <= data.length - 1; i++) {
        final x = chartRect.left + (chartRect.width / (data.length - 1)) * i;
        canvas.drawLine(
          Offset(x, chartRect.top),
          Offset(x, chartRect.bottom),
          gridPaint,
        );
      }
    }
  }

  void _drawLineChart(
    Canvas canvas,
    Rect chartRect,
    Paint paint,
    Paint fillPaint,
    double minValue,
    double valueRange,
  ) {
    final points = <Offset>[];
    final animatedPoints = <Offset>[];

    for (int i = 0; i < data.length; i++) {
      final x = data.length == 1
          ? chartRect.left + chartRect.width / 2
          : chartRect.left + (chartRect.width / (data.length - 1)) * i;
      final normalizedValue = (data[i].value - minValue) / valueRange;
      final y = chartRect.bottom - (normalizedValue * chartRect.height);

      if (!x.isFinite || !y.isFinite) continue;

      points.add(Offset(x, y));

      final animatedY =
          chartRect.bottom -
          (normalizedValue * chartRect.height * animationValue);

      if (animatedY.isFinite) {
        animatedPoints.add(Offset(x, animatedY));
      }
    }

    paint.shader = LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(chartRect);

    if (animatedPoints.length > 1) {
      final path = Path();
      path.moveTo(animatedPoints.first.dx, animatedPoints.first.dy);

      for (int i = 1; i < animatedPoints.length; i++) {
        final prevPoint = animatedPoints[i - 1];
        final currentPoint = animatedPoints[i];

        final controlPoint1 = Offset(
          prevPoint.dx + (currentPoint.dx - prevPoint.dx) * 0.5,
          prevPoint.dy,
        );
        final controlPoint2 = Offset(
          prevPoint.dx + (currentPoint.dx - prevPoint.dx) * 0.5,
          currentPoint.dy,
        );

        path.cubicTo(
          controlPoint1.dx,
          controlPoint1.dy,
          controlPoint2.dx,
          controlPoint2.dy,
          currentPoint.dx,
          currentPoint.dy,
        );
      }

      canvas.drawPath(path, paint);

      final fillPath = Path.from(path);
      fillPath.lineTo(animatedPoints.last.dx, chartRect.bottom);
      fillPath.lineTo(animatedPoints.first.dx, chartRect.bottom);
      fillPath.close();

      fillPaint.shader = LinearGradient(
        colors: [
          theme.colorScheme.primary.withValues(alpha: 0.3),
          theme.colorScheme.primary.withValues(alpha: 0.05),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(chartRect);

      canvas.drawPath(fillPath, fillPaint);
    }
  }

  void _drawDataPoints(
    Canvas canvas,
    Rect chartRect,
    double minValue,
    double valueRange,
  ) {
    for (int i = 0; i < data.length; i++) {
      final x = data.length == 1
          ? chartRect.left + chartRect.width / 2
          : chartRect.left + (chartRect.width / (data.length - 1)) * i;
      final normalizedValue = (data[i].value - minValue) / valueRange;
      final y =
          chartRect.bottom -
          (normalizedValue * chartRect.height * animationValue);

      if (!x.isFinite || !y.isFinite) continue;

      final glowPaint = Paint()
        ..color = theme.colorScheme.primary.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

      canvas.drawCircle(Offset(x, y), 8, glowPaint);

      final pointPaint = Paint()
        ..color = theme.colorScheme.surface
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), 6, pointPaint);

      final innerPaint = Paint()
        ..color = theme.colorScheme.primary
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), 3, innerPaint);
    }
  }

  void _drawLabels(Canvas canvas, Rect chartRect, Size size) {
    final textStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    for (int i = 0; i < data.length; i++) {
      final x = data.length == 1
          ? chartRect.left + chartRect.width / 2
          : chartRect.left + (chartRect.width / (data.length - 1)) * i;

      final textPainter = TextPainter(
        text: TextSpan(text: data[i].label, style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      final labelY = chartRect.bottom + 10;
      final labelX = x - textPainter.width / 2;

      textPainter.paint(canvas, Offset(labelX, labelY));
    }
  }

  @override
  bool shouldRepaint(WorkoutChartPainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.animationValue != animationValue ||
        oldDelegate.theme != theme;
  }
}
