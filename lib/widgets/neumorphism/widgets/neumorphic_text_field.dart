import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class NeumorphicTextField extends StatefulWidget {
  final hint;
  final style;
  final button;
  final focusNode;
  final Function onChanged;

  const NeumorphicTextField({
    Key key,
    this.hint,
    this.onChanged,
    this.focusNode,
    this.style: const NeumorphicStyle(),
    @required this.button,
  }) : super(key: key);

  @override
  _NeumorphicTextFieldState createState() => _NeumorphicTextFieldState(
        hint: hint,
        style: style,
        button: button,
        focusNode: focusNode,
        onChanged: onChanged,
      );
}

class _NeumorphicTextFieldState extends State<NeumorphicTextField> {
  final hint;
  final button;
  final focusNode;
  final Function onChanged;
  final NeumorphicStyle style;

  _NeumorphicTextFieldState({
    @required this.hint,
    @required this.style,
    @required this.button,
    @required this.onChanged,
    @required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: style.padding,
            child: TextField(
              onChanged: onChanged,
              focusNode: this.focusNode,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        button,
      ],
    );
  }
}
