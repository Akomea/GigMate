import 'dart:async';

import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gigmate/Screens/Welcome/Login/components/background.dart';
import 'package:gigmate/Screens/Welcome/Main/home_screen.dart';
import 'package:gigmate/Screens/Welcome/Main/pin_verification_screen.dart';
import 'package:gigmate/components/network_sensitive.dart';
import 'package:gigmate/components/rounded_text_field.dart';
import 'package:gigmate/components/special_roundedbutton.dart';
import 'package:gigmate/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  StreamController<ErrorAnimationType> errorController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  CountryCode country = CountryCode();
  bool isAbsorb = false;
  TextEditingController _phoneController = TextEditingController();
  String errorText = 'Invalid phone number format';
  Widget _suffixIcon = Icon(Icons.security_rounded, color: kSecondaryColour);
  bool offlineMessageIsNotVisible = false;
  bool emptyFieldMessageIsNotVisible = false;
  String phonePrefix;
  String phoneNumber = "";
  String selectedCountry = 'US';
  double buttonOpacity;
  FocusNode _focus = FocusNode();
  bool hasError = true;

  bool codeIsInvalid = false;

  Widget mutableIcon({bool useSpinner}) {
    Widget spinner = SpinKitChasingDots(
      color: kSecondaryColour,
      size: 20,
    );
    Widget securityIcon = Icon(Icons.security_rounded, color: kSecondaryColour);

    if (useSpinner) {
      _suffixIcon = spinner;
      return _suffixIcon;
    } else
      _suffixIcon = securityIcon;
    return _suffixIcon;
  }

  Future<bool> loginUser(String phone, BuildContext context) async {
    final _codeController = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),

      //Verification completed method
      verificationCompleted: (AuthCredential credential) async {
        print('I am from verification completed');
        Navigator.of(context).pop();
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        User user = userCredential.user;

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          setState(() {
            offlineMessageIsNotVisible = true;
          });
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        print('I am from verification failed');
        String errorCode = e.code;
        print("Verification failed reason: $e");
        print('YOUR ERROR CODE IS: $errorCode');
        if (errorCode != null) {
          setState(() {
            offlineMessageIsNotVisible = false;
          });
        }
        try {
          if (errorCode == 'invalid-phone-number') {
            setState(() {
              PinCodeVerificationScreen.smsCodeHasError = true;
              hasError = true;
              emptyFieldMessageIsNotVisible = true;
              mutableIcon(useSpinner: false);
            });
          } else {
            setState(() {
              offlineMessageIsNotVisible = true;
              mutableIcon(useSpinner: false);
            });
          }
        } on Exception catch (e) {
          print('I am from verification failed: $e');
        }
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        print('I am from code sent');

        setState(() {
          mutableIcon(useSpinner: false);
        });
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Form(
                key: formKey,
                child: PinCodeVerificationScreen(
                  phoneNumber: phoneNumber,
                  errorController: errorController,
                  smsCodeController: _codeController,
                  loginFunction: () async {
                    AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: _codeController.text.trim());

                    try {
                      UserCredential userCredential =
                          await auth.signInWithCredential(credential);
                      User user = userCredential.user;

                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      } else {
                        setState(() {
                          offlineMessageIsNotVisible = true;
                        });
                      }
                    } on Exception catch (e) {
                      if (e.toString() ==
                          '[firebase_auth/invalid-verification-code] The sms verification code used to create the phone auth credential is invalid. '
                              'Please resend the verification code sms and be sure use the verification code provided by the user.') {
                        codeIsInvalid = true;
                        setState(() {
                          PinCodeVerificationScreen.smsCodeHasError = true;
                        });
                        print('Invalid sms code');
                      }
                    }
                    formKey.currentState.validate();
// conditions for validating
                    if (phoneNumber.length != 6 ||
                        hasError == true ||
                        phoneNumber == null ||
                        phoneNumber == '') {
                      errorController.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() {
                        hasError = true;
                        PinCodeVerificationScreen.smsCodeHasError = true;
                      });
                    }
                  },
                ),
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId,
          [int forceResendingToken]) {
        print('I am from code retrieval timeout');

        setState(() {
          mutableIcon(useSpinner: false);
        });

        print('60 seconds up');
      },
    );
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.popAndPushNamed(context, HomeScreen.screenId);
    } else {
      print('failed bastard line 229 : User does not exit');
    }
    phonePrefix = '+1';

    if (_phoneController.text == null ||
        _phoneController.text == '' ||
        phoneNumber == '') {
      buttonOpacity = 0.5;
      isAbsorb = true;
    } else {
      buttonOpacity = 1.0;
      isAbsorb = false;
    }

    _focus.addListener(_onFocusChange);
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  void _onFocusChange() {
    if (_focus.hasFocus && _phoneController == null ||
        _phoneController.text == '') {
      setState(() {
        buttonOpacity = 0.5;
        isAbsorb = true;
      });
    } else
      isAbsorb = false;
    isAbsorb = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: kHeaderStyle,
            ),
            Image.asset('assets/images/livelymusic.png'),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        color: kSecondaryColour),
                    child: CountryCodePicker(
                      barrierColor: kSecondaryColour.withOpacity(0.2),
                      initialSelection: selectedCountry,
                      showFlag: true,
                      searchDecoration: InputDecoration(
                        hintText: 'Search for country prefix',
                        hintStyle: TextStyle(
                          color: kPurpleTextColour.withOpacity(0.5),
                        ),
                      ),
                      onChanged: (value) {
                        phonePrefix = value.dialCode;
                        print('I am from line 270: $phonePrefix');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextFieldContainer(
                      child: TextField(
                        controller: _phoneController,
                        focusNode: _focus,
                        autofocus: false,
                        cursorColor: kPrimaryColour,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          hintStyle: TextStyle(
                            color: kPrimaryColour.withOpacity(0.5),
                          ),
                          icon: Icon(
                            Icons.phone_android_rounded,
                            color: hasError ? Colors.red : kPrimaryColour,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          phoneNumber = phonePrefix + value;
                          if (phoneNumber.length == 12) {
                            _focus.unfocus();
                            setState(() {
                              mutableIcon(useSpinner: true);
                              isAbsorb = true;
                            });
                            loginUser(phoneNumber, context);
                          }

                          if (_focus.hasFocus) {
                            setState(() {
                              emptyFieldMessageIsNotVisible = false;
                              hasError = false;
                              buttonOpacity = 1.0;
                            });
                            if (_focus.hasFocus &&
                                    _phoneController.text == '' ||
                                _phoneController.text == null) {
                              setState(() {
                                hasError = true;
                                buttonOpacity = 0.5;
                                isAbsorb = true;
                              });
                            } else
                              setState(() {
                                hasError = false;
                                buttonOpacity = 1.0;
                                isAbsorb = false;
                              });
                          }
                          print('button is absorbed: $isAbsorb');
                          print('button is opaque: $buttonOpacity');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            NetworkSensitive(
              opacity: buttonOpacity,
              child: AbsorbPointer(
                absorbing: isAbsorb,
                child: SpecialRoundedButton(
                  suffixIcon: _suffixIcon,
                  bgColour: kPrimaryColour,
                  buttonText: 'Sign-In',
                  textColour: Colors.white,
                  onPressed: () {
                    phoneNumber = phonePrefix + _phoneController.text.trim();
                    print(phoneNumber);

                    if (_phoneController.text.isEmpty) {
                      setState(() {
                        buttonOpacity = 0.5;
                        emptyFieldMessageIsNotVisible = false;
                        isAbsorb = true;
                        print('phone number field is empty');
                      });
                      isAbsorb = false;
                    } else {
                      setState(() {
                        buttonOpacity = 1.0;
                        isAbsorb = false;
                        emptyFieldMessageIsNotVisible = false;
                      });
                      loginUser(phoneNumber, context);
                      setState(() {
                        mutableIcon(useSpinner: true);
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Column(
              children: [
                Visibility(
                  visible: offlineMessageIsNotVisible,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                    child: Text(
                      'The internet connection appears to be offline',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
                Visibility(
                  visible: emptyFieldMessageIsNotVisible,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                    child: Text(
                      'Oops...invalid phone number format :(',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Text(
                      'You may receive a One-Time Code via SMS for verification. Standard rates may apply.',
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
