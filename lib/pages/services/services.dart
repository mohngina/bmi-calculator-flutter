import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:service_pap/models/service_provider_model.dart';
import 'package:service_pap/models/services_model.dart';

import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';
import 'package:service_pap/widgets/custom_app_bar.dart';

class ServicesPage extends StatelessWidget {
  final List<Service> services;

  ServicesPage({
    Key key,
    @required this.services,
  }) : super(key: key);

  Widget _buildServices() {
    List<Widget> _builtServicesLeft = [];
    List<Widget> _builtServicesRight = [];

    for (var i = 0; i < services.length; ++i) {
      Service service = services[i];
      bool _roundEven = i % 2 == 0;
      double _widgetHeight = 120.0;
      ServiceProvider provider = service.provider;

      Widget _builtService = Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: NeumorphicContainer(
          style: NeumorphicStyle(
            padding: EdgeInsets.all(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  provider.profileImage,
                  width: 110,
                  height: _roundEven ? _widgetHeight : _widgetHeight + 50.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                provider.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3.0),
              Text(
                service.location,
              ),
              RatingStars(rating: service.rating),
            ],
          ),
        ),
      );

      if (_roundEven)
        _builtServicesLeft.add(_builtService);
      else
        _builtServicesRight.add(_builtService);

      // add the bottom padding

    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: _builtServicesLeft),
        Column(children: _builtServicesRight),
      ],
    );
  }

  var _bottomButtonBackgroundColor = Colors.orange[400];
  double _bottomButtonRadius = 10.0;

  List<BoxShadow> _bottomButtonShadows = [
    BoxShadow(
      color: Colors.orange[100],
      offset: Offset(-3, -2),
      blurRadius: 10,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Colors.orange[900],
      offset: Offset(3, 3),
      blurRadius: 10,
      spreadRadius: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CustomAppBar(
        title: 'Services',
        leading: NeumorphicButton(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: appPaddingValue),
                      child: Text(
                        '${services.length} services found',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: appPaddingValue),
                      child: _buildServices(),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: appPaddingValue,
              bottom: appPaddingValue,
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: _bottomButtonBackgroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent[700].withOpacity(.26),
                        offset: Offset(0, 0),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    NeumorphicButton(
                      child: Icon(Icons.search),
                      style: NeumorphicStyle(
                        color: _bottomButtonBackgroundColor,
                        shadows: _bottomButtonShadows,
                        radius: _bottomButtonRadius,
                      ),
                    ),
                    SizedBox(width: 15),
                    NeumorphicButton(
                      child: Icon(MdiIcons.filterMenu),
                      style: NeumorphicStyle(
                        color: _bottomButtonBackgroundColor,
                        shadows: _bottomButtonShadows,
                        radius: _bottomButtonRadius,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final rating;

  RatingStars({this.rating: 5.0});

  Widget _buildStars() {
    List<Widget> _builtStars = [];

    for (var i = 1; i <= 5; ++i) {
      _builtStars.add(
        Icon(
          i <= rating
              ? Icons.star
              : ((i - 1) < rating && rating < i)
                  ? Icons.star_half
                  : Icons.star_border,
          size: 16.0,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5),
        Row(
          children: _builtStars,
        ),
        // Text(
        //   "$rating",
        //   style: TextStyle(fontSize: 18.0),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildStars(),
      ],
    );
  }
}
