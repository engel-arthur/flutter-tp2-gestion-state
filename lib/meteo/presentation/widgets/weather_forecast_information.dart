import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_information_widgets/weather_icon.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/regular_text.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/tertiary_text.dart';

class WeatherForecastInformation extends StatelessWidget {
  const WeatherForecastInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TertiaryText(text: "5-day weather forecast"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              WeatherForecastCard(
                  date: "Vendredi",
                  weatherDescription: "Clouds",
                  temperature: "10°C",
                  precipitation: "0%",
                  humidity: "60%"),
              WeatherForecastCard(
                  date: "Vendredi",
                  weatherDescription: "Clouds",
                  temperature: "10°C",
                  precipitation: "0%",
                  humidity: "60%"),
              WeatherForecastCard(
                  date: "Vendredi",
                  weatherDescription: "Clouds",
                  temperature: "10°C",
                  precipitation: "0%",
                  humidity: "60%"),
            ],
          ),
        )
      ],
    );
  }
}

class WeatherForecastCard extends StatelessWidget {
  final String date;
  final String weatherDescription;
  final String temperature;
  final String precipitation;
  final String humidity;

  const WeatherForecastCard(
      {super.key,
      required this.date,
      required this.weatherDescription,
      required this.temperature,
      required this.precipitation,
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
                  child: RegularText(text: temperature),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RegularText(text: precipitation),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RegularText(text: humidity),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
