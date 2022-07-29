import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
  static String currentWeatherByName(String city) =>
      '$baseUrl?q=$city&units=metric&appid=$apiKey';
  static String weatherIcon(String iconCode) =>
      'https://openweathermap.org/img/wn/$iconCode@2x.png';
}
