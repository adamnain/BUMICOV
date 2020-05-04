import 'package:flutter/material.dart';

class DialogUtils {
  static void dialogAlertNoCancel(BuildContext context, String title,
      String body, String actionText, Function onPress) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title ?? ''),
          content: new Text(body ?? ''),
          actions: <Widget>[
            new FlatButton(
              child: new Text(actionText),
              onPressed: onPress,
            ),
          ],
        );
      },
    );
  }
}
