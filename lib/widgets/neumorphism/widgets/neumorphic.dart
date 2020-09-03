import 'package:flutter/material.dart';

import '../styles.dart';

class Neumorphic extends StatefulWidget {
  final child;
  final pressed;
  final width;
  final NeumorphicStyle style;

  const Neumorphic({
    Key key,
    @required this.child,
    @required this.pressed,
    @required this.style,
    this.width,
  }) : super(key: key);

  @override
  _NeumorphicState createState() => _NeumorphicState(
      child: child, width: width, pressed: pressed, style: style);
}

class _NeumorphicState extends State<Neumorphic> {
  final child;
  final pressed;
  final width;
  final NeumorphicStyle style;

  _NeumorphicState({
    @required this.child,
    @required this.width,
    @required this.pressed,
    @required this.style,
  });

  @override
  Widget build(BuildContext context) {
    // print("Width: ${width}");
    return Container(
      padding: style.padding,
      // width: width,
      // height: style.height,
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: style.radius,
        boxShadow: style.shadows,
        gradient: pressed
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                    Colors.grey[500],
                    Colors.grey[400],
                    Colors.grey[200],
                    Colors.grey[100],
                    Colors.grey[100],
                  ],
                stops: [
                    0.1,
                    0.3,
                    0.7,
                    0.8,
                    0.9
                  ])
            : null,
      ),
      child: child,
    );
  }
}
