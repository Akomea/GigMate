import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
//import 'package:gigmate/Screens/Welcome/Login/login_screen.dart';
import 'package:gigmate/constants.dart';

import '../../../components/headlineText.dart';
import '../../../components/normal_roundedbutton.dart';
import '../Main/home_screen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //provides total height and width of screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimatedTextKit(
            text: [
              'Welcome',
              'Hire A Musician.',
              'Book A Band.',
              'And More...',
            ],
            textStyle: kHeaderStyle,
          ),
          Image.asset(
            'assets/images/logo1.png',
            width: 200.0,
            height: 200.0,
          ),
          Hero(
            tag: 'reg',
            child: NormalRoundedButton(
              bgColour: kSecondaryColour,
              buttonText: 'Get Started',
              textColour: kPurpleTextColour,
              onPressed: () => {
                Navigator.popAndPushNamed(context, HomeScreen.screenId),
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadlineText(text: 'Meet ', isBold: false),
              HeadlineText(text: 'Musicians. ', isBold: true),
              HeadlineText(text: 'Find ', isBold: false),
              HeadlineText(text: 'Gigs.', isBold: true),
            ],
          ),
          SizedBox(
            height: size.height * 0.1,
          )
        ],
      ),
    );
  }
}
