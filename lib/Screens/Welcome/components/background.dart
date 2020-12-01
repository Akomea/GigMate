import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({@required this.child});

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //provides total height and width of screen

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: size.width * 0.5,
            child: Image.asset('assets/images/top1.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            width: size.width * 0.35,
            child: Image.asset('assets/images/bottom1.png'),
          ),
          child,
          Positioned(
            bottom: 0,
            child: Image.asset('assets/images/lowermusicians.png'),
            width: size.width * 0.9,
          ),
        ],
      ),
    );
  }
}
