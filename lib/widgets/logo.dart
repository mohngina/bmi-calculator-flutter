import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final title;

  Logo(this.title);

  @override
  Widget build(BuildContext context) {
    return Text("$title", style: TextStyle(color: Colors.black));
  }
}
