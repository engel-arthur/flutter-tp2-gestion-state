import 'package:flutter/material.dart';

class CitySearchField extends StatelessWidget {
  const CitySearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
            labelText: "Enter city name...",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search)));
  }
}
