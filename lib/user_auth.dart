import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/enum/connectivity_status.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'Screens/Welcome/Main/home_screen.dart';
import 'Screens/Welcome/Main/pin_verification_screen.dart';
import 'mutable_icon.dart';

class UserAuth extends ChangeNotifier {
  StreamController<ErrorAnimationType> errorController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool offlineMessageVisibility = false;
  bool smsCodeHasError = false;
  bool invalidErrorMessageVisibility = false;
  bool hasError = false;
  bool codeIsInvalid = false;
  bool isAbsorb = false;
  String phoneNumber;
  double buttonOpacity;
  bool spin = false;
  User currentUser;
  final _codeController = TextEditingController();
  MutableIcon mutableIcon = MutableIcon(
    useSpinner: false,
  );
  ConnectivityStatus connectionStatus;

  bool resendVisibility = false;

  int myTimeout = 60;

  void toggleOfflineMessageVisibility(bool value) {
    offlineMessageVisibility = value;
    notifyListeners();
  }

  void toggleAbsorb(bool value) {
    isAbsorb = value;
    notifyListeners();
  }

  double toggleOpacity(double value) {
    double result;
    buttonOpacity = value;
    result = buttonOpacity;
    notifyListeners();
    return result;
  }

  bool toggleHasError(bool value) {
    bool result;
    hasError = value;
    result = hasError;
    notifyListeners();
    return result;
  }

  bool toggleEmptyFieldMessageVisibility(bool value) {
    bool result;
    invalidErrorMessageVisibility = value;
    result = invalidErrorMessageVisibility;
    notifyListeners();
    return result;
  }

  void toggleButtonOpacity(double value) {
    buttonOpacity = value;
    notifyListeners();
  }

  MutableIcon toggleSpinner(bool value) {
    mutableIcon = MutableIcon(
      useSpinner: value,
    );
    spin = value;
    notifyListeners();
    return mutableIcon;
  }

  Future<bool> loginUser(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: myTimeout),

      //Verification completed method
      verificationCompleted: (AuthCredential credential) async {
        print('I am from verification completed');
        toggleSpinner(false);
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        currentUser = userCredential.user;

        if (currentUser != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          offlineMessageVisibility = true;
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        toggleSpinner(false);
        print('I am from verification failed');
        String errorCode = e.code;
        print("Verification failed reason: $e");
        print('YOUR ERROR CODE IS: $errorCode');
        if (errorCode != null) {
          offlineMessageVisibility = false;
        }
        try {
          if (errorCode == 'invalid-phone-number') {
            smsCodeHasError = true;
            hasError = true;
            toggleEmptyFieldMessageVisibility(true);
            toggleSpinner(false);
          } else {
            offlineMessageVisibility = true;
            toggleSpinner(false);
          }
        } on Exception catch (e) {
          print('I am from verification failed: $e');
        }
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        print('I am from code sent');
        toggleSpinner(false);
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
                    loginFunction: () {
                      toggleSpinner(true);
                      myPhoneSignIn(verificationId, context, auth);
                    }),
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId,
          [int forceResendingToken]) {
        print('I am from code retrieval timeout');
        toggleSpinner(false);
        toggleOpacity(0.5);
        toggleAbsorb(true);
        showResendMessage(true);
        print('60 seconds up');
      },
    );
    notifyListeners();
    return true;
  }

  void errorShakeAnimation() {
    errorController
        .add(ErrorAnimationType.shake); // Triggering error shake animation
    notifyListeners();
  }

  void myPhoneSignIn(
      String verificationId, BuildContext context, FirebaseAuth auth) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: _codeController.text.trim());
    if (_codeController.text.trim() == null ||
        _codeController.text.trim() == '' ||
        _codeController.text.trim().length != 6) {
      toggleAbsorb(true);
      //TODO TRIGGER ERROR VALIDATION
      toggleHasError(true);
    } else {
      toggleAbsorb(false);
      toggleHasError(true);
    }
    toggleSpinner(true);

    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User user = userCredential.user;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        offlineMessageVisibility = true;
      }
    } on Exception catch (e) {
      if (e.toString() ==
          '[firebase_auth/invalid-verification-code] The sms verification code used to create the phone auth credential is invalid. '
              'Please resend the verification code sms and be sure use the verification code provided by the user.') {
        toggleEmptyFieldMessageVisibility(true);
        errorShakeAnimation();
        toggleSpinner(false);
        print('Invalid sms code');
      }
    }
    //formKey.currentState.validate();
// conditions for validating
    if (phoneNumber.length != 6 ||
        hasError == true ||
        phoneNumber == null ||
        phoneNumber == '') {
      errorShakeAnimation();
      hasError = true;
      PinCodeVerificationScreen.smsCodeHasError = true;
      //TODO SET PIN THEME SHADOW COLOUR
    }
  }

  bool showResendMessage(bool value) {
    bool result;
    resendVisibility = value;
    result = resendVisibility;
    notifyListeners();
    return result;
  }
}
