import 'package:flutter/material.dart';

import '../constants.dart';

class PillButton extends StatelessWidget {
  final buttonText;
  final Function onTap;

  const PillButton({this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 20.0,
            color: kSecondaryColour,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: kPrimaryColour, fontFamily: 'OpenSans'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
