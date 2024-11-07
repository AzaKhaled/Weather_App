import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String basUrl = 'http://api.weatherapi.com/v1';

  final String apikey = '0ce081bb8e3b404b96f161115230208';
  WeatherService(this.dio);

  Future<WeatherModel> getCurentService({required String CityName}) async {
    try {
      Response response =
          await dio.get('$basUrl/forecast.json?key=$apikey&q=$CityName&days=1');
  
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try latter';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('ops there was an error, try latter');
    }
  }
}
