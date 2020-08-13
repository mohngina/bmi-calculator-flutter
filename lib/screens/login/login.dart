import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_pap/widgets/custom_button.dart';
import 'package:service_pap/widgets/custom_text_field.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.15),
            Image.asset(
              'assets/logo.png',
              height: size.height * 0.15,
            ),
            SizedBox(height: 50),
            CustomTextField(
              keyBoard: TextInputType.emailAddress,
              label: 'Email',
              obscure: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Password',
              obscure: true,
            ),
            SizedBox(height: 40),
            CustomButton(
              size: size,
              label: 'Service',
              onPress: () {
                Navigator.pushNamed(context, 'service');
              },
            ),
            CustomButton(
              size: size,
              label: 'Home',
              onPress: () {
                Navigator.pushNamed(context, 'home');
              },
            ),
            CustomButton(
              size: size,
              label: 'Selected Profile',
              onPress: () {
                Navigator.pushNamed(context, 'selected_profile');
              },
            ),
            CustomButton(
              size: size,
              label: 'Selected Profile',
              onPress: () {
                Navigator.pushNamed(context, 'selected_profile');
              },
            )
          ],
        ),
      ),
    );
  }
}
