import 'package:events_app/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ZigzagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = GREY_100;
    paint.style = PaintingStyle.fill;
    paintZigZag(canvas, paint, Offset(0, size.height), Offset(size.width, size.height), 49, 6);
  }

  void paintZigZag(Canvas canvas, Paint paint, Offset start, Offset end, int zigs, double width) {
    assert(zigs.isFinite);
    assert(zigs > 0);
    canvas.save();
    canvas.translate(start.dx, start.dy);
    end = end - start;
    canvas.rotate(math.atan2(end.dy, end.dx));
    final double length = end.distance;
    final double spacing = length / (zigs * 2.0);
    final Path path = Path()..moveTo(0.0, 0.0);
    for (int index = 0; index < zigs; index += 1) {
      final double x = (index * 2.0 + 1.0) * spacing;
      final double y = width * ((index % 2.0) * 2.0 - 1.0);
      path.lineTo(x, y);
    }
    path.lineTo(length, 0.0);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}