import 'package:flutter/material.dart';
import 'package:gigmate/locale/locales.dart';
import 'package:gigmate/theme/colors.dart';
import 'package:gigmate/ui/shared_widgets/custom_button.dart';
import 'package:gigmate/ui/widgets/normal_rounded_button.dart';
import 'package:gigmate/utils/constants.dart';

import '../../../routes.dart';

class BookingSent extends StatefulWidget {
  @override
  _BookingSentState createState() => _BookingSentState();
}

class _BookingSentState extends State<BookingSent> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(
            flex: 7,
          ),
          Image.asset(
            'assets/images/booking_sent.png',
            height: 170,
            width: 170,
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            'Congratulations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: iconColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Request Sent',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Spacer(
            flex: 7,
          ),
          NormalRoundedButton(
            bgColour: kSecondaryColour,
            buttonText: 'My Bookings',
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.home);
            },
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
