import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButtonPainter extends CustomPainter {
  final Animation<double> animation;
  final double borderRadius;
  final Color snakeColor;
  final double snakeWidth;

  SnakeButtonPainter({
    required this.animation,
    required this.snakeColor,
    this.borderRadius = 0.0,
    this.snakeWidth = 5.0,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    Paint paint = Paint()
      ..shader = SweepGradient(
        colors: [
          snakeColor,
          Colors.transparent,
        ],
        stops: const [1.0, 1.0],
        startAngle: 0.0,
        endAngle: vector.radians(360 * animation.value + 1),
      ).createShader(rect);

    final path = Path.combine(
      PathOperation.xor,
      Path()..addRRect(rRect),
      Path()
        ..addRRect(
          rRect.deflate(snakeWidth),
        ),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
