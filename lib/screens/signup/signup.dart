import 'package:flutter/material.dart';
import 'package:service_pap/screens/signup/widgets/custom_submit_button.dart';
import 'package:service_pap/screens/signup/widgets/custom_text_field.dart';
import 'dart:async';
import '../../utils/variables.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // button loading state (0-default, 1-loading, 2-success, 3-error)
  int _state = 0;

  // focus nodes
  FocusNode _focusNodeFullName;
  FocusNode _focusNodeEmail;
  FocusNode _focusNodePhoneNumber;
  FocusNode _focusNodePassword;

  @override
  void initState() {
    super.initState();

    _focusNodeFullName = FocusNode();
    _focusNodeEmail = FocusNode();
    _focusNodePhoneNumber = FocusNode();
    _focusNodePassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus nodes when the Form is disposed.
    _focusNodeFullName.dispose();
    _focusNodeEmail.dispose();
    _focusNodePhoneNumber.dispose();
    _focusNodePassword.dispose();

    super.dispose();
  }

  void signUpUser() {
    // sets _state to 'loading' (sending the API request...)
    setState(() {
      _state = 1;
    });

    // TODO: make the API call (with captured user email and password), and await response from server
    Timer(Duration(milliseconds: 3000), () {
      // sets _state to 'success' (when response has statusCode == 200)
      setState(() {
        _state = 2;
      });
    });
  }

  void _removeFocusNodes() {
    // remove focus
    _focusNodeFullName.unfocus();
    _focusNodeEmail.unfocus();
    _focusNodePhoneNumber.unfocus();
    _focusNodePassword.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: GestureDetector(
        onTap: () {
          // remove focus
          _removeFocusNodes();
        },
        child: ListView(
          children: <Widget>[
            // TODO: pass custom validator function for each input field
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // logo
                  SizedBox(height: size.height * 0.15),
                  Image.asset(
                    "assets/logo.png",
                    height: size.height * 0.15,
                  ),
                  SizedBox(height: 65),
                  // full name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: CustomTextField(
                      label: "Full Name",
                      obscure: false,
                      keyBoard: TextInputType.text,
                      mFocusNode: _focusNodeFullName,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  // email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: CustomTextField(
                      label: "Email Address",
                      obscure: false,
                      keyBoard: TextInputType.emailAddress,
                      mFocusNode: _focusNodeEmail,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  // phone number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: CustomTextField(
                      label: "Phone Number",
                      obscure: false,
                      keyBoard: TextInputType.phone,
                      mFocusNode: _focusNodePhoneNumber,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  // password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: CustomTextField(
                      label: "Password",
                      obscure: true,
                      keyBoard: TextInputType.text,
                      mFocusNode: _focusNodePassword,
                    ),
                  ),
                  SizedBox(
                    height: 55.0,
                  ),
                  // submit
                  SubmitButton(
                    label: "Sign Up",
                    formKey: _formKey,
                    loadingState: _state,
                    removeFocusNodes: _removeFocusNodes,
                    signUpUser: signUpUser,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
