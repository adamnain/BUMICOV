import 'package:bumicov/src/blocs/covid_bloc/covid_bloc.dart';
import 'package:bumicov/src/utils/cutom_widget/button_cutom.dart';
import 'package:bumicov/src/utils/cutom_widget/launch_url_util.dart';
import 'package:bumicov/src/utils/values/colors.dart';
import 'package:bumicov/src/utils/values/dimens.dart';
import 'package:bumicov/src/utils/values/themes.dart';
import 'package:flutter/material.dart';

class HelpWidget {
  Widget headerContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 263.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/header_menu4.png'),
        ),
      ),
      child: Stack(
        children: <Widget>[
          // Image(
          //   image: AssetImage('assets/images/header_menu4.png'),
          //   width: MediaQuery.of(context).size.width,
          // ),
          Container(
            margin: EdgeInsets.only(top: 75.0, left: 23.0),
            child: Text(
              "Pusat\nBantuan",
              style: textStyleHeader,
            ),
          ),
        ],
      ),
    );
  }

  Widget mainContent(BuildContext context, CovidBloc _bloc) {
    return Container(
      margin: EdgeInsets.only(top: 210),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(marginActivity),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration: containerDecoration,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                contentTitle("Hubungi Call Center Covid-19"),
                cardItemHotline(),
                contentTitle("Rumah Sakit Rujukan di Sukabumi"),
                cardHospital(
                  "RS BHAKTI MEDICARE CICURUG",
                  "Jalan Raya Siliwangi No 186B Cicurug Kabupaten Sukabumi,Jawa Barat Kode Pos 43359",
                  "0266731555",
                ),
                cardHospital(
                  "RS Rujukan RS Syamsudin",
                  "Jl. Rumah Sakit No.1, Cikole, Kec. Cikole, Kota Sukabumi, Jawa Barat 43113",
                  "0266211358",
                ),
                cardHospital(
                  "UGD RS Plabuhan Ratu",
                  "Jl. Jend. Ahmad Yani No.2, Citepus, Kec. Pelabuhan Ratu, Sukabumi Regency, Jawa Barat 43364",
                  "0266432081",
                ),
                cardHospital(
                  "RSU Sekarwangi ",
                  "Cibadak, Kec. Cibadak, Sukabumi Regency, Jawa Barat 43351",
                  "0266531261",
                ),
                cardHospital(
                  "UGD RS Jampangkulon",
                  "Jl. Cibarusah No. 1 Desa Tanjung Jampang Kulon, Kab. Sukabumi Sukabumi, Jawa Barat, Indonesia 43178",
                  "0266490009",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget contentTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginSmall),
      child: Text(
        text,
        style: textStyleContentTitle,
      ),
    );
  }

  Widget cardItemHotline() {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(marginSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(marginSmall),
                decoration: new BoxDecoration(
                  border:
                      Border(left: BorderSide(color: primaryColor, width: 3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Kota Sukabumi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButtonBlue(
                      label: "0800-1000-119",
                      onPress: () {
                        LaunchUrlUtil.launchUrl("tel:0800-1000-119");
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: marginSmall),
                padding: EdgeInsets.all(marginSmall),
                decoration: new BoxDecoration(
                  border:
                      Border(left: BorderSide(color: primaryColor, width: 3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Kabupaten Sukabumi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        FlatButtonBlue(
                          label: "(0266) 6243816 ",
                          onPress: () {
                            LaunchUrlUtil.launchUrl("tel:02666243816");
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: marginSmall),
                          child: FlatButtonBlue(
                            label: "0812-1358-3160 ",
                            onPress: () {
                              LaunchUrlUtil.launchUrl("tel:0812-1358-3160");
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHospital(String hospital, String address, String hp) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(marginSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: marginSmall),
              child: Text(
                hospital,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Text(address),
            FlatButtonOrange(
                label: hp,
                onPress: () {
                  LaunchUrlUtil.launchUrl(hp);
                })
          ],
        ),
      ),
    );
  }
}
