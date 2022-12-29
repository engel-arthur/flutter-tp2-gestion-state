import 'package:flutter/material.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/city_information_widgets/weather_icon.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/regular_text.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/main_text.dart';
import 'package:tp2_gestion_state/meteo/presentation/widgets/widget_utils/secondary_text.dart';

class CityInformation extends StatelessWidget {
  final String cityName;
  final String date;
  final String weatherDescription;
  final String temperature;
  final String precipitation;
  final String humidity;

  const CityInformation(
      {super.key,
      required this.cityName,
      required this.date,
      required this.weatherDescription,
      required this.temperature,
      required this.precipitation,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            MainText(text: cityName),
            RegularText(text: date),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: WeatherIcon(
                  weatherDescription: weatherDescription, size: 150),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.thermostat, size: 32),
                SecondaryText(text: temperature),
              ],
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.water_drop_sharp, size: 15),
                        RegularText(text: precipitation),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.water_sharp, size: 15),
                        RegularText(text: humidity),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
