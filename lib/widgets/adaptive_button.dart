import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {

  final String text;
  final Function showDatePicker;

  AdaptiveButton(this.text, this.showDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
          ? CupertinoButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: showDatePicker,
      )
          : FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        textColor: Theme.of(context).primaryColor,
        onPressed: showDatePicker,
      );
  }
}
