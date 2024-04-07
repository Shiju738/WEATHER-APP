import 'package:weather_project/model/forcast_model.dart';
import 'package:weather_project/services/weather_service.dart';

void main() async {
  // Create an instance of WeatherAPIService
  WeatherAPIService weatherAPIService = WeatherAPIService();

  // Provide latitude and longitude values
  double latitude = 40.7128; // Example latitude
  double longitude = -74.0060; // Example longitude

  try {
    // Call getWeatherDataList method to fetch weather forecast data
    List<Forcastmodel>? forecastList =
        await weatherAPIService.getWeatherDataList(latitude, longitude);

    // Handle the received forecast data
    if (forecastList != null) {
      // Forecast data has been successfully received
      print('Received ${forecastList.length} forecast items.');
      for (var forecast in forecastList) {
        // Access forecast data as per your requirements

        print('Temperature: ${forecast.list[0].main.temp}');
        // You can access other forecast attributes similarly
      }
    } else {
      // Handle case when forecastList is null
      print('Failed to fetch forecast data.');
    }
  } catch (e) {
    // Handle any exceptions that may occur during the API call
    print('Error: $e');
  }
}
