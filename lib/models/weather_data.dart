class WeatherData {
  final String city;
  final String condition;
  final double temperature;
  final double feelsLike;
  final DateTime timestamp;

  WeatherData({
    required this.city,
    required this.condition,
    required this.temperature,
    required this.feelsLike,
    required this.timestamp,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      condition: json['weather'][0]['main'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}