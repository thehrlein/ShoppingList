import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).accentColor,
      height: 1,
    );
  }
}
