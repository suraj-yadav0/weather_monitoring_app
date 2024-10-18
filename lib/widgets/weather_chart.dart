import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/daily_summary.dart';

class WeatherChart extends StatelessWidget {
  final List<DailySummary> summaries;

  const WeatherChart({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: true),
          minX: 0,
          maxX: summaries.length.toDouble() - 1,
          minY: summaries.map((s) => s.minTemperature).reduce((a, b) => a < b ? a : b),
          maxY: summaries.map((s) => s.maxTemperature).reduce((a, b) => a > b ? a : b),
          lineBarsData: [
            LineChartBarData(
              spots: summaries.asMap().entries.map((entry) {
                return FlSpot(entry.key.toDouble(), entry.value.avgTemperature);
              }).toList(),
              isCurved: true,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
