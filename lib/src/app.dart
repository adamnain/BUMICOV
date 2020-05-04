import 'package:bumicov/src/pages/home/home_page.dart';
import 'package:bumicov/src/pages/navigation_page.dart';
import 'package:bumicov/src/pages/splash_page.dart';
import 'package:bumicov/src/utils/values/themes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BUMICOV",
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: SplashScreen(),
    );
  }
}
