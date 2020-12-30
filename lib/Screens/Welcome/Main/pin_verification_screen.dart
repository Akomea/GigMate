import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:gigmate/Screens/Welcome/Login/login_screen.dart';
import 'package:gigmate/components/error_message.dart';
import 'package:gigmate/components/pill_button.dart';
import 'package:gigmate/components/special_roundedbutton.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/mutable_icon.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../user_auth.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  static bool smsCodeHasError = false;
  final String phoneNumber;
  final TextEditingController smsCodeController;
  final Function loginFunction;
  static final String screenId = 'verification_screen';
  final StreamController<ErrorAnimationType> errorController;

  PinCodeVerificationScreen(
      {this.phoneNumber,
      this.smsCodeController,
      this.loginFunction,
      this.errorController});

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String currentText = "";
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  bool isResendTextVisible = true;
  bool isCountdownTimerVisible = true;
  FocusNode _focus = FocusNode();

  MutableIcon _suffixIcon = MutableIcon(
    useSpinner: false,
  );

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    // onTapRecognizer = TapGestureRecognizer()
    //   ..onTap = () {
    //     Navigator.pop(context);
    //   };
    if (mounted) {
      widget.smsCodeController.clear();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.errorController.close();
    super.dispose();
  }

  MutableIcon getIcon(BuildContext context, bool spin) {
    return _suffixIcon = Provider.of<UserAuth>(context).toggleSpinner(spin);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuth>(
      builder: (context, myUserAuth, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          body: GestureDetector(
            onTap: () {},
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Phone Number Verification',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: kPurpleTextColour),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                          text: "Enter the code sent to ",
                          children: [
                            TextSpan(
                              text: widget.phoneNumber,
                              style: kNormalTextBold,
                            ),
                          ],
                          style: kNormalTextStyle,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    PillButton(
                      buttonText: 'Edit phone number',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.screenId);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            autoFocus: true,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            focusNode: _focus,
                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.scale,
                            validator: (v) {
                              if (v.isNotEmpty) {
                                myUserAuth.toggleHasError(false);
                              } else {
                                myUserAuth.errorShakeAnimation();
                                myUserAuth.toggleHasError(true);
                                myUserAuth.toggleSpinner(false);
                              }
                              if (v.length != 6) {
                                myUserAuth.toggleHasError(true);
                                myUserAuth.toggleAbsorb(true);
                                return "Enter a 6-digit code for verification";
                              } else {
                                myUserAuth.toggleHasError(false);
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              inactiveFillColor: Colors.white,
                              inactiveColor: kSecondaryColour,
                              activeFillColor: Colors.white,
                              selectedFillColor: Colors.white,
                              selectedColor: Colors.green,
                              shape: PinCodeFieldShape.circle,
                              fieldHeight: 60,
                              fieldWidth: 50,
                              activeColor:
                                  PinCodeVerificationScreen.smsCodeHasError
                                      ? kSecondaryColour
                                      : kSecondaryColour,
                            ),
                            cursorColor: Colors.white,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20, height: 1.6),
                            backgroundColor: Colors.white,
                            enableActiveFill: true,
                            errorAnimationController: widget.errorController,
                            controller: widget.smsCodeController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: myUserAuth.hasError
                                    ? kAccent
                                    : Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              myUserAuth
                                  .toggleEmptyFieldMessageVisibility(false);
                              print(value);
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )),
                    ),
                    Visibility(
                      visible: isCountdownTimerVisible,
                      child: CountdownTimer(
                        controller: CountdownTimerController(endTime: endTime),
                        widgetBuilder: (context, remainingTime) {
                          if (remainingTime != null) {
                            String numOfSec = remainingTime.sec.toString();
                            return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Resend Code in ',
                                style: kNormalTextStyle,
                                children: [
                                  TextSpan(
                                      text: '$numOfSec', style: kBoldLinkText),
                                ],
                              ),
                            );
                          }
                          return Text('');
                        },
                      ),
                    ),
                    ErrorMessage(
                      visibility: myUserAuth.invalidErrorMessageVisibility,
                      errorText: kIncorrectCodeErrorMessage,
                    ),
                    Visibility(
                      visible: myUserAuth.resendVisibility,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Didn't receive the code? ",
                            style: kNormalTextStyle,
                            children: [
                              TextSpan(
                                  text: " RESEND",
                                  recognizer: onTapRecognizer,
                                  style: kBoldLinkText),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: SpecialRoundedButton(
                        suffixIcon: myUserAuth.mutableIcon,
                        bgColour: kPrimaryColour,
                        textColour: kSecondaryColour,
                        buttonText: 'Verify',
                        onPressed: widget.loginFunction,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onFocusChange() {
    if (_focus.hasFocus && widget.smsCodeController == null) {}
  }
}
