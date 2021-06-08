import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class CreditsPill extends StatelessWidget {
  final String name;
  final double padding;
  final double pillHeight;

  const CreditsPill({this.name, this.padding = 6.0, this.pillHeight = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kInactiveColour.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(padding),
      height: pillHeight,
      child: Text(
        name,
        style: TextStyle(
          color: kPrimaryColour,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget getCredits(List credits, double padding, double height) {
    List<CreditsPill> creditList =[];
    for (String credit in credits) {
        creditList.add(CreditsPill(
          name: credit.toString(),
        ));
    }
    return Row(children: creditList);
  }

  static Widget generateCreditPill(
      List credits, double padding, double height) {
    int num = 2;
    final List<Widget> pills = [];
    if (credits.length < num) num = credits.length;
    if (credits != null) {
      for (int i = 0; i < num; i++) {
        pills.add(CreditsPill(
          name: credits[i].toString(),
          padding: padding,
          pillHeight: height,
        ));
      }
    }
    return Row(
      children: pills,
    );
  }
}
