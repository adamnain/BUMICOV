import 'package:bumicov/src/blocs/covid_bloc/covid_bloc.dart';
import 'package:bumicov/src/models/covid_model.dart';
import 'package:bumicov/src/pages/about/about_page.dart';
import 'package:bumicov/src/utils/cutom_widget/loading_shimmer.dart';
import 'package:bumicov/src/utils/cutom_widget/web_view.dart';
import 'package:bumicov/src/utils/values/colors.dart';
import 'package:bumicov/src/utils/values/dimens.dart';
import 'package:bumicov/src/utils/values/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget {
  Widget headerContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 263,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/header_menu1.png'),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 75.0, left: 23.0),
            child: Text(
              "Sukabumi\nvs Covid-19",
              style: textStyleHeader,
            ),
          ),
          Positioned(
            top: 40,
            right: 15,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
              child: Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
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
                BlocProvider(
                  create: (_) => _bloc,
                  child: BlocListener<CovidBloc, CovidState>(
                    listener: (context, state) {
                      if (state is CovidError) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<CovidBloc, CovidState>(
                      builder: (context, state) {
                        if (state is CovidInitial) {
                          return ShimmerLoad.buildCardLoading();
                        } else if (state is CovidLoading) {
                          return ShimmerLoad.buildCardLoading();
                        } else if (state is CovidLoaded) {
                          // return buildList(context, state.covidModel);
                          return buildStats(context, state.covidModel);
                        } else if (state is CovidError) {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
                cardCovidTest(context),
                contentTitle("Pranala-pranala Penting"),
                cardItemPranala(
                    context,
                    "Peta Kasus Sebaran Covid-19 di Indonesia",
                    "https://experience.arcgis.com/experience/bf4eb5d76e98423c865678e32c8937d4"),
                cardItemPranala(context, "Peta Kasus Sebaran Covid-19 Global",
                    "https://gisanddata.maps.arcgis.com/apps/opsdashboard/index.html#/85320e2ea5424dfaaa75ae62e5c06e61"),
                cardItemPranala(
                    context,
                    "Kominfo - Kumpulan Hoaks Terkait Virus Corona",
                    "https://kominfo.go.id/content/all/virus_corona")
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

  Widget cardCovidStat(
      String totalPositive, String totalHealty, String totalDeath) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(marginSmall),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/logo_positif.png'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: marginSmall),
                      child: Text(
                        totalPositive,
                        style: TextStyle(
                            color: yellowMaterial,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Positif",
                      style: TextStyle(
                          color: yellowMaterial,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(marginSmall),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        'assets/images/logo_sembuh.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: marginSmall),
                      child: Text(
                        totalHealty,
                        style: TextStyle(
                            color: greenMaterial,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Sembuh",
                      style: TextStyle(
                          color: greenMaterial,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(marginSmall),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/logo_meninggal.png'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: marginSmall),
                      child: Text(
                        totalDeath,
                        style: TextStyle(
                            color: redMaterial,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Meninggal",
                      style: TextStyle(
                          color: redMaterial,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardCovidTest(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              title: "COVID TEST",
              url:
                  "https://covid19.prixa.ai/partner/80b47a20-1353-49e9-af91-a0a5995ca89f/app/52b7d983-3e5d-49cc-9c99-508dc779aad3",
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: marginActivity),
        decoration: BoxDecoration(
          color: lightBlueMaterial,
          borderRadius: BorderRadius.all(const Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                0.0,
                2.0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child:
                    Image.asset('assets/images/covid_test_illustration.png')),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: marginSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: marginSmall),
                      child: Text(
                        'Tes Kesehatan Anda',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    Text(
                        'Tes kesehatan Anda guna memprediksi virus corona sejak dini'),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Icon(Icons.chevron_right))
          ],
        ),
      ),
    );
  }

  Widget cardItemPranala(BuildContext context, String text, String link) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              title: text,
              url: link,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: marginSmall),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(marginSmall),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Text(
                    text,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                Expanded(
                    child: Icon(
                  Icons.chevron_right,
                  color: primaryColor,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStats(BuildContext context, Covid model) {
    print("Length List: " + model.data.content.length.toString());
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.data.content.length,
      itemBuilder: (context, index) {
        return model.data.content[index].namaKab == "Kota Sukabumi" ||
                model.data.content[index].namaKab == "Kabupaten Sukabumi"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  contentTitle(model.data.content[index].namaKab),
                  cardCovidStat(
                    model.data.content[index].positif.toString(),
                    model.data.content[index].sembuh.toString(),
                    model.data.content[index].meninggal.toString(),
                  )
                ],
              )
            : Container();
      },
    );
  }
}
