import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app_with_tdd/domain/domain.dart';

@GenerateMocks(
  [
    WeatherRepository,
    RemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
