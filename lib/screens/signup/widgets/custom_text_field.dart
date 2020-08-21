import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final TextInputType keyBoard;
  final FocusNode mFocusNode;
  final mValidation;
  final mOnSaved;

  CustomTextField({this.label, this.obscure, this.keyBoard, this.mFocusNode, this.mValidation, this.mOnSaved});

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
      validator: mValidation,
      onSaved: (String value) {
        // save input value
        mOnSaved(value);
      },
    );
  }
}
