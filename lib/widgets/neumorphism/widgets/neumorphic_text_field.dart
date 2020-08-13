import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class NeumorphicTextField extends StatefulWidget {
  final hint;
  final style;

  const NeumorphicTextField({
    Key key,
    this.hint,
    this.style: const NeumorphicStyle(),
  }) : super(key: key);

  @override
  _NeumorphicTextFieldState createState() =>
      _NeumorphicTextFieldState(hint: hint, style: style);
}

class _NeumorphicTextFieldState extends State<NeumorphicTextField> {
  final hint;
  final NeumorphicStyle style;

  _NeumorphicTextFieldState({
    @required this.hint,
    @required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
        NeumorphicButton(
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
