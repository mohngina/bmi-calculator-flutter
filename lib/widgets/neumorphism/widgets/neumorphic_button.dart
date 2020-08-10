import 'package:flutter/material.dart';

import '../neumorphism.dart';

class NeumorphicButton extends StatefulWidget {
  final child;
  final badge;
  final pressed;
  final style;
  final Function onTap;

  const NeumorphicButton({
    this.child,
    this.badge,
    this.onTap,
    this.pressed: false,
    this.style: const NeumorphicStyle(padding: EdgeInsets.all(9.0)),
  });

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState(
        child: child,
        badge: badge,
        pressed: pressed,
        onTap: onTap,
        style: style,
      );
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool pressed;
  final child;
  final badge;
  final Function onTap;
  final NeumorphicStyle style;

  _NeumorphicButtonState({
    this.child,
    this.badge,
    this.pressed,
    this.onTap,
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
        GestureDetector(
          onTap: onTap,
          child: Neumorphic(
            child: child,
            pressed: pressed,
            style: style,
          ),
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
