import 'package:flutter/material.dart';

const kPrimaryColour = Color(0xFF6F35A5);
const kSecondaryColour = Color(0xFFF1E6FF);
const kAccent = Color(0xFFF36B22);
const kInactiveColour = Color(0xff997d99);

const kOfflineErrorMessage = 'The internet connection appears to be offline';
const kInvalidPhoneErrorMessage = 'Oops...invalid phone number format :(';
const kIncorrectCodeErrorMessage = 'Oops...the sms code is incorrect :(';
const List<BoxShadow> kShadow = [
  BoxShadow(blurRadius: 5, spreadRadius: 3, color: kShadowColour)
];
const List<BoxShadow> kTextFieldContainerShadow = [
  BoxShadow(blurRadius: 5, spreadRadius: 1, color: Color(0xffede9f0))
];
const List<BoxShadow> kShadow2 = [
  BoxShadow(blurRadius: 5, spreadRadius: 1, color: Color(0xffc7c7c7))
];

const List<BoxShadow> kNoShadow = [];
const kHeaderStyle = TextStyle(
  fontFamily: 'Playfair',
  fontSize: 25.0,
  color: kPrimaryColour,
);
const kFilterButtonShadow = [
  BoxShadow(
      offset: Offset(5, 0),
      blurRadius: 9,
      spreadRadius: 1,
      color: kInactiveColour)
];
const kFilterButtonShadow2 = [
  BoxShadow(
      offset: Offset(-5, 0),
      blurRadius: 9,
      spreadRadius: 1,
      color: kInactiveColour)
];
const kDetailTextStyle = TextStyle(color: Colors.black, fontFamily: 'OpenSans');
const kQuestionStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    fontFamily: 'Roboto',
    color: kPurpleTextColour);
const kNotifiedTextStyle =
    TextStyle(color: kAccent, fontWeight: FontWeight.bold);
const kHeaderStyle2 = TextStyle(
    fontFamily: 'Playfair',
    fontWeight: FontWeight.w500,
    color: kPurpleTextColour);
const kHeaderStyle3 = TextStyle(
    fontFamily: 'Playfair', fontWeight: FontWeight.w500, color: kPrimaryColour);

const kPurpleTextColour = Color(0xff270040);
const kShadowColour = Color(0xffd4d0d6);
const kErrorTextColour = Color(0xffc2327c);
const kHintTextColour = Color(0x80270040);

const kBoldLinkText =
    TextStyle(color: kPrimaryColour, fontWeight: FontWeight.bold, fontSize: 15);
const kNormalTextStyle = TextStyle(color: kPurpleTextColour, fontSize: 15);
const kNormalTextBold = TextStyle(
    color: kPurpleTextColour, fontWeight: FontWeight.bold, fontSize: 15);

const kHintTextDecoration = InputDecoration(
    hintText: 'Search for country prefix',
    hintStyle: TextStyle(
      color: Color(0x80270040),
    ));
const double kBudgetButtonHeight = 0.055;
const double kBudgetButtonWidth = 0.13;
const double kGigSoloCardContainerHeight = 0.35;
