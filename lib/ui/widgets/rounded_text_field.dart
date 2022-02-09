import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final Widget suffixIcon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  RoundedTextField({
    this.hintText,
    this.icon,
    this.isObscure,
    this.suffixIcon,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: kPrimaryColour.withOpacity(0.5),
          ),
          icon: Icon(
            icon,
            color: kPrimaryColour,
          ),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  TextFieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: child,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      width: size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: kSecondaryColour,
      ),
    );
  }
}

// CountryCode countryCode = CountryCode();
// String phonePrefix = countryCode.code;
