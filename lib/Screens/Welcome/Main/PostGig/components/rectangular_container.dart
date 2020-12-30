import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class RectangularContainer extends StatelessWidget {
  final Widget child;

  final Function onTapped;
  final double width;
  final double height;
  final Color colour;

  const RectangularContainer(
      {this.child,
      this.onTapped,
      this.width,
      this.height,
      this.colour = Colors.white});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTapped,
      child: Container(
          height: _size.height * height,
          width: _size.width * width,
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            boxShadow: kTextFieldContainerShadow,
            borderRadius: BorderRadius.circular(5),
            color: colour,
          ),
          child: child),
    );
  }
}
