import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    @required Size size,
    this.icon,
    this.label,
    this.borderColour = kSecondaryColour,
    this.bgColour,
    this.onTapped,
    this.bgShadow,
  }) : _size = size;

  final Size _size;
  final Icon icon;
  final String label;
  final borderColour;
  final bgColour;
  final bgShadow;
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                boxShadow: bgShadow,
                color: bgColour,
                border: Border.all(color: borderColour),
                borderRadius: BorderRadius.circular(15)),
            child: icon,
            height: _size.height * 0.06,
            width: _size.width * 0.2,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
