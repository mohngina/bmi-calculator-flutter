import 'package:flutter/material.dart';

import '../neumorphism.dart';

class NeumorphicContainer extends StatefulWidget {
  final child;
  final pressed;
  final style;

  const NeumorphicContainer({
    Key key,
    @required this.child,
    this.pressed: false,
    this.style: const NeumorphicStyle(),
  }) : super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState(
      child: child, pressed: pressed, style: this.style);
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  final child;
  final bool pressed;
  final NeumorphicStyle style;

  _NeumorphicContainerState({
    @required this.child,
    @required this.pressed,
    @required this.style,
  });

  @override
  Widget build(BuildContext context) {
    // print('Width from Container: ${style.width}');
    return Neumorphic(
      child: child,
      pressed: pressed,
      style: style,
    );
  }
}
