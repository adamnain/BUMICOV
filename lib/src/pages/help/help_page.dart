import 'package:bumicov/src/blocs/covid_bloc/covid_bloc.dart';
import 'package:flutter/material.dart';

import 'help_widget.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> with HelpWidget {
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
