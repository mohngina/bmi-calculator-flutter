import 'package:flutter/material.dart';
import 'package:service_pap/models/models.dart';
import 'package:service_pap/screens/screens.dart';
import 'package:service_pap/utils/variables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Service> services = ServiceCategory.fetchAll()[0].services;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomePage(),
        // 'service': (context) => ServicesPage(),
        'profile': (context) => ProfileScreen(),
        'selected_profile': (context) => SelectedProfile(),
      },
    );
  }
}
