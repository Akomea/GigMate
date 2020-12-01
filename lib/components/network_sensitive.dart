import 'package:flutter/material.dart';
import 'package:gigmate/enum/connectivity_status.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  NetworkSensitive({
    this.child,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return child;
    }
    return AbsorbPointer(
      child: Opacity(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
