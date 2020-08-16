import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final title;
  final _size = 40.0;

  Logo(this.title);

  @override
  Widget build(BuildContext context) {
    // return Text("$title", style: TextStyle(color: Colors.black));
    return Image.asset(
      'assets/logo_plain_3x.png',
      width: _size,
      height: _size,
    );
  }
}
