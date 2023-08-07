import 'package:flutter/material.dart';


class TopShadowPainter extends CustomPainter {
  final double blur_size;
  final double shadow_size;
  final color;

  TopShadowPainter({
    required this.blur_size,
    required this.shadow_size,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var _y_offset = blur_size * 2 / 5;

    final paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, blur_size);

    final path = Path()
      ..moveTo(0, _y_offset)
      ..lineTo(size.width, _y_offset)
      ..cubicTo(
          size.width, _y_offset,
          size.width, -shadow_size + _y_offset,
          size.width - shadow_size, -shadow_size + _y_offset)
      ..lineTo(shadow_size, -shadow_size + _y_offset)
      ..cubicTo(
          shadow_size, -shadow_size + _y_offset
          , 0, -shadow_size + _y_offset,
          0, _y_offset)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}