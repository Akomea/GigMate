import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Login/login_screen.dart';
import 'package:gigmate/Screens/Welcome/Main/musicians_main_screen.dart';
import 'package:gigmate/Screens/Welcome/welcome_screen.dart';
import 'package:gigmate/model_notifier.dart';
import 'package:gigmate/post_gig_notifier.dart';
import 'package:gigmate/services/connectivity_service.dart';
import 'package:gigmate/services/firestorage_service.dart';
import 'package:provider/provider.dart';

import './Screens/./Welcome/./Main/places_screen.dart';
import './Screens/Welcome/Main/band_detail_screen.dart';
import './Screens/Welcome/Main/solo_detail_screen.dart';
import 'Screens/Welcome/Main/home_screen.dart';
import 'Screens/Welcome/Main/studio_main_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';
import 'enum/connectivity_status.dart';
import 'user_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserAuth(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostGigNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ModelNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FireStorageService(),
        ),
        StreamProvider<ConnectivityStatus>(
          create: (context) =>
          ConnectivityService().connectionStatusController.stream,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GigMate',
        theme: ThemeData(
            primaryColor: kPrimaryColour,
            scaffoldBackgroundColor: Colors.white,
            accentColor: kAccent,
            textTheme: TextTheme(
                bodyText2: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black.withOpacity(0.6)))),
        initialRoute: HomeScreen.screenId,
        routes: {
          WelcomeScreen.screenId: (context) => WelcomeScreen(),
          LoginScreen.screenId: (context) => LoginScreen(),
          HomeScreen.screenId: (context) => HomeScreen(),
          DetailScreen.screenId: (context) => DetailScreen(),
          SoloDetailScreen.screenId: (context) => SoloDetailScreen(),
          StudioMainScreen.screenId: (context) => StudioMainScreen(),
          PlacesScreen.screenId: (context) => PlacesScreen(),
          MusiciansMainScreen.screenId: (context) => MusiciansMainScreen(),
        },
      ),
    );
  }
}
