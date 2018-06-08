import 'package:flutter/material.dart';
import 'dart:math' as math;

class NotchedClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path = new Path();
    path.lineTo(0.0, size.height);


    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    Rect oval = new Rect.fromCircle(center: new Offset(size.width / 2, 0.0), radius: 15.0);
    path.addArc(oval, (math.pi/180) * 0, (math.pi/180) * 270);

    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = new Path();
    path.lineTo(0.0, size.height - 20);

    var bottomControlPoint = new Offset(size.width / 3.25, size.height);
    var bottomEndPoint = new Offset(size.width, size.height - 30.0);
    path.quadraticBezierTo(bottomControlPoint.dx, bottomControlPoint.dy,
        bottomEndPoint.dx, bottomEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 20.0);


    var bottomControlPoint2 = new Offset(size.width / 3.25, 0.0);
    var bottomEndPoint2 = new Offset(0.0, 40.0);
    path.quadraticBezierTo(bottomControlPoint2.dx, bottomControlPoint2.dy,
        bottomEndPoint2.dx, bottomEndPoint2.dy);

    path.lineTo(0.0, 40.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
