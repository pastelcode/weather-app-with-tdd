import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_weather_app_with_tdd/data/data.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
