// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_project/model/city_model.dart';
import 'package:weather_project/model/forcast_model.dart';
import 'package:weather_project/model/weater_data_model.dart';

class WeatherAPIService {
  final String apiKey = 'b39c7464ab56df782ab4652f7da5fd99';
  final String baseUrl = 'http://api.openweathermap.org/geo/1.0';
  final String baseUrl1 = 'https://api.openweathermap.org/data/2.5/weather';
  final String baseUrl2 = 'https://api.openweathermap.org/data/2.5/forecast';

  Future<CityModel?> getCityInfo(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/direct?q=$cityName&limit=0&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return CityModel.fromJson(data[0]);
      } else {
        return null;
      }
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception(
          'Failed to load city data. Status code: ${response.statusCode}');
    }
  }

  Future<WeatherDatas?> getWeatherData(double lat, double lon) async {
    final response = await http.get(
        Uri.parse('$baseUrl1?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData != null) {
        return WeatherDatas.fromJson(jsonData);
      } else {
        return null; // Return null if jsonData is null
      }
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  Future<List<Forcastmodel>?> getWeatherDataList(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl2?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final String responseBody = response.body;
      if (responseBody.isNotEmpty) {
        final Map<String, dynamic> jsonData = json.decode(responseBody);

        final List<dynamic> weatherDataList = jsonData['list'];

        List<Forcastmodel> parsedWeatherDataList = [];

        for (var item in weatherDataList) {
          final weatherData = Forcastmodel.fromJson(item);

          parsedWeatherDataList.add(weatherData);
        }

        return parsedWeatherDataList;
      } else {
        throw Exception('Response body is empty');
      }
    } else {
      throw Exception(
          'Failed to load weather data list: ${response.statusCode}');
    }
  }
}
