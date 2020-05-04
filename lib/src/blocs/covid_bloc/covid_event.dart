part of 'covid_bloc.dart';

abstract class CovidEvent extends Equatable {
  const CovidEvent();
}

class GetCovidCity extends CovidEvent {
  @override
  List<Object> get props => null;
}
