import 'package:flutter/material.dart';

import 'package:service_pap/models/models.dart';
import 'package:service_pap/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Service> services = ServiceCategory.fetchAll()[0].services;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ServicesPage(
        services: services,
      ),
    );
  }
}
