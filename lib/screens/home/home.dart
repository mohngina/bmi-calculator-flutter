import 'package:flutter/material.dart';

import 'package:service_pap/models/services_model.dart';
import 'package:service_pap/screens/home/widgets.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/custom_app_bar.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ServiceCategory> _serviceCategories = ServiceCategory.fetchAll();
  double screenHeight;

  double _getSize(double percentage) {
    // print("ScreenHeight: $screenHeight");
    return percentage / 100 * screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CustomAppBar(title: 'Home'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          // color: Colors.red,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: _getSize(5)),
                ProfileInfo(),
                SizedBox(height: _getSize(2)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                  child: NeumorphicTextField(
                    hint: 'Search for services...',
                    button: NeumorphicButton(
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: _getSize(7)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                  child: Text(
                    'Service Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  height: 280.0,
                  child:
                      ServiceCategories(serviceCategories: _serviceCategories),
                ),
                // BottomNav(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
