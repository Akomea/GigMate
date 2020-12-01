import 'package:flutter/material.dart';

class NormalRoundedButton extends StatelessWidget {
  final Color bgColour, textColour;
  final String buttonText;
  final Function onPressed;

  NormalRoundedButton(
      {this.bgColour, this.textColour, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //provides total height and width of screen
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 30.0,
            color: Color(0xFF666696).withOpacity(0.4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: bgColour,
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: textColour, fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
  }
}
