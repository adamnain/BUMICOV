import 'package:bumicov/src/models/covid_model.dart';
import 'package:bumicov/src/models/news_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _urlCityCovid =
      'https://covid19-public.digitalservice.id/api/v1/rekapitulasi/jabar?level=kab';

  final String _urlNews =
      'https://newsapi.org/v2/everything?q=sukabumi&sortBy=relevancy&apiKey={yourkey}';

  Future<Covid> fetchCovidCity() async {
    try {
      Response response = await _dio.get(_urlCityCovid);
      return Covid.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Covid.withError("Data Tidak Ditemukan / Koneksi Bermasalah");
    }
  }

  Future<News> fetchNewsList() async {
    try {
      Response response = await _dio.get(_urlNews);
      return News.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return News.withError("Data Tidak Ditemukan / Koneksi Bermasalah");
    }
  }
}
