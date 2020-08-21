import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:service_pap/screens/signup/widgets/custom_submit_button.dart';
import 'package:service_pap/screens/signup/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
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

  // input field values
  String username, email, contact, password;

  // server response body
  var data;

  // input field RegEx
  // TODO: Thorough phone number validation needed
  final RegExp phoneRegex = new RegExp(r'^[0-9]+$');

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

  void _showErrorToast(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red[600],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void signUpUser() async {
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      // sets _state to 'loading' (sending the API request...)
      setState(() {
        _state = 1;
      });

      // USING DIO LIB
      // BaseOptions baseOptions = new BaseOptions(
      //   baseUrl: "https://ezdan-service-pap-development.herokuapp.com/api/v1",
      //   connectTimeout: 10000,
      //   receiveTimeout: 10000,
      //   headers: headers,
      // );
      // Dio dio = Dio(baseOptions);
      // var response = await dio.post(
      //   "/accounts/signup/",
      // );

      // USING HTTP LIB
      var response = await http.post(
          "https://ezdan-service-pap-development.herokuapp.com/api/v1/accounts/signup/",
          headers: headers,
          body: jsonEncode({
            "username": username,
            "email": email,
            "password": password,
            // "profile": {"contact_number": contact},
          }));
      print("End call...");

      data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(data);
        // print(jsonDecode(response.data));
        setState(() {
          _state = 2;
        });
        Navigator.popAndPushNamed(context, "login");
      } else if (response.statusCode == 400) {
        Map<String, dynamic> errors = data["data"]["errors"];
        String firstError = errors.values.toList()[0][0].toString();
        print(errors);
        print(firstError);
        // print(jsonDecode(response.data));

        setState(() {
          _state = 3;
        });
        _showErrorToast(firstError);
      } else {
        setState(() {
          _state = 3;
        });
        _showErrorToast("Some Error occurred. Please try again");
      }
    } catch (e) {
      print("Some Error Caught...");
      print(e);
    }
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
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // logo
                  SizedBox(height: size.height * 0.125),
                  Image.asset(
                    "assets/logo.png",
                    height: size.height * 0.15,
                  ),
                  SizedBox(height: 65),
                  // full name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: CustomTextField(
                      label: "Username",
                      obscure: false,
                      keyBoard: TextInputType.text,
                      mFocusNode: _focusNodeFullName,
                      mValidation: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      mOnSaved: (String value) {
                        username = value;
                      },
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
                      mValidation: (String value) {
                        // TODO: Thorough email validation needed
                        if (value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      mOnSaved: (String value) {
                        email = value;
                      },
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
                      mValidation: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Phone Number is required';
                        }
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Please enter valid phone number';
                        }
                        return null;
                      },
                      mOnSaved: (String value) {
                        contact = value;
                      },
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
                      mValidation: (String value) {
                        if (value.trim().isEmpty) {
                          return "Password is required";
                        }
                        if (value.trim().length <= 4) {
                          return "Password must contain more than \n4 characters";
                        }
                        return null;
                      },
                      mOnSaved: (String value) {
                        password = value;
                      },
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
