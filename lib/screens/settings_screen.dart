import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _temperatureThreshold = 35.0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _temperatureThreshold = prefs.getDouble('temperatureThreshold') ?? 35.0;
    });
  }

  _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('temperatureThreshold', _temperatureThreshold);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Temperature Alert Threshold (°C)'),
            Slider(
              value: _temperatureThreshold,
              min: 0,
              max: 50,
              divisions: 50,
              label: _temperatureThreshold.round().toString(),
              onChanged: (value) {
                setState(() {
                  _temperatureThreshold = value;
                });
              },
              onChangeEnd: (value) {
                _saveSettings();
              },
            ),
          ],
        ),
      ),
    );
  }
}