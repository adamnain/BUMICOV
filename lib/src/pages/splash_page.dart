import 'dart:async';
import 'package:bumicov/src/pages/navigation_page.dart';
import 'package:bumicov/src/utils/cutom_widget/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 3;
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future navigationPage() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavigationPage()));
      });
    } else {
      DialogUtils.dialogAlertNoCancel(context, "Internet Connection",
          "You dont have any connection.", "Exit", () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
      ),
      // body: Container(
      //   child: Image(
      //     image: AssetImage('assets/images/splash.png'),
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //   ),
      // ),
    );
  }
}
