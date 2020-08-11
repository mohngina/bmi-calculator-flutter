import 'package:flutter/material.dart';

import '../../utils/variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.15),
            Image.asset(
              'assets/logo.png',
              height: size.height * 0.15,
            ),
            SizedBox(height: 50),
            TextField(
              decoration: new InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black, letterSpacing: 1),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: new InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black, letterSpacing: 1),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  color: Colors.black,
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  color: Colors.black,
                  child: Text(
                    'Service',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'service');
                  }),
            )
          ],
        ),
      ),
    );
  }
}
