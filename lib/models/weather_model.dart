import 'package:flutter/services.dart';

class WeatherModel {
  final String CityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;

  WeatherModel(
      {required this.CityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weathercondition});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      image:json['forecast']['forecastday'][0]['day']['condition']['icon'] ,
        CityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weathercondition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
