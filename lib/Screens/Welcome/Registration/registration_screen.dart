import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Registration/components/body.dart';

class RegistrationScreen extends StatelessWidget {
  static final String screenId = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
