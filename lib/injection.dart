import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:flutter_weather_app_with_tdd/domain/domain.dart';
import 'package:flutter_weather_app_with_tdd/presentation/presentation.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => WeatherBloc(getCurrentWeather: locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(repository: locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
        remoteDataSource: locator(),
      ));

  // data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
        client: locator(),
      ));

  // external
  locator.registerLazySingleton(() => http.Client());
}
