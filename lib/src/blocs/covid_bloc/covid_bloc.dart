import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bumicov/src/models/covid_model.dart';
import 'package:bumicov/src/resources/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final ApiRepository _apiRepository = ApiRepository();

  @override
  CovidState get initialState => CovidInitial();

  @override
  Stream<CovidState> mapEventToState(
    CovidEvent event,
  ) async* {
    yield CovidLoading();
    if (event is GetCovidCity) {
      try {
        final mList = await _apiRepository.fetchCovidCity();
        yield CovidLoaded(mList);
        if (mList.error != null) {
          yield CovidError(mList.error);
        }
      } on NetworkError {
        yield CovidError(
            "Tidak berhasil mengambil data. Apakah perangkat Anda sudah terhubung internet?");
      }
    }
  }
}
