import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app_with_tdd/data/failure.dart';
import 'package:flutter_weather_app_with_tdd/domain/entities/weather.dart';
import 'package:flutter_weather_app_with_tdd/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  const GetCurrentWeather({required this.repository});

  final WeatherRepository repository;

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
