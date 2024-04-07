
// // main.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_project/controller/five_day_weather_controller.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => FiveDayWeatherProvider(),
//       child: MaterialApp(
//         title: 'Weather App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: WeatherScreen(),
//       ),
//     );
//   }
// }

// class WeatherScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final weatherProvider = Provider.of<FiveDayWeatherProvider>(context);
//     weatherProvider.fetchWeather(
//         37.7749, -122.4194); // San Francisco's coordinates

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weather Forecast'),
//       ),
//       body: Consumer<FiveDayWeatherProvider>(
//         builder: (context, provider, child) {
//           if (provider.weatherForecast.isEmpty) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: provider.weatherForecast.length,
//               itemBuilder: (context, index) {
//                 final weather = provider.weatherForecast[index];
//                 return ListTile(
//                   title: Text('${weather.date}'),
//                   subtitle:
//                       Text('${weather.description} - ${weather.temperature}°C'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/controller/controller.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, _) {
            if (weatherProvider.isLoading) {
              return CircularProgressIndicator();
            } else if (weatherProvider.errorMessage != null) {
              return Text('Error: ${weatherProvider.errorMessage}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('City: ${weatherProvider.cityInfo?.name ?? ""}'),
                  SizedBox(height: 16),
                  Text('Temperature: ${weatherProvider.weatherData?.main!.tempMax ?? ""}'),
                  SizedBox(height: 16),
                  // Display other weather details here
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
