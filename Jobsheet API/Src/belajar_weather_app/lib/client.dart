import 'dart:convert';

import 'package:dio/dio.dart';
import 'model.dart';
class WeatherApiClient {
  Future<WeatherModel> request() async {
    String url = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m";
    Response response = await Dio().get(url);
    final parseData = response.data as Map<String, dynamic>;
    final weather = WeatherModel.fromJson(parseData);
    return weather;
  }
}