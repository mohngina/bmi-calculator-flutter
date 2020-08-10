import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/utils/functions.dart';
import 'package:service_pap/widgets/neumorphism.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: appPaddingValue,
        vertical: 20,
      ),
      child: Row(
        children: <Widget>[
          NeumorphicContainer(
            padding: EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                'https://picsum.photos/200',
                width: 70,
                height: 70,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hellow & welcome,',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Trixy'),
            ],
          ),
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  final services = [
    {'icon': Icons.settings, 'name': 'plumber', 'number': 21},
    {'icon': Icons.power, 'name': 'electrician', 'number': 14},
    {'icon': Icons.brush, 'name': 'cleaner', 'number': 7},
    {'icon': Icons.cake, 'name': 'cook', 'number': 13},
  ];

  Widget _buildServices() {
    List<Widget> _builtSerives = [];

    for (var service in services) {
      _builtSerives.add(
        NeumorphicContainer(
          child: Column(
            children: <Widget>[
              Icon(service['icon'], size: 60.0),
              SizedBox(height: 30),
              Text("${service['name']}".capitalize()),
              SizedBox(height: 10),
              Text(
                "${service['number']}",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        ),
      );

      _builtSerives.add(SizedBox(width: 20));
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(appPaddingValue),
      children: _builtSerives,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildServices();
  }
}

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appPaddingValue, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NeumorphicButton(
            child: Icon(Icons.home),
          ),
          NeumorphicButton(
            child: Icon(Icons.stop),
          ),
          NeumorphicButton(
            child: Icon(Icons.notifications),
            badge: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.red,
              ),
              child: Center(
                child: Text('9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
              ),
            ),
          ),
          NeumorphicButton(
            child: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
