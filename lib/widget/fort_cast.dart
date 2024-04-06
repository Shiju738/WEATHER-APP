import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/controller/controller.dart';
import 'package:weather_project/model/weater_data_model.dart';

class WeatherForecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 5),
                Text('5 day Forecast'),
              ],
            ),
            SizedBox(height: 10),
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, _) {
                final forecastData = weatherProvider.forecastData;
                if (forecastData != null && forecastData.isNotEmpty) {
                  // Get tomorrow's date
                  final now = DateTime.now();
                  final tomorrow = now.add(Duration(days: 1));
                  
                  // Find tomorrow's weather forecast
                  final tomorrowForecast = forecastData.firstWhere((forecast) =>
                      DateTime.fromMillisecondsSinceEpoch(forecast.dt! * 1000).day ==
                      tomorrow.day);

                  // Build the UI for tomorrow's weather
                  return buildWeatherItem(tomorrowForecast);
                } else {
                  return Text('No forecast data available');
                }
              },
            ),
            Divider(),
            // You can repeat this pattern for subsequent days
          ],
        ),
      ),
    );
  }

  Widget buildWeatherItem(WeatherDatas weatherData) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.sunny),
            SizedBox(width: 5),
            Text('Tomorrow'),
            SizedBox(width: 5),
            Text("${weatherData.weather?[0].description}"),
            Spacer(),
            Text('${weatherData.main?.tempMin} °C/${weatherData.main?.tempMax} °C'),
          ],
        ),
      ],
    );
  }
}
