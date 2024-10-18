import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_monitoring_app/providers/weather_providers.dart';

import 'package:weather_monitoring_app/widgets/weather_chart.dart'
    as weather_chart;
import 'package:weather_monitoring_app/widgets/daily_summary_card.dart'
    as daily_card;

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Dashboard'),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.currentWeather.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              for (var weather in weatherProvider.currentWeather)
                daily_card.DailySummaryCard(weatherData: weather),
              weather_chart.WeatherChart(
                  summaries: weatherProvider.dailySummaries),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<WeatherProvider>(context, listen: false)
            .fetchWeatherData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
