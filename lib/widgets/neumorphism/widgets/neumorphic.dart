import 'package:flutter/material.dart';

import '../styles.dart';

class Neumorphic extends StatefulWidget {
  final child;
  final pressed;
  final NeumorphicStyle style;

  const Neumorphic({
    Key key,
    @required this.child,
    @required this.pressed,
    @required this.style,
  }) : super(key: key);

  @override
  _NeumorphicState createState() =>
      _NeumorphicState(child: child, pressed: pressed, style: style);
}

class _NeumorphicState extends State<Neumorphic> {
  final child;
  final pressed;
  final NeumorphicStyle style;

  _NeumorphicState({
    @required this.child,
    @required this.pressed,
    @required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: style.shadows,
      ),
      child: child,
    );
  }
}
