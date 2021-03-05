import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_list/app/utils/dimens.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Spaces.space_2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).accentColor, onPrimary: Theme.of(context).backgroundColor),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
