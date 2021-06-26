import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:texster/backend/equations.dart';

class DrawCurve extends CustomPainter {
  DrawCurve({required this.equation});
  final Equation equation;

  @override
  void paint(Canvas canvas, Size size) {
    Offset origin = Offset(size.width * 0.5, size.height * 0.5);
    Paint parabolaPainter = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    Paint linePaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    canvas.drawLine(
        Offset(0.0, origin.dy), Offset(size.width, origin.dy), linePaint);
    canvas.drawLine(
        Offset(origin.dx, 0.0), Offset(origin.dx, size.height), linePaint);
    canvas.drawPoints(
        PointMode.polygon, calculatePoints(size, origin), parabolaPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<Offset> calculatePoints(Size size, Offset origin) {
    List<Offset> points = [];
    double percentageWidth = size.width * .45;
    for (double i = -percentageWidth; i <= percentageWidth; i = i + 1.0) {
      double xCoor = i / 10;
      double yCoor = equation.getY(xCoor);
      double x = origin.dx + xCoor * 10;
      double y = origin.dy - yCoor * 10;
      if (y >= 0.0 && y < origin.dy * 2 && x > 0.0 && x < origin.dx * 2) {
        points.add(Offset(x, y));
      }
    }
    return points;
  }

  // Offset get vtx {
  //   double x = -b / (2 * a);
  //   double y = c - (b * b) / (4 * a);
  //   return Offset(x, y);
  // }

  // @override
  // List<Offset> calculatePoints(Size size) {
  //   List<Offset> points = [];
  //   double percentWidth = size.width * 0.4;
  //   for (double i = -percentWidth; i <= percentWidth; i = i + 10) {
  //     double xCoor = origin.dx + i;
  //     double y = (a * i * i) + (b * i * 800 + c * 80 * 10);
  //     double yCoor = origin.dy - y / 80;
  //     if (yCoor >= 0.0 && yCoor <= origin.dy * 2) {
  //       points.add(Offset(xCoor, yCoor));
  //     }
  //     //points.add(Offset((size.width * .5 + i), (size.height * 0.5 - y) / 80));
  //     //print('$xCoor, $yCoor');
  //   }
  //   return points;
  // }
}
