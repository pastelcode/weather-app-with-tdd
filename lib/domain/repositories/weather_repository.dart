import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:flutter_weather_app_with_tdd/domain/entities/entities.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
