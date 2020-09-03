import 'package:flutter/material.dart';
import 'package:service_pap/utils/variables.dart';

class NeumorphicStyle {
  final color;
  final radius;
  final padding;
  final double width;
  // final height;
  final List<BoxShadow> shadows;

  const NeumorphicStyle({
    this.width: 20.0,
    // this.height: 20,
    this.padding: const EdgeInsets.all(5.0),
    this.radius: const BorderRadius.all(const Radius.circular(5.0)),
    this.color: appBackgroundColor,
    this.shadows: const [
      BoxShadow(
        color: Colors.white,
        offset: Offset(-3, -3),
        blurRadius: 5,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.black38,
        offset: Offset(3, 3),
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
  });
}
