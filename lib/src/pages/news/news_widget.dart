import 'package:bumicov/src/blocs/news_bloc/news_bloc.dart';
import 'package:bumicov/src/models/news_model.dart';
import 'package:bumicov/src/utils/cutom_widget/loading_shimmer.dart';
import 'package:bumicov/src/utils/cutom_widget/web_view.dart';
import 'package:bumicov/src/utils/values/colors.dart';
import 'package:bumicov/src/utils/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidget {
  Widget listNews(BuildContext context, NewsBloc _bloc) {
    return Container(
      margin: EdgeInsets.all(marginSmall),
      child: BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsInitial) {
                return ShimmerLoad.buildListLoading();
              } else if (state is NewsLoading) {
                return ShimmerLoad.buildListLoading();
              } else if (state is NewsLoaded) {
                return buildCard(context, state.newsModel);
              } else if (state is NewsError) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, News model) {
    return ListView.builder(
      itemCount: model.articles.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewPage(
                  title: model.articles[index].title,
                  url: model.articles[index].url,
                ),
              ),
            );
          },
          child: Card(
            child: Container(
              margin: EdgeInsets.all(marginSmall),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          model.articles[index].source.name,
                          style: TextStyle(color: primaryColor),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: marginSmall),
                          child: Text(
                            model.articles[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        Text(model.articles[index].publishedAt),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: marginSmall),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model.articles[index].urlToImage),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
