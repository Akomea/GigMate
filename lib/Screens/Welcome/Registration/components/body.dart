import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gigmate/Screens/Welcome/Login/login_screen.dart';
import 'package:gigmate/Screens/Welcome/Main/home_screen.dart';
import 'package:gigmate/Screens/Welcome/Registration/components/background.dart';
import 'package:gigmate/components/login_register_checker_message.dart';
import 'package:gigmate/components/rounded_password_field.dart';
import 'package:gigmate/components/rounded_text_field.dart';
import 'package:gigmate/components/special_roundedbutton.dart';
import 'package:gigmate/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register',
              style: kHeaderStyle,
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/images/band.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedTextField(
              hintText: 'Email',
              icon: Icons.mail_rounded,
              isObscure: false,
              onChanged: (value) => {
                email = value,
              },
            ),
            RoundedPasswordField(
              onChanged: (value) => {
                password = value,
              },
            ),
            Hero(
              tag: 'reg',
              child: SpecialRoundedButton(
                bgColour: kPrimaryColour,
                buttonText: 'Register',
                textColour: Colors.white,
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, HomeScreen.screenId);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            SizedBox(height: size.height * 0.01),
            LoginRegisterCheckerMessage(
              isLogin: false,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.screenId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
