import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:service_pap/utils/variables.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';
import 'package:service_pap/screens/services/widgets.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {Key key,
      @required this.mediaQuery,
      this.image,
      this.name,
      this.comment,
      this.date})
      : super(key: key);

  final MediaQueryData mediaQuery;
  final String image;
  final String name;
  final String comment;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.size.width * 0.30,
      width: mediaQuery.size.width * 0.50,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(28.0)),
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: NeumorphicContainer(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            image,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  comment,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 65, top: 20),
                child: Text(
                  date,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCard2 extends StatelessWidget {
  ReusableCard2(
      {this.payRate,
      this.location,
      this.place,
      this.clientMileage,
      this.clientNumber,
      this.rating,
      this.clientComment});
  final String payRate;
  final String location;
  final String place;
  final String clientMileage;
  final String clientNumber;
  final String rating;
  final String clientComment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
      width: double.infinity,
      child: Card(
        elevation: 6,
        color: appBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                payRate,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 40),
              child: Text(
                location,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 60),
              child: Text(
                place,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 40),
              child: Text(
                clientMileage,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 60),
              child: Text(
                clientNumber,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 40),
              child: Text(
                rating,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 60),
              child: RatingStars(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 40),
              child: Text(
                clientComment,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
