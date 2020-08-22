import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:service_pap/networkOps/netops.dart';
import 'package:service_pap/widgets/custom_button.dart';
import 'package:service_pap/widgets/custom_text_field.dart';
import '../../utils/variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool isLoading = false;
  NetOps netOps = NetOps();
  final _formKey = GlobalKey<FormState>();

  void showToast() {
    Fluttertoast.showToast(
        msg: "Incorrect username or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: _formKey,
          child: Padding(
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
                  onChange: (value) {
                    email = value;
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please type in your email';
                    }
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Enter Valid Email';
                    else
                      return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'Password',
                  obscure: true,
                  onChange: (typedPassword) {
                    password = typedPassword;
                  },
                  validate: (typedPassword) {
                    if (typedPassword.isEmpty) {
                      return 'Please type in your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                CustomButton(
                  size: size,
                  label: 'Log in',
                  onPress: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      var loginDetails = await netOps.logIn(email, password);
                      if (loginDetails == 2) {
                        setState(() {
                          isLoading = false;
                        });
                        showToast();
                      } else {
                        Navigator.popAndPushNamed(context, 'home');
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                    child: Center(child: Text('Create an account?')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
