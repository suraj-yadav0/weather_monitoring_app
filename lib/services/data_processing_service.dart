// ignore: prefer_typing_uninitialized_variables

import 'package:weather_monitoring_app/models/daily_summary.dart';
import 'package:weather_monitoring_app/models/weather_data.dart';

class DataProcessingService {
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  DailySummary processDailyData(List<WeatherData> dailyData) {
    double sumTemp = 0;
    double maxTemp = double.negativeInfinity;
    double minTemp = double.infinity;
    Map<String, int> conditionCounts = {};

    for (var data in dailyData) {
      double temp = kelvinToCelsius(data.temperature);
      sumTemp += temp;
      maxTemp = temp > maxTemp ? temp : maxTemp;
      minTemp = temp < minTemp ? temp : minTemp;
      conditionCounts[data.condition] = (conditionCounts[data.condition] ?? 0) + 1;
    }

    String dominantCondition = conditionCounts.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;

    return DailySummary(
      date: dailyData.first.timestamp,
      avgTemperature: sumTemp / dailyData.length,
      maxTemperature: maxTemp,
      minTemperature: minTemp,
      dominantCondition: dominantCondition,
    );
  }
}