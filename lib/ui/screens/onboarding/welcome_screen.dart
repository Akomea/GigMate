import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/ui/shared_widgets/backgrounds/opening_screen_background.dart';
import 'package:gigmate/ui/widgets/headline_text.dart';
import 'package:gigmate/ui/widgets/normal_rounded_button.dart';
import 'package:gigmate/utils/constants.dart';
import '../../../routes.dart';
import '../home/app_navigation_home.dart';

class WelcomeScreen extends StatelessWidget {
  final String title;
  static final screenId = 'welcome_screen';

  WelcomeScreen({this.title});

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //provides total height and width of screen
    return Scaffold(
      body: Background(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText('Welcome',textStyle: kHeaderStyle),
              FadeAnimatedText('Hire A Musician.',textStyle: kHeaderStyle),
              FadeAnimatedText('Book A Band.',textStyle: kHeaderStyle),
              FadeAnimatedText('And More...',textStyle: kHeaderStyle),
            ],
          ),
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
              Navigator.popAndPushNamed(context, PageRoutes.app_nav),
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
    )
    );
  }
}
