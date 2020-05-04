import 'package:bumicov/src/models/covid_model.dart';
import 'package:bumicov/src/models/news_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Covid> fetchCovidCity() {
    return _provider.fetchCovidCity();
  }

  Future<News> fetchNewsList() {
    return _provider.fetchNewsList();
  }
}

class NetworkError extends Error {}
