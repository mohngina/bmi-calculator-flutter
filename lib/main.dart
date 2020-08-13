import 'package:flutter/material.dart';
import 'package:service_pap/screens/home/home_screen.dart';
import 'package:service_pap/screens/services/selected_profile_screen.dart';
import 'package:service_pap/screens/services/services_screen.dart';
import 'package:service_pap/screens/login/login_screen.dart';
import 'screens/services/services_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomePage(),
        'service': (context) => ServicesPage(),
        'selected_profile': (context) => SelectedProfile(),
      },
    );
  }
}
