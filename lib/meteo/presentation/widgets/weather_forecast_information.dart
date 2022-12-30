import 'package:flutter/material.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_information_widgets/weather_icon.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/regular_text.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/tertiary_text.dart';

class WeatherForecastInformation extends StatelessWidget {
  final List<WeatherForecastCard> weatherForecastCards;

  const WeatherForecastInformation(
      {super.key, required this.weatherForecastCards});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TertiaryText(text: "5-day weather forecast"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: weatherForecastCards),
          )
        ],
      ),
    );
  }
}

class WeatherForecastCard extends StatelessWidget {
  final String date;
  final String weatherDescription;
  final String temperature;
  final String windspeed;
  final String humidity;

  const WeatherForecastCard(
      {super.key,
      required this.date,
      required this.weatherDescription,
      required this.temperature,
      required this.windspeed,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RegularText(text: date),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  WeatherIcon(weatherDescription: weatherDescription, size: 50),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.thermostat, size: 10),
                      RegularText(text: temperature),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.water_drop_sharp, size: 10),
                      RegularText(text: windspeed),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.water_sharp, size: 10),
                      RegularText(text: humidity),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
