import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.size, this.label, this.onPress});

  final Size size;
  final Function onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          color: Colors.black,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPress),
    );
  }
}
