import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:service_pap/models/services_model.dart';
import 'package:service_pap/pages/services/services.dart';
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

class ServiceCategories extends StatelessWidget {
  final List<ServiceCategory> serviceCategories;
  final categoriesIcons = {
    'plumber': Icons.settings,
    'electrician': Icons.power,
    'cleaner': Icons.brush,
    'cook': Icons.cake,
  };

  ServiceCategories({
    Key key,
    @required this.serviceCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return _buildServices(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(appPaddingValue),
      itemCount: serviceCategories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = serviceCategories[index];

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ServicesPage(services: category.services)),
          ),
          child: Row(
            children: [
              NeumorphicContainer(
                child: Column(
                  children: <Widget>[
                    Icon(
                        categoriesIcons[category.name.toString().toLowerCase()],
                        size: 60.0),
                    SizedBox(height: 30),
                    Text("${category.name}".capitalize()),
                    SizedBox(height: 10),
                    Text(
                      "${category.services.length}",
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
              const SizedBox(width: 25.0),
            ],
          ),
        );
      },
    );
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
