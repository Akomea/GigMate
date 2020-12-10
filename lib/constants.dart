import 'package:flutter/material.dart';

const kPrimaryColour = Color(0xFF6F35A5);
const kSecondaryColour = Color(0xFFF1E6FF);
const kAccent = Color(0xFFF36B22);
const kInactiveColour = Color(0xff997d99);

const kOfflineErrorMessage = 'The internet connection appears to be offline';
const kInvalidPhoneErrorMessage = 'Oops...invalid phone number format :(';
const kIncorrectCodeErrorMessage = 'Oops...the sms code is incorrect :(';

const kHeaderStyle = TextStyle(
  fontFamily: 'Playfair',
  fontSize: 25.0,
  color: kPrimaryColour,
);
const kPurpleTextColour = Color(0xff270040);
const kErrorTextColour = Color(0xffc2327c);

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
