import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Login/login_screen.dart';
import 'package:gigmate/Screens/Welcome/welcome_screen.dart';

import 'Screens/Welcome/Main/home_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColour,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: HomeScreen.screenId,
      routes: {
        WelcomeScreen.screenId: (context) => WelcomeScreen(),
        LoginScreen.screenId: (context) => LoginScreen(),
        HomeScreen.screenId: (context) => HomeScreen(),
      },
    );
  }
}
