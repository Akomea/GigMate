import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/locale/locales.dart';
import 'package:gigmate/theme/colors.dart';

import '../../../routes.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class Providers {
  String title;
  String subtitle;
  String time;
  String image;
  String rating;
  Providers(this.title, this.subtitle, this.time, this.image, this.rating);
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    List<Providers> _providersList = [
      Providers(
        'Emili Anderson',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Emili.png',
        '4.0',
      ),
      Providers(
        'Alisha Patel',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Alisha.png',
        '5.0',
      ),
      Providers(
        'Linda Haydon',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Linda.png',
        '5.0',
      ),
      Providers(
        'Peter Johnson',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Peter.png',
        '3.0',
      ),
      Providers(
        'Emili Anderson',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Emili.png',
        '4.0',
      ),
      Providers(
        'Alisha Patel',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Alisha.png',
        '5.0',
      ),
      Providers(
        'Linda Haydon',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Linda.png',
        '4.0',
      ),
      Providers(
        'Peter Johnson',
        locale.carpetShampooing,
        '21 Jun, !0:00 am',
        'assets/Providers/Peter.png',
        '4.0',
      ),
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Bookings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: theme.backgroundColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black,
                indicatorColor: theme.primaryColor,
                labelColor: theme.primaryColor,
                tabs: [
                  Tab(
                    text: locale.upcoming,
                  ),
                  Tab(
                    text: locale.cancelled,
                  ),
                  Tab(
                    text: locale.completed,
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        body: TabBarView(
          children: [
            Upcoming(
              theme: theme,
              providersList: _providersList,
              isCompleted: false,
            ),
            Upcoming(
              theme: theme,
              providersList: _providersList,
              isCompleted: false,
            ),
            Upcoming(
              theme: theme,
              providersList: _providersList,
              isCompleted: true,
            ),
            // FlutterLogo(),
            // FlutterLogo(),
          ],
        ),
      ),
    );
  }
}

class Upcoming extends StatelessWidget {
  const Upcoming({
    Key key,
    @required this.theme,
    @required List<Providers> providersList,
    this.isCompleted,
  })  : _providersList = providersList,
        super(key: key);
  final bool isCompleted;
  final ThemeData theme;
  final List<Providers> _providersList;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        shrinkWrap: false,
        //padding: EdgeInsets.symmetric(vertical: 16),
        physics: BouncingScrollPhysics(),
        itemCount: _providersList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: theme.backgroundColor,
                ),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.bookingInfo);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, PageRoutes.bookingInfo,
                            arguments: index),
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          _providersList[index].title,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          _providersList[index].subtitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: iconColor,
                              fontSize: 14),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/Icons/bookings.png',
                              scale: 3, color: theme.primaryColor),
                          Text(
                            "   " + _providersList[index].time + "  ",
                            style: theme.textTheme.bodyText1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: iconColor,
                          ),
                          Text(
                            isCompleted
                                ? "  " + locale.rated + " "
                                : "  " + locale.pending + " ",
                            style: theme.textTheme.bodyText1.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: iconColor),
                          ),
                          isCompleted
                              ? Icon(Icons.star,
                                  size: 12, color: Color(0xffffae22))
                              : SizedBox.shrink(),
                          isCompleted
                              ? Text(
                                  _providersList[index].rating,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                end: 16,
                bottom: 12,
                child: FadedScaleAnimation(
                  Image.asset(
                    _providersList[index].image,
                    scale: 2.7,
                  ),
                  durationInMilliseconds: 800,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
