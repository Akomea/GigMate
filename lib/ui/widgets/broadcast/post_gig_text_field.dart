import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';

class PostGigTextField extends StatelessWidget {
  final String hintText;
  final Icon icon;

  const PostGigTextField({Key key, this.hintText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: kTextFieldContainerShadow,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          cursorColor: kPrimaryColour,
          decoration: InputDecoration(
              icon: icon,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: kHintTextColour.withOpacity(0.3))),
        ),
      ),
    );
  }
}
