import 'package:flutter/material.dart';

class TagPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width * 3 / 4, 0);
    path.lineTo(20, 0);
    path.lineTo(20, size.height);
    path.lineTo(size.width * 3 / 4, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
