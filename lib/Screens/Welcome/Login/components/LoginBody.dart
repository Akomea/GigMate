import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Login/components/background.dart';
import 'package:gigmate/Screens/Welcome/Main/home_screen.dart';
import 'package:gigmate/components/bottom_error_message.dart';
import 'package:gigmate/components/error_message.dart';
import 'package:gigmate/components/rounded_text_field.dart';
import 'package:gigmate/components/special_roundedbutton.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/enum/connectivity_status.dart';
import 'package:gigmate/user_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController _phoneController = TextEditingController();

  Widget _suffixIcon = Icon(
    Icons.security_rounded,
    color: kSecondaryColour,
  );
  String phonePrefix;
  String phoneNumber = "";
  String selectedCountry = 'US';
  FocusNode _focus = FocusNode();
  ConnectivityStatus connectionStatus;

//   Future<bool> loginUser(String phone, BuildContext context) async {
//     final _codeController = TextEditingController();
//     FirebaseAuth auth = FirebaseAuth.instance;
//     auth.verifyPhoneNumber(
//       phoneNumber: phone,
//       timeout: Duration(seconds: 60),
//
//       //Verification completed method
//       verificationCompleted: (AuthCredential credential) async {
//         print('I am from verification completed');
//         Navigator.of(context).pop();
//         UserCredential userCredential =
//             await auth.signInWithCredential(credential);
//         User user = userCredential.user;
//
//         if (user != null) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomeScreen(),
//             ),
//           );
//         } else {
//           setState(() {
//             offlineMessageIsNotVisible = true;
//           });
//         }
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print('I am from verification failed');
//         String errorCode = e.code;
//         print("Verification failed reason: $e");
//         print('YOUR ERROR CODE IS: $errorCode');
//         if (errorCode != null) {
//           setState(() {
//             offlineMessageIsNotVisible = false;
//           });
//         }
//         try {
//           if (errorCode == 'invalid-phone-number') {
//             setState(() {
//               PinCodeVerificationScreen.smsCodeHasError = true;
//               hasError = true;
//               emptyFieldMessageIsNotVisible = true;
//               mutableIcon(useSpinner: false);
//             });
//           } else {
//             setState(() {
//               offlineMessageIsNotVisible = true;
//               mutableIcon(useSpinner: false);
//             });
//           }
//         } on Exception catch (e) {
//           print('I am from verification failed: $e');
//         }
//       },
//       codeSent: (String verificationId, [int forceResendingToken]) {
//         print('I am from code sent');
//
//         setState(() {
//           mutableIcon(useSpinner: false);
//         });
//         showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (context) {
//               return Form(
//                 key: formKey,
//                 child: PinCodeVerificationScreen(
//                   phoneNumber: phoneNumber,
//                   errorController: errorController,
//                   smsCodeController: _codeController,
//                   loginFunction: () async {
//                     AuthCredential credential = PhoneAuthProvider.credential(
//                         verificationId: verificationId,
//                         smsCode: _codeController.text.trim());
//
//                     try {
//                       UserCredential userCredential =
//                           await auth.signInWithCredential(credential);
//                       User user = userCredential.user;
//
//                       if (user != null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomeScreen(),
//                           ),
//                         );
//                       } else {
//                         setState(() {
//                           offlineMessageIsNotVisible = true;
//                         });
//                       }
//                     } on Exception catch (e) {
//                       if (e.toString() ==
//                           '[firebase_auth/invalid-verification-code] The sms verification code used to create the phone auth credential is invalid. '
//                               'Please resend the verification code sms and be sure use the verification code provided by the user.') {
//                         codeIsInvalid = true;
//                         setState(() {
//                           PinCodeVerificationScreen.smsCodeHasError = true;
//                         });
//                         print('Invalid sms code');
//                       }
//                     }
//                     formKey.currentState.validate();
// // conditions for validating
//                     if (phoneNumber.length != 6 ||
//                         hasError == true ||
//                         phoneNumber == null ||
//                         phoneNumber == '') {
//                       errorController.add(ErrorAnimationType
//                           .shake); // Triggering error shake animation
//                       setState(() {
//                         hasError = true;
//                         PinCodeVerificationScreen.smsCodeHasError = true;
//                         //TODO SET PIN THEME SHADOW COLOUR
//                       });
//                     }
//                   },
//                 ),
//               );
//             });
//       },
//       codeAutoRetrievalTimeout: (String verificationId,
//           [int forceResendingToken]) {
//         print('I am from code retrieval timeout');
//
//         setState(() {
//           mutableIcon(useSpinner: false);
//         });
//
//         print('60 seconds up');
//       },
//     );
//     return true;
//   }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    connectionStatus = Provider.of<ConnectivityStatus>(context);
    _focus.addListener(_onFocusChange);
    Provider.of<UserAuth>(context).errorController =
        StreamController<ErrorAnimationType>();

    if (_phoneController.text == null ||
        _phoneController.text == '' ||
        Provider.of<UserAuth>(context).phoneNumber == '') {
      Provider.of<UserAuth>(context).toggleOpacity(0.5);
      Provider.of<UserAuth>(context).toggleAbsorb(true);
      Provider.of<UserAuth>(context).toggleHasError(true);
    } else {
      Provider.of<UserAuth>(context).toggleOpacity(1.0);
      Provider.of<UserAuth>(context).toggleAbsorb(false);
    }
    super.didChangeDependencies();
  }

  void _onFocusChange() {
    if (_focus.hasFocus && _phoneController == null ||
        _phoneController.text == '') {
      Provider.of<UserAuth>(context, listen: false).buttonOpacity = 0.5;
      Provider.of<UserAuth>(context, listen: false).isAbsorb = true;
    } else
      Provider.of<UserAuth>(context, listen: false).isAbsorb = false;
    Provider.of<UserAuth>(context, listen: false).isAbsorb = false;
  }

  @override
  Widget build(BuildContext context) {
    if (connectionStatus == ConnectivityStatus.Offline ||
        connectionStatus == null) {
      Provider.of<UserAuth>(context).toggleOfflineMessageVisibility(true);
      Provider.of<UserAuth>(context).toggleAbsorb(true);
      Provider.of<UserAuth>(context).toggleHasError(true);
      Provider.of<UserAuth>(context).toggleOpacity(0.5);
    } else {
      Provider.of<UserAuth>(context).toggleOfflineMessageVisibility(false);
    }
    Size size = MediaQuery.of(context).size;
    return Consumer<UserAuth>(
      builder: (context, myUserAuth, child) {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: kSecondaryColour),
                        child: CountryCodePicker(
                          barrierColor: kSecondaryColour.withOpacity(0.2),
                          initialSelection: selectedCountry,
                          showFlag: true,
                          searchDecoration: kHintTextDecoration,
                          onChanged: (value) {
                            phonePrefix = value.dialCode;
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
                                color: myUserAuth.hasError
                                    ? Colors.red
                                    : kPrimaryColour,
                              ),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (v) {
                              myUserAuth.toggleSpinner(true);
                              myUserAuth.loginUser(context);
                            },
                            onChanged: (value) {
                              myUserAuth
                                  .toggleEmptyFieldMessageVisibility(false);
                              myUserAuth.phoneNumber = phonePrefix + value;
                              if (_focus.hasFocus) {
                                myUserAuth
                                    .toggleOfflineMessageVisibility(false);
                                myUserAuth.toggleHasError(false);
                              }
                              if (_focus.hasFocus &&
                                      _phoneController.text == '' ||
                                  _phoneController.text == null) {
                                myUserAuth.toggleHasError(true);
                                myUserAuth.toggleOpacity(0.5);
                                myUserAuth.toggleAbsorb(true);
                              } else
                                myUserAuth.toggleHasError(false);
                              myUserAuth.toggleOpacity(1.0);
                              myUserAuth.toggleAbsorb(false);
                              myUserAuth.toggleHasError(false);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Opacity(
                  opacity: myUserAuth.buttonOpacity,
                  child: AbsorbPointer(
                    absorbing: myUserAuth.isAbsorb,
                    child: SpecialRoundedButton(
                        suffixIcon: myUserAuth.mutableIcon,
                        bgColour: kPrimaryColour,
                        buttonText: 'Sign-In',
                        textColour: Colors.white,
                        onPressed: () {
                          myUserAuth.toggleSpinner(true);
                          print('user phone number: ${myUserAuth.phoneNumber}');
                          print('phone controller: ${_phoneController.text}');
                          myUserAuth.phoneNumber =
                              phonePrefix + _phoneController.text.trim();
                          print(myUserAuth.phoneNumber);

                          if (_phoneController.text.isEmpty ||
                              myUserAuth.phoneNumber.length < 12) {
                            myUserAuth.toggleEmptyFieldMessageVisibility(true);
                          } else {
                            myUserAuth.toggleEmptyFieldMessageVisibility(false);
                          }
                          myUserAuth.loginUser(context);
                        }),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Column(
                  children: [
                    ErrorMessage(
                      visibility: myUserAuth.offlineMessageVisibility,
                      errorText: kOfflineErrorMessage,
                    ),
                    ErrorMessage(
                      visibility: myUserAuth.invalidErrorMessageVisibility,
                      errorText: kInvalidPhoneErrorMessage,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Text(
                          'You may receive a One-Time Code via SMS for verification. Standard rates may apply.',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
                Visibility(
                  visible: myUserAuth.offlineMessageVisibility,
                  child: BottomErrorMessage(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
