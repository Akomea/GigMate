import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gigmate/Screens/Welcome/welcome_screen.dart';
import 'package:gigmate/constants.dart';

class HomeScreen extends StatefulWidget {
  static final screenId = 'home_screen';
  FirebaseAuth auth = FirebaseAuth.instance;

  // final String user;

  // const HomeScreen({this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<IconData> iconsList = [
    Icons.search_rounded,
    Icons.favorite_border_rounded,
    Icons.lightbulb_outline_rounded,
    Icons.messenger_outline,
    Icons.person_outline_rounded
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //String userCredential = this.widget.user;
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: kPrimaryColour,
        inactiveColor: kInactiveColour,
        backgroundColor: kSecondaryColour,
        icons: iconsList,
        activeIndex: currentIndex,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset(
            'assets/icons/megaphone.svg',
            color: kPrimaryColour,
          ),
          onPressed: () => print('fab pressed'),
          backgroundColor: kSecondaryColour),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Home Screen'),
                  RaisedButton(
                    onPressed: () async {
                      await widget.auth.signOut();
                      Navigator.popAndPushNamed(
                          context, WelcomeScreen.screenId);
                    },
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
