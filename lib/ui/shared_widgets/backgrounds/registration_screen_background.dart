import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/top1.png'),
            width: size.width * 0.5,
          ),
          Positioned(
            top: 140,
            left: 220,
            child: Image.asset('assets/images/circle.png'),
            width: size.width * 1,
          ),
          child,
        ],
      ),
    );
  }
}
