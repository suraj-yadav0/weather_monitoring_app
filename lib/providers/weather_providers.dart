import 'package:flutter/foundation.dart';
import '../services/weather_api_service.dart';
import '../services/data_processing_service.dart';
import '../services/database_service.dart';
import '../models/weather_data.dart';
import '../models/daily_summary.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherApiService _apiService = WeatherApiService();
  final DataProcessingService _dataService = DataProcessingService();
  final DatabaseService _dbService = DatabaseService();

  List<WeatherData> _currentWeather = [];
  List<DailySummary> _dailySummaries = [];

  List<WeatherData> get currentWeather => _currentWeather;
  List<DailySummary> get dailySummaries => _dailySummaries;

  Future<void> fetchWeatherData() async {
    _currentWeather = [];
    for (String city in _apiService.cities) {
      try {
        WeatherData weatherData = await _apiService.getWeatherData(city);
        _currentWeather.add(weatherData);
      } catch (e) {
        print('Error fetching data for $city: $e');
      }
    }
    await _processAndStoreDailySummary();
    notifyListeners();
  }

  Future<void> _processAndStoreDailySummary() async {
    if (_currentWeather.isNotEmpty) {
      DailySummary summary = _dataService.processDailyData(_currentWeather);
      await _dbService.insertDailySummary(summary);
      _dailySummaries = await _dbService.getDailySummaries();
    }
  }

  Future<void> loadDailySummaries() async {
    _dailySummaries = await _dbService.getDailySummaries();
    notifyListeners();
  }
}