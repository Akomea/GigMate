import 'package:flutter/material.dart';
import 'package:gigmate/ui/screens/auth/pin_verification_screen.dart';
import 'package:gigmate/utils/enums.dart';
import 'package:gigmate/core/providers/user_auth.dart';
import 'package:provider/provider.dart';

class Background extends StatefulWidget {
  final Widget child;

  Background({@required this.child});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  AnimationController controller, controller2;
  Animation animation, animation2;
  bool showErrorMessage = false;
  ConnectivityStatus connectionStatus;

  @override
  void initState() {
    PinCodeVerificationScreen.smsCodeHasError = true;
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    controller.forward();
    controller2.forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation2 = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);

    controller.addListener(() {
      setState(() {});
    });
    print('connection status1: $connectionStatus');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    connectionStatus = Provider.of<ConnectivityStatus>(context, listen: true);
    print('connection status2: $connectionStatus');
    // if (connectionStatus == null) {
    //   if (connectionStatus == ConnectivityStatus.Offline) {
    //     Provider.of<UserAuth>(context).toggleOfflineMessageVisibility(true);
    //   } else {
    //     Provider.of<UserAuth>(context).toggleOfflineMessageVisibility(false);
    //   }
    // }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('connection status3: $connectionStatus');
    UserAuth myUserAuth = Provider.of<UserAuth>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/topleft.png'),
            width: size.width * 0.35 * animation2.value,
          ),
          Positioned(
            top: 60,
            right: 4,
            child: Image.asset('assets/images/circle.png'),
            width: size.width * 0.3 + (animation.value * 20),
          ),
          widget.child,
        ],
      ),
    );
  }
}
