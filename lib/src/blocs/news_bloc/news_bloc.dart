import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bumicov/src/models/news_model.dart';
import 'package:bumicov/src/resources/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository _apiRepository = ApiRepository();

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    yield NewsLoading();
    if (event is GetNewsList) {
      try {
        final mList = await _apiRepository.fetchNewsList();
        yield NewsLoaded(mList);
        if (mList.error != null) {
          yield NewsError(mList.error);
        }
      } on NetworkError {
        yield NewsError(
            "Tidak berhasil mengambil data. Apakah perangkat Anda sudah terhubung internet?");
      }
    }
  }
}
