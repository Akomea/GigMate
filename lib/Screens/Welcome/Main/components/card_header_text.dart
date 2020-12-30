import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class CardHeaderText extends StatelessWidget {
  final String leading;
  final IconData trailing;

  const CardHeaderText({this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        trailing: Icon(
          trailing,
          color: kAccent,
        ),
        title: Text(leading, style: kHeaderStyle2),
      ),
    );
  }
}
