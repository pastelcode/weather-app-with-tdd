import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:flutter_weather_app_with_tdd/domain/domain.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
