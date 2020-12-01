import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:gigmate/components/special_roundedbutton.dart';
import 'package:gigmate/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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

  StreamController<ErrorAnimationType> errorController;

  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  bool isResendTextVisible = true;

  bool isCountdownTimerVisible = true;

  FocusNode _focus = FocusNode();

  double buttonOpacity = 0.5;
  bool isAbsorb = false;

  @override
  void initState() {
    if (widget.smsCodeController.text == null ||
        widget.smsCodeController.text == '') {
      buttonOpacity = 0.5;
      isAbsorb = true;
    }
    buttonOpacity = 1;
    isAbsorb = false;
    _focus.addListener(_onFocusChange);
    // onTapRecognizer = TapGestureRecognizer()
    //   ..onTap = () {
    //     Navigator.pop(context);
    //   };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: widget.phoneNumber,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style:
                            TextStyle(color: kPurpleTextColour, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      print('edit text pressed');
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 20.0,
                        color: kSecondaryColour,
                        child: Center(
                          child: Text(
                            'Edit phone number',
                            style: TextStyle(
                                color: kPrimaryColour, fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                          if (v.length != 6) {
                            PinCodeVerificationScreen.smsCodeHasError = true;

                            return "";
                          } else {
                            PinCodeVerificationScreen.smsCodeHasError = false;
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
                          activeColor: PinCodeVerificationScreen.smsCodeHasError
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
                            color: PinCodeVerificationScreen.smsCodeHasError ==
                                    true
                                ? kAccent
                                : Colors.black12,
                            blurRadius: 10,
                          )
                        ],

                        onCompleted: (v) {
                          print("Completed:$v");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                            if (_focus.hasFocus) {
                              setState(() {
                                PinCodeVerificationScreen.smsCodeHasError =
                                    false;
                              });
                              if (_focus.hasFocus &&
                                      widget.smsCodeController.text == '' ||
                                  widget.smsCodeController.text == null) {
                                setState(() {
                                  PinCodeVerificationScreen.smsCodeHasError =
                                      true;
                                  buttonOpacity = 0.5;
                                  isAbsorb = true;
                                });
                              } else
                                setState(() {
                                  buttonOpacity = 1.0;
                                  isAbsorb = false;
                                });
                            }
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      PinCodeVerificationScreen.smsCodeHasError == true
                          ? "*Please fill up all the cells properly"
                          : "",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCountdownTimerVisible,
                  child: CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (context, remainingTime) {
                      if (remainingTime != null) {
                        String numOfSec = remainingTime.sec.toString();
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Resend Code in ',
                            style: kNormalTextStyle,
                            children: [
                              TextSpan(text: '$numOfSec', style: kBoldLinkText),
                            ],
                          ),
                        );
                      }
                      return Text('');
                    },
                  ),
                ),
                Visibility(
                  visible: isResendTextVisible,
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
                Opacity(
                  opacity: buttonOpacity,
                  child: AbsorbPointer(
                    absorbing: isAbsorb,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: SpecialRoundedButton(
                        suffixIcon: Icon(
                          Icons.security_rounded,
                          color: kSecondaryColour,
                        ),
                        bgColour: kPrimaryColour,
                        textColour: kSecondaryColour,
                        buttonText: 'Verify',
                        onPressed: widget.loginFunction,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFocusChange() {
    if (_focus.hasFocus && widget.smsCodeController == null) {
      setState(() {
        buttonOpacity = 0.5;
      });
    }
  }
}
