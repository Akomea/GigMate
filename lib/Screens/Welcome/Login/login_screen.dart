import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gigmate/Screens/Welcome/Login/components/LoginBody.dart';

class LoginScreen extends StatelessWidget {
  static final String screenId = 'login_screen';

// Find the Scaffold in the widget tree and use it to show a SnackBar.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: LoginBody(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
