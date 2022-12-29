import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherDescription;
  final double size;

  const WeatherIcon({
    super.key,
    required this.weatherDescription,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    switch (weatherDescription) {
      case "Clear":
        return Icon(Icons.sunny, color: Colors.yellow, size: size);
      case "Clouds":
        return Icon(Icons.cloud, color: Colors.grey, size: size);
      case "Rain":
        return Icon(Icons.water_drop, color: Colors.blue, size: size);
      case "Snow":
        return Icon(Icons.cloudy_snowing, color: Colors.grey, size: size);
      default:
        return Icon(Icons.sunny, color: Colors.yellow, size: size);
    }
  }
}
