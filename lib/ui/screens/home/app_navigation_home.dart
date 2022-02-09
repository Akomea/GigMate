import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gigmate/ui/screens/broadcast/broadcast_gig_welcome_screen.dart';
import 'package:gigmate/ui/screens/home/profile_screen.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'explore_screen.dart';
import 'fav_screen.dart';
import 'inbox_screen.dart';

class AppNavScreen extends StatefulWidget {
  static final screenId = 'home_screen';

  // final String user;

  // const HomeScreen({this.user});
  @override
  _AppNavScreenState createState() => _AppNavScreenState();
}

class _AppNavScreenState extends State<AppNavScreen> {
  static int currentIndex = 0;
  PageController _pageController = PageController();

  List<IconData> iconsList = [
    Icons.search_rounded,
    Icons.favorite_border_rounded,
    Icons.messenger_outline,
    Icons.person_outline_rounded
  ];

  List<Widget> _screens = [
    ExploreScreen(),
    FavScreen(),
    InboxScreen(),
    ProfileScreen()
  ];

  void _onPageChanged(int index) {}

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth auth = FirebaseAuth.instance;
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        elevation: 30,
        activeColor: kPrimaryColour,
        inactiveColor: kInactiveColour,
        backgroundColor: Colors.white,
        icons: iconsList,
        activeIndex: currentIndex,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset(
            'assets/icons/megaphone.svg',
            color: kAccent,
          ),
          onPressed: () {
            showCupertinoModalBottomSheet(
              barrierColor: Colors.black54,
              elevation: 8,
              context: context,
              builder: (context) => Material(child: PostGigWelcomeScreen()),
            );
          },
          backgroundColor: kSecondaryColour),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Colors.white, //color under FAB
    );
  }
}
