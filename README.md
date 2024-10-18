# Weather Monitoring App

## Description

The Weather Monitoring App is a real-time data processing system designed to monitor weather conditions and provide summarized insights using rollups and aggregates. This Flutter application utilizes the OpenWeatherMap API to retrieve weather data for major Indian metros and presents it in an easy-to-understand format.

## Features

- Real-time weather data retrieval for Delhi, Mumbai, Chennai, Bangalore, Kolkata, and Hyderabad
- Daily weather summaries including average, maximum, and minimum temperatures
- Dominant weather condition analysis
- Temperature conversion from Kelvin to Celsius
- Configurable alerting system for temperature thresholds
- Visualization of historical weather trends
- Local database storage for offline access to historical data

## Requirements

- Flutter SDK (2.5.0 or later)
- Dart SDK (2.14.0 or later)
- OpenWeatherMap API key

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/weather-monitoring-app.git
   ```

2. Navigate to the project directory:
   ```
   cd weather-monitoring-app
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Create a `config.dart` file in the `lib` folder and add your OpenWeatherMap API key:
   ```dart
   const String openWeatherMapApiKey = 'YOUR_API_KEY_HERE';
   ```

5. Run the app:
   ```
   flutter run
   ```

## Usage

1. Upon launching the app, you'll see the main dashboard displaying current weather conditions for the selected cities.
2. Tap the refresh button to fetch the latest weather data.
3. Scroll down to view the historical weather chart.
4. Access the settings page to configure temperature alert thresholds.

## Dependencies

- http: ^0.13.5
- provider: ^6.0.5
- sqflite: ^2.2.8+4
- path_provider: ^2.0.15
- fl_chart: ^0.62.0
- shared_preferences: ^2.1.1

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── weather_data.dart
│   └── daily_summary.dart
├── screens/
│   ├── dashboard_screen.dart
│   └── settings_screen.dart
├── services/
│   ├── weather_api_service.dart
│   ├── data_processing_service.dart
│   └── database_service.dart
├── providers/
│   └── weather_provider.dart
└── widgets/
    ├── daily_summary_card.dart
    └── weather_chart.dart
```

## Design Choices

1. **State Management**: We chose Provider for state management due to its simplicity and efficiency for this scale of application.

2. **Local Database**: SQLite (via sqflite package) is used for local storage of daily summaries, enabling offline access to historical data.

3. **API Integration**: The OpenWeatherMap API was selected for its comprehensive weather data and free tier availability.

4. **UI Components**: Custom widgets were created for daily summaries and weather charts to encapsulate functionality and improve code reusability.

5. **Background Processing**: (If implemented) Workmanager is used for periodic background fetches to ensure up-to-date weather information.

## Known Limitations

- The app currently supports a fixed list of Indian metro cities. Future versions may allow users to add custom locations.
- Weather forecasts are not implemented in the current version.
- The app relies on the OpenWeatherMap API, so its accuracy is dependent on this third-party service.

## Future Enhancements

- Implement weather forecasts
- Add support for user-defined locations
- Enhance the alerting system with push notifications
- Implement more detailed weather information and additional weather parameters

## Contributing

Contributions to the Weather Monitoring App are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
