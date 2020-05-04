import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData customTheme = ThemeData(
    fontFamily: 'montserrat',
    primaryColor: colors.primaryColor,
    accentColor: colors.accentColor,
    scaffoldBackgroundColor: colors.backgroundColor,
    appBarTheme: AppBarTheme(
        elevation: 0.5,
        textTheme: TextTheme(
          title: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
          ),
        ).apply(
          bodyColor: colors.primaryColor,
          displayColor: colors.primaryColor,
        ),
        color: colors.backgroundColor,
        iconTheme: IconThemeData(
          color: colors.primaryColor,
        )),
    buttonTheme: ButtonThemeData(
        buttonColor: colors.accentLightColor,
        disabledColor: colors.primaryColorDark));

final textStyleHeader =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white);

final textStyleContentTitle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);

final containerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: const Radius.circular(40.0),
    topRight: const Radius.circular(40.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black45,
      blurRadius: 2.0, // has the effect of softening the shadow
      spreadRadius: 0.5, // has the effect of extending the shadow
      offset: Offset(
        1.0, // horizontal, move right 10
        1.0, // vertical, move down 10
      ),
    )
  ],
);
