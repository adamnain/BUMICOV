part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetNewsList extends NewsEvent {
  @override
  List<Object> get props => null;
}
