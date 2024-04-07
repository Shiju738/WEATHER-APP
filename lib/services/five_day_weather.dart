// // weather_service.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class FiveDayWeatherService {
//   static const apiKey = 'b39c7464ab56df782ab4652f7da5fd99';

//   Future<List<Weather>> fetchWeather(double lat, double lon) async {
//     final url =
//         'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final List<Weather> weatherList = [];

//       for (final item in jsonData['list']) {
//         final weather = Weather(
//           date: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
//           description: item['weather'][0]['description'],
//           temperature: item['main']['temp'].toDouble(),
//         );
//         weatherList.add(weather);
//       }

//       return weatherList;
//     } else {
//       throw Exception('Failed to fetch weather data');
//     }
//   }
// }

// // weather_model.dart
// class Weather {
//   final DateTime date;
//   final String description;
//   final double temperature;

//   Weather({
//     required this.date,
//     required this.description,
//     required this.temperature,
//   });
// }
