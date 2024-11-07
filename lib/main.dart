import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Views/home_view.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getThemsColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weathercondition,
              )),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemsColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == 'Rainly') {
    return Colors.grey;
  } else {
    return Colors.lightBlue;
  }
}
