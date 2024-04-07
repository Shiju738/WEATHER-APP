// // weather_provider.dart
// import 'package:flutter/material.dart';
// import 'package:weather_project/services/five_day_weather.dart';

// class FiveDayWeatherProvider extends ChangeNotifier {
//   late List<Weather> _weatherForecast;
//   final FiveDayWeatherService _weatherService = FiveDayWeatherService();

//   List<Weather> get weatherForecast => _weatherForecast;

//   Future<void> fetchWeather(double lat, double lon) async {
//     try {
//       _weatherForecast = await _weatherService.fetchWeather(lat, lon);
//       notifyListeners();
//     } catch (e) {
//       print('Error fetching weather: $e');
//     }
//   }
// }
