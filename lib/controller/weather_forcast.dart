import 'package:flutter/material.dart';
import 'package:weather_project/model/weater_data_model.dart';
import 'package:weather_project/services/weather_service.dart';

class WeatherForecastProvider extends ChangeNotifier {
  final WeatherAPIService _weatherAPIService = WeatherAPIService();
  List<WeatherDatas>? _forecastData;

  List<WeatherDatas>? get forecastData => _forecastData;

  Future<void> fetchWeatherForecast(double lat, double lon, {int count = 5}) async {
    try {
      final forecastData = await _weatherAPIService.getWeatherForecast(lat, lon, count: count);
      if (forecastData != null) {
        _forecastData = forecastData;
        notifyListeners();
      } else {
        // Handle forecast data not found
        print('Forecast data is null');
      }
    } catch (e) {
      // Handle error
      print('Error fetching weather forecast data: $e');
    }
  }
}
