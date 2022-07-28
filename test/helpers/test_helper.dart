import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app_with_tdd/domain/repositories/repositories.dart';

@GenerateMocks(
  [
    WeatherRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
