import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/constants.dart';

class MutableIcon extends StatelessWidget {
  final bool useSpinner;
  static bool spin;

  const MutableIcon({this.useSpinner});

  Widget mutableIcon({bool useSpinner}) {
    Widget spinner = SpinKitChasingDots(
      color: kSecondaryColour,
      size: 20,
    );
    Widget securityIcon = Icon(Icons.security_rounded, color: kSecondaryColour);

    if (useSpinner) {
      spin = true;
      return spinner;
    } else
      spin = false;
    return securityIcon;
  }

  @override
  Widget build(BuildContext context) {
    return mutableIcon(useSpinner: useSpinner);
  }
}
