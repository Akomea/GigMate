import 'package:flutter/material.dart';

class SpecialRoundedButton extends StatelessWidget {
  final Color bgColour, textColour;
  final String buttonText;
  final Function onPressed;
  final Widget suffixIcon;

  SpecialRoundedButton(
      {this.bgColour,
      this.textColour,
      this.buttonText,
      this.onPressed,
      this.suffixIcon});

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
            color: Color(0xFF666696).withOpacity(0.5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: bgColour,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                    color: textColour,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0),
              ),
              Spacer(),
              suffixIcon,
            ],
          ),
        ),
      ),
    );
  }
}
