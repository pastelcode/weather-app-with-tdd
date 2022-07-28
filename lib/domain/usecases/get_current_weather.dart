import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:flutter_weather_app_with_tdd/domain/entities/entities.dart';
import 'package:flutter_weather_app_with_tdd/domain/repositories/repositories.dart';

class GetCurrentWeather {
  const GetCurrentWeather({required this.repository});

  final WeatherRepository repository;

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
