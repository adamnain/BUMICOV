import 'package:bumicov/src/utils/cutom_widget/button_cutom.dart';
import 'package:bumicov/src/utils/cutom_widget/launch_url_util.dart';
import 'package:bumicov/src/utils/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AboutWidget {
  Widget cardContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginSmall),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(marginSmall),
          child: ListView(
            children: <Widget>[
              Text(
                  "BUMICOV diinisialisasi oleh @adamnain Jika teman-teman ingin ikut berkontribusi silahkan gabung dalam grup berikut."),
              FlatButtonBlue(
                label: 'Gabung Telegram Grup',
                onPress: () {
                  LaunchUrlUtil.launchUrl(
                      'https://t.me/joinchat/Rhv14hP1vy2oJD-naQ9NmA');
                },
              ),
              Text(
                  "Atau teman-teman sekedar bisa bagiakan aplikasi BUMICOV ke Media Sosial."),
              FlatButtonOrange(
                label: 'Bagiakan Ke Media Sosial',
                onPress: () {
                  Share.share(
                      'Saya telah mengunduh aplikasi "BUMICOV - Sukabumi vs Covid-19" pada tautan https://bit.ly/bumicov semoga bermanfaat #sukabumilawancorona');
                },
              ),
              Text(
                "Sumber data COVID-19 didapatkan dari:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("- https://pikobar.jabarprov.go.id"),
              Text("- http://www.pikokami.sukabumikab.go.id"),
              Text("- https://covid19.sukabumikota.go.id"),
              Text("- https://newsapi.org"),
            ],
          ),
        ),
      ),
    );
  }

  Widget bgInfo(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/images/bg_info.png'),
          ),
        ),
        //child: Image.asset('assets/images/bg_info.png')),
      ),
    );
  }
}
