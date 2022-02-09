import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gigmate/routes.dart';
import 'package:gigmate/core/providers/model_notifier.dart';
import 'package:gigmate/core/providers/post_gig_notifier.dart';
import 'package:gigmate/core/services/connectivity_service.dart';
import 'package:gigmate/core/services/firestorage_service.dart';
import 'package:gigmate/ui/screens/onboarding/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home/app_navigation_home.dart';
import 'utils/constants.dart';
import 'package:gigmate/utils/enums.dart';
import 'core/providers/user_auth.dart';

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
      child: ScreenUtilInit(
        designSize: Size(325,667),
        builder:() {
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GigMate',
            theme: ThemeData(
                primaryColor: kPrimaryColour,
                scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black.withOpacity(0.6))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccent)),
            home: WelcomeScreen(),
            routes: PageRoutes().routes()
          );
        },
      ),
    );
  }
}
