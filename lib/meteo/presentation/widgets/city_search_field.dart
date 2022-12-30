import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_gestion_state/meteo/business_logic/cubit/searching_city_cubit.dart';

class CitySearchField extends StatelessWidget {
  const CitySearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (city) =>
            {BlocProvider.of<SearchingCityCubit>(context).searchCity(city)},
        decoration: const InputDecoration(
            labelText: "Entrez le nom d'une ville...",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search)));
  }
}
