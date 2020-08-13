import 'package:flutter/material.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class SelectedCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  SelectedCustomAppBar({this.title: 'Pap', Key key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: appBackgroundColor,
      iconTheme: IconThemeData(color: Colors.black),

      // widgets
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NeumorphicButton(child: Icon(Icons.arrow_back_ios)),

            Image.asset(
              'assets/logo.png',
              height: size.height * 0.07,
            ),

            // cart
            NeumorphicButton(child: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
