// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart';
import 'package:tp2_gestion_state/meteo/data/models/weather_forecast_model.dart';

import '../../util.dart';

class WeatherRepository {
  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Util.appId}";

    final response = await get(Uri.parse(finalUrl));

    print("url : ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather data : ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast.");
    }
  }
}
