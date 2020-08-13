import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:service_pap/widgets/neumorphism/neumorphism.dart';
import '../utils/variables.dart';

class CustomProfileInfo extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(
        horizontal: appPaddingValue,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            child: NeumorphicContainer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://picsum.photos/200',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Christine Kutwa',
                style: TextStyle(fontSize: 25, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Text('Cleaner', style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text('Kes 2,000/hr',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
