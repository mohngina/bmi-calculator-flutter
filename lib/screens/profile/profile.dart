import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:service_pap/widgets/custom_profile_info.dart';
import '../../utils/variables.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GoogleMapController mapController;
  Set<Marker> markers = HashSet<Marker>();
  bool value = false;
  bool value1 = false;
  bool value2 = false;

  void valueChanged(bool change) => setState(() => value = change);
  void value1Changed(bool change) => setState(() => value1 = change);
  void value2Changed(bool change) => setState(() => value2 = change);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: size.height * 0.02),
              CustomProfileInfo(),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nitty-gritty?',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                      CheckboxListTile(
                        value: value,
                        onChanged: valueChanged,
                        title: Text('Basic tea & snack service'),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      ),
                      CheckboxListTile(
                        value: value1,
                        onChanged: value1Changed,
                        title: Text('General Surface Cleaning'),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      ),
                      CheckboxListTile(
                        value: value2,
                        onChanged: value2Changed,
                        title: new Text('Office and Desk Cleaning'),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Building Location',
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: size.height * 0.25,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-3, -3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(3, 3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                            setState(() {
                              markers.add(
                                Marker(
                                  markerId: MarkerId('building location'),
                                  position: LatLng(-1.1859, 36.9069),
                                ),
                              );
                            });
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(-1.1859, 36.9069),
                            zoom: 12,
                          ),
                          markers: markers,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
