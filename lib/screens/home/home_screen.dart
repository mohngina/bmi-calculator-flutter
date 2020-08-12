import 'package:flutter/material.dart';
import 'package:service_pap/screens/home/widgets.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppBar(),
            SizedBox(height: 40),
            ProfileInfo(),
            SizedBox(height: 40),
            // TODO: Implement the search widget
            Expanded(child: Services()),
            // BottomNav(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
