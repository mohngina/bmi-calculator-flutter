import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final TextInputType keyBoard;
  final FocusNode mFocusNode;

  CustomTextField({this.label, this.obscure, this.keyBoard, this.mFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // TODO: remove client-side validation errors when user enters the corrected info
      style: TextStyle(
        height: 1.0,
      ),
      focusNode: mFocusNode,
      obscureText: obscure,
      keyboardType: keyBoard,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        // contentPadding: EdgeInsets.all(15.0),
      ),
      // TODO: add custom validator for various input fields
      validator: (String value) {
        if (value.trim().isEmpty) {
          return '$label is required';
        }
        return null;
      },
      onSaved: (String value) {
        // TODO: Capture the email value
        print("$label Value: $value");
      },
    );
  }
}
