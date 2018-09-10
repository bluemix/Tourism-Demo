import 'package:flutter/material.dart';
import 'dart:math' as math;

class NotchedClipper extends CustomClipper<Path> {
  NotchedClipper(
      {this.radius,
      this.topLeft = true,
      this.bottomLeft = true,
      this.bottomRight = true,
      this.topRight = true});
  final double radius;
  final bool topLeft;
  final bool bottomLeft;
  final bool bottomRight;
  final bool topRight;

  @override
  Path getClip(Size size) {
    const double radius = 7.0;

    Path path = new Path();

    if (topLeft) {
      Rect topLeftOval =
          new Rect.fromCircle(center: new Offset(0.0, 0.0), radius: radius);
      path.addArc(topLeftOval, (math.pi / 180) * 0, (math.pi / 180) * 180);
    } else {
      path.lineTo(0.0, 0.0);
    }

    if (bottomLeft) {
      path.lineTo(0.0, size.height - radius);
      path.relativeArcToPoint(new Offset(radius, radius),
          radius: const Radius.circular(radius));
      path.lineTo(size.width - radius, size.height);
    } else {
      path.lineTo(0.0, size.height);
    }

    if (bottomRight) {
      path.lineTo(size.width - radius, size.height);

      path.relativeArcToPoint(new Offset(radius * 2, 0.0),
          radius: const Radius.circular(radius));
    } else {
      path.lineTo(size.width, size.height);
    }

    if (topRight) {
      path.lineTo(size.width, size.height - radius);
      path.lineTo(size.width, radius);
      path.relativeArcToPoint(new Offset(-radius, -radius),
          radius: const Radius.circular(radius));
    } else {
      path.lineTo(size.width, 0.0);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
