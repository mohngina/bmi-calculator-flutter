import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:service_pap/utils/utils.dart';
import 'package:service_pap/models/models.dart';
import 'package:service_pap/screens/services/services.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class ProfileInfo extends StatelessWidget {
  final User user = User.fetchUser();

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
            style: NeumorphicStyle(
              padding: EdgeInsets.all(6.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                user.profile.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
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
              Text(user.username.toString().capitalize()),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCategories extends StatelessWidget {
  final List<ServiceCategory> serviceCategories;
  // final categoriesIcons = {
  //   'plumber': MdiIcons.waterPump,
  //   'electrician': Icons.power,
  //   'cleaner': Icons.brush,
  //   'cook': MdiIcons.cupcake,
  // };
  final categoriesIcons = {
    'plumber': 'assets/icons/plumber.png',
    'electrician': 'assets/icons/electrician.png',
    'cleaner': 'assets/icons/cleaner.png',
    'cook': 'assets/icons/laundry.png',
  };

  ServiceCategories({
    Key key,
    @required this.serviceCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => ServicesPage(
                      services: category.services,
                      itemsName: category.name,
                    )),
          ),
          child: Row(
            children: [
              NeumorphicContainer(
                style: NeumorphicStyle(
                  width: 20.0,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                child: Column(
                  children: <Widget>[
                    // Icon(
                    //     categoriesIcons[category.name.toString().toLowerCase()],
                    //     size: 60.0),
                    Image.asset(
                      categoriesIcons[category.name.toString().toLowerCase()],
                      height: 50,
                    ),
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
              ),
              const SizedBox(width: 25.0),
            ],
          ),
        );
      },
    );
  }
}

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _activeIndex = 0;

  List<Map> buttons = [
    {
      'icon': Icons.home,
      'badge': null,
    },
    {
      'icon': Icons.stop,
      'badge': null,
    },
    {
      'icon': Icons.notifications,
      'badge': Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: primaryColor,
        ),
        child: Center(
          child: Text('9',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              )),
        ),
      ),
    },
    {
      'icon': Icons.location_on,
      'badge': null,
    }
  ];

  List<Widget> _buildButtons() {
    List<Widget> _builtButtons = [];

    for (var i = 0; i < buttons.length; ++i) {
      var button = buttons[i];
      bool _buttonIsActive = i == _activeIndex;

      _builtButtons.add(NeumorphicButton(
        badge: button['badge'],
        pressed: _buttonIsActive ? true : false,
        style: NeumorphicStyle(padding: EdgeInsets.all(10.0)),
        child: Icon(
          button['icon'],
          color: _buttonIsActive ? primaryColor : null,
        ),
      ));
    }

    return _builtButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appPaddingValue, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildButtons(),
      ),
    );
  }
}
