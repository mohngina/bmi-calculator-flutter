import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.label, this.obscure, this.keyBoard, this.onChange, this.validate});
  final String label;
  final bool obscure;
  final TextInputType keyBoard;
  final Function onChange;
  final Function validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      keyboardType: keyBoard,
      decoration: new InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, letterSpacing: 1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: validate,
      onChanged: onChange,
    );
  }
}
