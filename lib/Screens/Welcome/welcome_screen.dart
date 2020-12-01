import 'package:flutter/material.dart';

import 'file:///D:/GigMate_Development/gigmate_flutter_app/gigmate/lib/Screens/Welcome/components/body.dart';

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
