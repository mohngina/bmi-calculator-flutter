import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final formKey;
  final int loadingState;
  final removeFocusNodes;
  final signUpUser;

  SubmitButton({
    this.label,
    this.formKey,
    this.loadingState,
    this.removeFocusNodes,
    this.signUpUser,
  });

  // TODO: Refactor this widget (eg. use switch statements; do away with Text widget duplication)
  Widget _setUpButtonChild() {
    Text _defaultText = Text(
      label,
      style: TextStyle(color: Colors.white),
    );

    if (loadingState == 1) {
      // TODO: disable the signup button in this state (to prevent user making multiple requests to the server)
      return Container(
        width: 15.0,
        height: 15.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return _defaultText;
    }
  }

  void _handleSubmit() {
    final form = formKey.currentState;
    // validate will return true if form is valid, otherwise false is returned
    if (form.validate()) {
      // Process data
      form.save();

      // remove focus
      removeFocusNodes();

      // register user
      signUpUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.5),
        child: _setUpButtonChild(),
        onPressed: loadingState == 1 ? null : _handleSubmit);
  }
}
