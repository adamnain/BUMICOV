part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  const NewsLoading();
  @override
  List<Object> get props => null;
}

class NewsLoaded extends NewsState {
  final News newsModel;
  const NewsLoaded(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);
  @override
  List<Object> get props => [message];
}
