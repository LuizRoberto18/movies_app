import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double _radius;
  final double _strokeWidth;
  final Gradient _gradient;

  GradientPainter({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
  })  : _strokeWidth = strokeWidth,
        _radius = radius,
        _gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // cria retângulo externo igual ao tamanho
    Rect outerRect = Offset.zero & size;
    final outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(_radius),
    );
    // cria retângulo interno menor por strokeWidth
    Rect innerRect =
        Rect.fromLTWH(_strokeWidth, _strokeWidth, size.width - _strokeWidth * 2, size.height - _strokeWidth * 2);
    final innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(_radius - _strokeWidth));

    // aplica sombreador de gradiente
    _paint.shader = _gradient.createShader(outerRect);

    // cria diferença entre caminhos internos e externos e desenha
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => oldDelegate != this;
}
