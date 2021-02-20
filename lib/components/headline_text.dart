import 'package:flutter/material.dart';

import '../constants.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final isBold;

  HeadlineText({this.text, this.isBold});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline6,
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15.0,
                color: kPurpleTextColour,
                fontWeight: fontWeight(isBold, text)),
          ),
        ],
      ),
    );
  }

  FontWeight fontWeight(bool isBold, String text) {
    if (isBold) {
      return FontWeight.bold;
    } else {
      return null;
    }
  }
}
