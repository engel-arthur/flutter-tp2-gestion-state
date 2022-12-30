import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tp2_gestion_state/meteo/data/models/weather_forecast_model.dart';
import 'package:tp2_gestion_state/meteo/data/repositories/weather_repository.dart';

part 'searching_city_state.dart';

class SearchingCityCubit extends Cubit<SearchingCityState> {
  Future<WeatherForecastModel>? forecast;

  WeatherRepository weatherRepository = WeatherRepository();

  SearchingCityCubit() : super(SearchingCityState(firstSearch: true));

  void searchCity(String cityName) {
    forecast = weatherRepository.getWeatherForecast(cityName: cityName);
    emit(SearchingCityState(firstSearch: false));
  }
}
