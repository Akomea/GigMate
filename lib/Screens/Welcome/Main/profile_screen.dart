import 'package:flutter/material.dart';

import '../welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onDoubleTap: () {
              Navigator.pushReplacementNamed(context, WelcomeScreen.screenId);
            },
            child: Text('profile')),
      ),
    );
  }
}
