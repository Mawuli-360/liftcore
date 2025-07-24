import 'package:flutter/material.dart';
import 'dart:math' as math;

class DottedCircularProgress extends StatelessWidget {
  final double percentage;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final int segmentCount;

  const DottedCircularProgress({
    super.key,
    required this.percentage,
    this.size = 150,
    this.progressColor = Colors.yellow,
    this.backgroundColor = Colors.grey,
    this.strokeWidth = 8,
    this.segmentCount = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: RectangularCircularProgressPainter(
              percentage: percentage,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
              strokeWidth: strokeWidth,
              segmentCount: segmentCount,
            ),
          ),
          Text(
            '${percentage.toInt()}%',
            style: TextStyle(
              fontSize: size * 0.15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class RectangularCircularProgressPainter extends CustomPainter {
  final double percentage;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final int segmentCount;

  RectangularCircularProgressPainter({
    required this.percentage,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.segmentCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Calculate angle for each segment
    final double anglePerSegment = (2 * math.pi) / segmentCount;
    final double progressAngle = (percentage / 100) * 2 * math.pi;

    // Rectangle dimensions
    final double rectWidth =
        strokeWidth * 0.8; // Slightly smaller than stroke width
    final double rectHeight = strokeWidth * 1.5; // Make it more rectangular

    // Draw rectangular segments
    for (int i = 0; i < segmentCount; i++) {
      // Calculate angle for current segment (starting from top and going anticlockwise)
      final double currentAngle = -math.pi / 2 - (i * anglePerSegment);

      // Calculate position of rectangle center
      final double x = center.dx + radius * math.cos(currentAngle);
      final double y = center.dy + radius * math.sin(currentAngle);

      // Determine if this segment should be filled based on progress
      final double normalizedAngle = (i * anglePerSegment);
      final bool shouldFill = normalizedAngle <= progressAngle;

      // Choose color
      final Color segmentColor = shouldFill ? progressColor : backgroundColor;

      // Create paint for rectangle
      final Paint rectPaint = Paint()
        ..color = segmentColor
        ..style = PaintingStyle.fill;

      // Save canvas state
      canvas.save();

      // Translate to rectangle position
      canvas.translate(x, y);

      // Rotate to align with circle direction
      canvas.rotate(currentAngle + math.pi / 1);

      // Draw rectangle centered at origin
      final Rect rect = Rect.fromCenter(
        center: Offset.zero,
        width: rectWidth,
        height: rectHeight,
      );

      // Draw rounded rectangle for smoother appearance
      final RRect roundedRect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(rectWidth * 0.2),
      );

      canvas.drawRRect(roundedRect, rectPaint);

      // Restore canvas state
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is RectangularCircularProgressPainter &&
        (oldDelegate.percentage != percentage ||
            oldDelegate.progressColor != progressColor ||
            oldDelegate.backgroundColor != backgroundColor ||
            oldDelegate.strokeWidth != strokeWidth ||
            oldDelegate.segmentCount != segmentCount);
  }
}
