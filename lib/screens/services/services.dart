import 'package:flutter/material.dart';

import 'package:service_pap/utils/utils.dart';
import 'package:service_pap/models/models.dart';
import 'package:service_pap/widgets/custom_app_bar.dart';
import 'package:service_pap/screens/services/widgets.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class ServicesPage extends StatefulWidget {
  final List<Service> services;
  final String itemsName;

  ServicesPage({Key key, @required this.services, @required this.itemsName})
      : super(key: key);

  @override
  _ServicesPageState createState() =>
      _ServicesPageState(services: services, itemsName: itemsName);
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Service> services;
  final String itemsName;
  List<Service> servicesResults;

  _ServicesPageState({
    @required this.services,
    @required this.itemsName,
  }) {
    this.servicesResults = services;
  }

  Widget _buildServices() {
    List<Widget> _builtServicesLeft = [];
    List<Widget> _builtServicesRight = [];

    // print('The services imma build: ${servicesResults[0].provider.name}');

    for (var i = 0; i < servicesResults.length; ++i) {
      Service currentService = servicesResults[i];
      bool _roundEven = i % 2 == 0;
      double _widgetHeight = 120.0;
      ServiceProvider provider = currentService.provider;

      print('The service being built: ${currentService.provider.name}');

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
                provider.name.toString().ellipsize(maxChars: 12),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 3.0),
              Text(
                currentService.location,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 5),
              RatingStars(rating: currentService.rating),
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

    // print('Left Services: $_builtServicesLeft');
    // print('Right Services: $_builtServicesRight');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: _builtServicesLeft),
        Column(children: _builtServicesRight),
      ],
    );
  }

  void _searchServices(name) {
    name = name.toString().trim();
    print('Called with: $name');
    List results = services
        .where((service) =>
            service.provider.name.toString().toLowerCase().contains(name))
        .toList();

    setState(() {
      if (results.length == 0 && name == "")
        servicesResults = services;
      else
        servicesResults = results;
    });

    print('Here are the services: ${services[0].provider.name}');
  }

  @override
  Widget build(BuildContext context) {
    
    TestService.fetchAll();

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
                        '${servicesResults.length} $itemsName${servicesResults.length > 1 ? 's' : ''} found',
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
              child: BottomBar(onSearch: (name) => _searchServices(name)),
            ),
          ],
        ),
      ),
    );
  }
}
