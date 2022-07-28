import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app_with_tdd/domain/repositories/weather_repository.dart';

@GenerateMocks(
  [
    WeatherRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
