import 'package:flutter/cupertino.dart';
import 'package:gigmate/ui/screens/auth/login_screen.dart';
import 'package:gigmate/ui/screens/auth/registration_screen.dart';
import 'package:gigmate/ui/screens/booking/booking_info.dart';
import 'package:gigmate/ui/screens/booking/booking_sent.dart';
import 'package:gigmate/ui/screens/home/explore_screen.dart';
import 'package:gigmate/ui/screens/others/band_detail_screen.dart';
import 'package:gigmate/ui/screens/others/band_detail_screen_v2.dart';
import 'package:gigmate/ui/screens/home/app_navigation_home.dart';
import 'package:gigmate/ui/screens/others/musicians_main_screen.dart';
import 'package:gigmate/ui/screens/others/places_screen.dart';
import 'package:gigmate/ui/screens/others/solo_detail_screen.dart';
import 'package:gigmate/ui/screens/others/studio_main_screen.dart';
import 'package:gigmate/ui/screens/onboarding/welcome_screen.dart';

class PageRoutes{
  static const String welcome = 'welcome';
  static const String logIn = 'logIn';
  static const String register = 'register';
  static const String home = 'home';
  static const String band_detail = 'band_detail';
  static const String solo_detail = 'solo_detail';
  static const String studio_main = 'studio_main';
  static const String places = 'places';
  static const String musicians_main = 'musicians_main';
  static const String band_detail2 = 'band_detail2';
  static const String explore = 'explore';
  static const String bookingInfo = 'bookingInfo';
  static const String bookingSent = 'bookingSent';
  static const String app_nav = 'app_nav';




  Map<String, WidgetBuilder> routes() {
    return{
      welcome: (context) => WelcomeScreen(),
      app_nav: (context) => AppNavScreen(),
      explore: (context) => ExploreScreen(),
      logIn: (context) => LoginScreen(),
      register: (context) => RegistrationScreen(),
      home: (context) => AppNavScreen(),
      band_detail: (context) => BandDetailScreen(),
      solo_detail: (context) => SoloDetailScreen(),
      studio_main: (context) => StudioMainScreen(),
      places: (context) => PlacesScreen(),
      musicians_main: (context) => MusiciansMainScreen(),
      band_detail2: (context) => BandDetailScreen2(),
      bookingInfo: (context) => BookingInfo(),
      bookingSent: (context) => BookingSent()
    };
  }

}

