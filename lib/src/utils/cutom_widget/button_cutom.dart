import 'package:bumicov/src/utils/values/colors.dart';
import 'package:flutter/material.dart';

class FlatButtonBlue extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonBlue({Key key, this.label, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: lightBlueMaterial,
      textColor: primaryColor,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: accentColor,
      onPressed: onPress,
      child: Text(label),
    );
  }
}

class FlatButtonOrange extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonOrange({Key key, this.label, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: lightOrangeMaterial,
      textColor: Colors.black,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: lightBlueMaterial,
      onPressed: onPress,
      child: Text(label),
    );
  }
}
