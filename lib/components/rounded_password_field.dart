import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

import 'rounded_text_field.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({Key key, this.onChanged}) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  IconData suffixIcon = Icons.visibility;
  bool isVisible = true;
  bool isObscure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suffixIcon = Icons.visibility;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedTextField(
      hintText: 'Password',
      icon: Icons.lock,
      isObscure: isObscure,
      onChanged: this.widget.onChanged,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            if (isVisible) {
              suffixIcon = Icons.cancel;
              isVisible = false;
              isObscure = false;
            } else {
              suffixIcon = Icons.visibility;
              isVisible = true;
              isObscure = true;
            }
          });
        },
        child: Icon(
          suffixIcon,
          color: kPrimaryColour,
        ),
      ),
    );
  }
}
