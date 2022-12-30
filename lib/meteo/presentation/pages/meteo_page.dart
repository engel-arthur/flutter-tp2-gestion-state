import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tp2_gestion_state/meteo/business_logic/cubit/searching_city_cubit.dart';
import 'package:tp2_gestion_state/meteo/data/models/weather_forecast_model.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_information.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_search_field.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/padded_centered_text.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/weather_forecast_information.dart';
import 'package:tp2_gestion_state/meteo/util.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TP2 - Météo")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => SearchingCityCubit(),
            child: Column(
              children: [const CitySearchField(), _getPageContents()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPageContents() {
    return BlocBuilder<SearchingCityCubit, SearchingCityState>(
        builder: (context, state) {
      if (state.firstSearch) {
        return const PaddedCenteredText(
          text: 'Cherchez une ville.',
        );
      } else {
        return FutureBuilder(
          future: BlocProvider.of<SearchingCityCubit>(context).forecast,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return _getForecastWidgets(snapshot.data);
              }
              if (snapshot.hasError) {
                return const PaddedCenteredText(
                    text:
                        "Erreur dans la récupération des données. Vérifiez que la ville que vous avez entrée existe.");
              } else {
                return const PaddedCenteredText(text: "Pas de données.");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  children: const [
                    PaddedCenteredText(text: "Chargement..."),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else {
              return PaddedCenteredText(text: "${snapshot.connectionState}");
            }
          },
        );
      }
    });
  }
}

Column _getForecastWidgets(WeatherForecastModel? forecast) {
  List<Widget> widgets = [];

  String cityName = "${forecast?.city?.name}";

  List<ForecastList> forecasts = forecast!.list!;

  widgets.add(CityInformation(
      cityName: cityName,
      date: getDateNDaysFromToday(0),
      weatherDescription: getWeatherDescriptionFromForecastList(forecasts[0]),
      temperature: getTemperatureFromForecastList(forecasts[0]),
      windspeed: getWindSpeedFromForecastList(forecasts[0]),
      humidity: getHumidityFromForecastList(forecasts[0])));

  List<WeatherForecastCard> weatherForecastCards = [];
  for (int i = 1; i <= min(5, forecasts.length); i++) {
    weatherForecastCards.add(WeatherForecastCard(
        date: getDateNDaysFromToday(i),
        weatherDescription: getWeatherDescriptionFromForecastList(forecasts[i]),
        temperature: getTemperatureFromForecastList(forecasts[i]),
        windspeed: getWindSpeedFromForecastList(forecasts[i]),
        humidity: getHumidityFromForecastList(forecasts[i])));
  }
  widgets.add(
      WeatherForecastInformation(weatherForecastCards: weatherForecastCards));
  return Column(children: widgets);
}

String getWeatherDescriptionFromForecastList(ForecastList forecast) {
  return forecast.weather![0].main!;
}

String getHumidityFromForecastList(ForecastList forecast) {
  return "${forecast.main!.humidity} %";
}

String getWindSpeedFromForecastList(ForecastList forecast) {
  return "${forecast.wind!.speed} m/s";
}

String getTemperatureFromForecastList(ForecastList forecast) {
  return "${convertKelvinTempToCelsius(forecast.main!.temp!).toStringAsFixed(2)}°C";
}

double convertKelvinTempToCelsius(double kTemp) {
  return kTemp - Util.kelvinCelsiusDifference;
}

String getDateNDaysFromToday(int n) {
  return DateFormat.yMMMd().format(DateTime.now().add(Duration(days: n)));
}
