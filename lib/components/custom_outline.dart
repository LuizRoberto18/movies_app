import 'package:flutter/material.dart';
import 'package:movies_app/components/gradient_painter.dart';

class CustomOutline extends StatelessWidget {
  final Widget _child;
  final double _width;
  final double _height;
  final EdgeInsetsGeometry _padding;
  final GradientPainter _painter;

  CustomOutline({
    Key? key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required double width,
    required double height,
    required EdgeInsetsGeometry padding,
  })  : _painter = GradientPainter(gradient: gradient, radius: radius, strokeWidth: strokeWidth),
        _child = child,
        _width = width,
        _height = height,
        _padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: Container(
        width: _width,
        height: _height,
        padding: _padding,
        child: _child,
      ),
    );
  }
}
