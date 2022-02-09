import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';

class CardHeaderText extends StatelessWidget {
  final String leading;
  final Widget trailing;

  CardHeaderText({this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        trailing: trailing,
        title: Text(leading, style: kHeaderStyle2),
      ),
    );
  }
}
