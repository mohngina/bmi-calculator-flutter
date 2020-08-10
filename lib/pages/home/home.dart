import 'package:flutter/material.dart';
import 'package:service_pap/models/services_model.dart';
import 'package:service_pap/pages/home/widgets.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ServiceCategory> _serviceCategories = ServiceCategory.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CustomAppBar(title: 'Home'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            ProfileInfo(),
            SizedBox(height: 40),

            // TODO: Implement the search widget
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
              child: ServiceCategories(serviceCategories: _serviceCategories),
            ),
            // BottomNav(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
