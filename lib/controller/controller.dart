import 'package:flutter/material.dart';
import 'package:weather_project/model/city_model.dart';
import 'package:weather_project/model/forcast_model.dart';
import 'package:weather_project/model/weater_data_model.dart';
import 'package:weather_project/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherAPIService _weatherAPIService = WeatherAPIService();
  CityModel? _cityInfo;
  WeatherDatas? _weatherData;
  List<Forcastmodel>? _weatherDataList;
  bool _isLoading = false;
  String? _errorMessage;

  CityModel? get cityInfo => _cityInfo;
  WeatherDatas? get weatherData => _weatherData;
  List<Forcastmodel>? get weatherDataList => _weatherDataList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCityInfo(String cityName) async {
    _isLoading = true;
    notifyListeners();
    try {
      _cityInfo = await _weatherAPIService.getCityInfo(cityName);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherData(double lat, double lon) async {
    _isLoading = true;
    notifyListeners();
    try {
      _weatherData = await _weatherAPIService.getWeatherData(lat, lon);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherDataList(double lat, double lon) async {
    _isLoading = true;
    notifyListeners();
    try {
      _weatherDataList = await _weatherAPIService.getWeatherDataList(lat, lon);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
