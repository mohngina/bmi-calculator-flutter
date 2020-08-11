import 'package:flutter/material.dart';
import 'package:service_pap/pages/home/home.dart';
import 'package:service_pap/pages/profile/profile.dart';
import 'package:service_pap/pages/services/services.dart';
import 'package:service_pap/pages/login/login.dart';
import 'pages/services/services.dart';

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
        'profile': (context) => ProfileScreen(),
      },
    );
  }
}
