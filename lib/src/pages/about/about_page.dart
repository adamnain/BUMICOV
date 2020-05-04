import 'package:bumicov/src/utils/cutom_widget/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'about_widget.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with AboutWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom.appBarStyle1(context, "INFO"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            bgInfo(context),
            cardContent(context),
          ],
        ),
      ),
    );
  }
}
