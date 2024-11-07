import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Views/search_view.dart';
import 'package:weatherapp/Widgets/no_weather_body.dart';
import 'package:weatherapp/Widgets/weather_info_body.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, State) {
        if (State is WeatherInitialState) {
          return NoWeatherBody();
        } else if (State is WeatherLoadedState) {
          State.weatherModel;
          return WeatherInfoBody(
           weather: State.weatherModel,
          );
        } else {
          return Text('there was an error');
        }
      }),
    );
  }
}
