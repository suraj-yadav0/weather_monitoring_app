import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../services/data_processing_service.dart';

class DailySummaryCard extends StatelessWidget {
  final WeatherData weatherData;
  final DataProcessingService _dataService = DataProcessingService();

  DailySummaryCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weatherData.city, style: Theme.of(context).textTheme.titleLarge),
         const   SizedBox(height: 8.0),
            Text('Temperature: ${_dataService.kelvinToCelsius(weatherData.temperature).toStringAsFixed(1)}°C'),
            Text('Feels Like: ${_dataService.kelvinToCelsius(weatherData.feelsLike).toStringAsFixed(1)}°C'),
            Text('Condition: ${weatherData.condition}'),
          ],
        ),
      ),
    );
  }
}