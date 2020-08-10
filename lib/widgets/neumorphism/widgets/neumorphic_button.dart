import 'package:flutter/material.dart';

import '../neumorphism.dart';

class NeumorphicButton extends StatefulWidget {
  final child;
  final badge;
  final pressed;
  final style;

  NeumorphicButton({
    this.child,
    this.badge,
    this.pressed: false,
    this.style: const NeumorphicStyle(),
  });

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState(
        child: child,
        badge: badge,
        pressed: pressed,
        style: style,
      );
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  final child;
  final badge;
  bool pressed;
  final NeumorphicStyle style;

  _NeumorphicButtonState({
    this.child,
    this.badge,
    this.pressed,
    this.style,
  });

  Widget _buildButtonBadge() {
    Widget _builtChild = SizedBox(width: 3);

    if (badge != null) {
      _builtChild = badge;
    }

    return _builtChild;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Neumorphic(
          child: child,
          pressed: pressed,
          style: style,
        ),
        // _setButtonBadge(),
        Positioned(
          top: 0,
          right: 0,
          child: _buildButtonBadge(),
        ),
      ],
    );
  }
}
