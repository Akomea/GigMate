import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gigmate/ui/screens/auth/login_screen.dart';
import 'package:gigmate/ui/screens/home/app_navigation_home.dart';
import 'package:gigmate/ui/shared_widgets/backgrounds/registration_screen_background.dart';
import 'package:gigmate/ui/widgets/login_register_checker_message.dart';
import 'package:gigmate/ui/widgets/rounded_password_field.dart';
import 'package:gigmate/ui/widgets/rounded_text_field.dart';
import 'package:gigmate/ui/widgets/special_roundedbutton.dart';
import 'package:gigmate/utils/constants.dart';

class RegistrationScreen extends StatelessWidget {
  static final String screenId = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}


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
                      Navigator.pushNamed(context, AppNavScreen.screenId);
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