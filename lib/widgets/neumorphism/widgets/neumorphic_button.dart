import 'package:flutter/material.dart';
import 'package:service_pap/utils/variables.dart';

class NeumorphicButton extends StatefulWidget {
  final child;
  final badge;
  final radius;
  final pressed;
  final padding;
  final backgroundColor;
  final List<BoxShadow> shadows;

  NeumorphicButton({
    this.child,
    this.badge,
    this.pressed: false,
    this.radius: 5.0,
    this.padding: const EdgeInsets.all(8),
    this.backgroundColor: appBackgroundColor,
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

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState(
      child: child,
      badge: badge,
      radius: radius,
      pressed: pressed,
      padding: padding,
      shadows: shadows,
      backgroundColor: backgroundColor);
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  final child;
  final badge;
  final radius;
  final padding;
  final shadows;
  final backgroundColor;
  bool pressed;

  _NeumorphicButtonState({
    this.child,
    this.badge,
    this.radius,
    this.padding,
    this.pressed,
    this.shadows,
    this.backgroundColor,
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
        Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: shadows,
          ),
          child: child,
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
