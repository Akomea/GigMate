import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final bool visibility;
  final String errorText;

  const ErrorMessage({this.visibility, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
        child: Text(
          errorText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
