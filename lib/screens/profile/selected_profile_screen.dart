import 'package:flutter/material.dart';
import 'package:service_pap/widgets/custom_button.dart';
import '../../utils/variables.dart';
import 'package:flutter/widgets.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/neumorphism/widgets/neumorphic_button.dart';
import 'package:service_pap/widgets/neumorphism/widgets/neumorphic_container.dart';
import 'package:service_pap/widgets/reusable_card.dart';
import 'package:service_pap/widgets/selected_custom_app_bar.dart';

class SelectedProfile extends StatefulWidget {
  @override
  _SelectedProfileState createState() => _SelectedProfileState();
}

class _SelectedProfileState extends State<SelectedProfile> {
  final services = [
    {
      'id': 1,
      'image': 'https://picsum.photos/201',
      'name': 'Super Brendah',
      'location': 'West Side',
      'rating': 3.7
    },
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectedCustomAppBar(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Mourinho', style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),),
            ),
            Container(
            padding: EdgeInsets.symmetric(
              horizontal: appPaddingValue,
              vertical: 10,
            ),
                child: Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    child: NeumorphicContainer(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          'https://picsum.photos/200',
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          NeumorphicButton(child: Icon(Icons.flag, size: 30.0,)),
                          SizedBox(width: 30.0),
                          NeumorphicButton(child: Icon(Icons.share, size: 30.0,)),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      CustomButton(
                        size: Size(20.0, 40.0),
                        label: 'Make a Request',
                        onPress: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: Stack(
                  children: <Widget>[
                    ReusableCard2(
                      payRate: 'Kes. 2,000/Hr',
                      location: 'Location',
                      place: 'Seasons, Kasarani  ',
                      clientMileage: 'Client Mileage',
                      clientNumber: '126 Clients',
                      rating: 'Rating',
                      clientComment: 'Happy Clients',
                    ),
                    Align(
                      alignment: Alignment(2.0, 0.6),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 20),
                            ReusableCard(
                              image: 'https://picsum.photos/201',
                                name: 'Buda Boss',
                                comment: 'Very punctual',
                                date: 'August 14th, 2020',
                                mediaQuery: mediaQuery
                            ),
                            SizedBox(width: 20),
                            ReusableCard(
                                image: 'https://picsum.photos/202',
                                name: 'Kevin Hart',
                                comment: 'Good Personality',
                                date: 'August 15th, 2020',
                                mediaQuery: mediaQuery
                            ),
                            SizedBox(width: 20),
                            ReusableCard(
                                image: 'https://picsum.photos/203',
                                name: 'Joker',
                                comment: 'Heavy Duty',
                                date: 'August 16th, 2020',
                                mediaQuery: mediaQuery
                            ),
                            SizedBox(width: 20),
                            ReusableCard(
                                image: 'https://picsum.photos/204',
                                name: 'Big Man Bazu',
                                comment: 'Mtu Ngori',
                                date: 'August 20th, 2020',
                                mediaQuery: mediaQuery
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
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







