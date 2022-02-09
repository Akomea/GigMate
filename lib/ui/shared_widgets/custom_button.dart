import 'package:flutter/material.dart';
import 'package:gigmate/locale/locales.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: onTap as void Function(),
        child: Text(
          text == null
              ? AppLocalizations.of(context).continueText.toUpperCase()
              : text.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
