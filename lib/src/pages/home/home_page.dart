import 'package:bumicov/src/blocs/covid_bloc/covid_bloc.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeWidget {
  final CovidBloc _covidBloc = CovidBloc();

  @override
  void initState() {
    _covidBloc.add(GetCovidCity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            headerContent(context),
            mainContent(context, _covidBloc)
          ],
        ),
      ),
    );
  }
}
