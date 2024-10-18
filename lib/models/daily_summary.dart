class DailySummary {
  final DateTime date;
  final double avgTemperature;
  final double maxTemperature;
  final double minTemperature;
  final String dominantCondition;

  DailySummary({
    required this.date,
    required this.avgTemperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.dominantCondition,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'avgTemperature': avgTemperature,
      'maxTemperature': maxTemperature,
      'minTemperature': minTemperature,
      'dominantCondition': dominantCondition,
    };
  }

  factory DailySummary.fromMap(Map<String, dynamic> map) {
    return DailySummary(
      date: DateTime.parse(map['date']),
      avgTemperature: map['avgTemperature'],
      maxTemperature: map['maxTemperature'],
      minTemperature: map['minTemperature'],
      dominantCondition: map['dominantCondition'],
    );
  }
}