import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class BottomErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        width: double.infinity,
        color: Color(0xffffe6ee),
        child: FlashBar(
          shouldIconPulse: true,
          message: Text(
            'Waiting for network',
            style: TextStyle(color: kErrorTextColour),
          ),
          icon: SpinKitChasingDots(
            color: kErrorTextColour,
            size: 20,
          ),
          leftBarIndicatorColor: kErrorTextColour,
        ),
      ),
    );
  }
}
