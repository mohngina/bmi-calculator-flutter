import 'package:flutter/material.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/logo.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Widget leading;

  CustomAppBar(
      {this.title: 'Pap',
      this.leading: const NeumorphicButton(
        child: Icon(Icons.menu),
      ),
      Key key})
      : preferredSize = Size.fromHeight(62.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
            leading,

            // logo
            Logo(title),

            // cart
            NeumorphicButton(child: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
