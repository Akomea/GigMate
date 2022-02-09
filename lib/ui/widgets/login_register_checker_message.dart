import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';

class LoginRegisterCheckerMessage extends StatelessWidget {
  final bool isLogin;
  final Function onPressed;

  LoginRegisterCheckerMessage({this.isLogin = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLogin ? "Don't have an account? " : 'Already have an account? '),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            isLogin ? 'Sign up' : 'Sign In',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: kPurpleTextColour),
          ),
        ),
      ],
    );
  }
}
