import 'package:flutter/material.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_information.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_search_field.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/weather_forecast_information.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TP2 - Météo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            CitySearchField(),
            CityInformation(
              cityName: 'Montpellier',
              date: '22-02-2023',
              humidity: '10%',
              precipitation: '20%',
              temperature: '20°C',
              weatherDescription: 'Snow',
            ),
            WeatherForecastInformation()
          ],
        ),
      ),
    );
  }
}
