import 'package:flutter/material.dart';

import './components/body.dart';

class WelcomeScreen extends StatelessWidget {
  final String title;
  static final screenId = 'welcome_screen';

  WelcomeScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
