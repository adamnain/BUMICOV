import 'package:bumicov/src/blocs/news_bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'news_widget.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with NewsWidget {
  final NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    _newsBloc.add(GetNewsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: listNews(context, _newsBloc)),
    );
  }
}
