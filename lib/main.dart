import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_monitoring_app/providers/weather_providers.dart';
import 'package:weather_monitoring_app/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather Monitoring App',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:  DashboardScreen(),
      ),
    );
  }
}
