import 'package:flutter/material.dart';
import 'package:weather_project/model/city_model.dart';
import 'package:weather_project/model/weater_data_model.dart';
import 'package:weather_project/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherAPIService _weatherAPIService = WeatherAPIService();
  List<WeatherDatas>? _forecastData;
  CityModel? _cityInfo;
  WeatherDatas? _weatherData;

  CityModel? get cityInfo => _cityInfo;
  WeatherDatas? get WeatherData => _weatherData;
  List<WeatherDatas>? get forecastData => _forecastData;

  Future<void> fetchCityInfo(String cityName) async {
    try {
      final cityInfo = await _weatherAPIService.getCityInfo(cityName);
      if (cityInfo != null) {
        _cityInfo = cityInfo;
        notifyListeners();
      } else {
        // Handle city not found
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> fetchWeatherData(double lat, double lon) async {
    try {
      final weatherData = await _weatherAPIService.getWeatherData(lat, lon);
      if (weatherData != null) {
        _weatherData = weatherData;
        notifyListeners();
      } else {
        // Handle weather data not found
        print('Weather data is null');
      }
    } catch (e) {
      // Handle error
      print('Error fetching weather data: $e');
    }
  }

  Future<void> fetchWeatherForecast(double lat, double lon,
      {int count = 5}) async {
    try {
      final forecastData =
          await _weatherAPIService.getWeatherForecast(lat, lon, count: count);
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
