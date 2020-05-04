import 'package:bumicov/src/utils/values/colors.dart';
import 'package:flutter/material.dart';

class AppBarCustom {
  static appBarStyle1(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: primaryColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title),
      centerTitle: true,
    );
  }
}
