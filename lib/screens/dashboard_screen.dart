import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_monitoring_app/providers/weather_providers.dart';

import '../widgets/daily_summary_card.dart' as daily_card;
import '../widgets/weather_chart.dart' as weather_chart;

class DashboardScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Dashboard'),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.currentWeather.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              for (var weather in weatherProvider.currentWeather)
                daily_card.DailySummaryCard(weatherData: weather),
              weather_chart.WeatherChart(summaries: weatherProvider.dailySummaries),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<WeatherProvider>(context, listen: false).fetchWeatherData(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}