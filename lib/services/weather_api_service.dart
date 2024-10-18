import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_data.dart';

class WeatherApiService {
  final String apiKey = 'e27a2e12c5425fbb3819608485fb8982';
  final List<String> cities = ['Delhi', 'Mumbai', 'Chennai', 'Bangalore', 'Kolkata', 'Hyderabad'];

  Future<WeatherData> getWeatherData(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city,IN&appid=$apiKey'));

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}