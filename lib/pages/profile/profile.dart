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

  void valueChanged(bool change) => setState(() => value = change);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 40),
            CustomProfileInfo(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
              child: Container(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nitty-gritty?',
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                    CheckboxListTile(
                      value: value,
                      onChanged: valueChanged,
                      title: Text('General Surface Cleaning'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                    ),
                    CheckboxListTile(
                      value: value,
                      onChanged: valueChanged,
                      title: new Text('Office and Desk Cleaning'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
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
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                          setState(() {
                            markers.add(
                              Marker(
                                markerId: MarkerId('random'),
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
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
