import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:flutter_weather_app_with_tdd/domain/domain.dart';
import 'package:flutter_weather_app_with_tdd/presentation/presentation.dart';

import 'weather_bloc_test.mocks.dart';

@GenerateMocks([
  GetCurrentWeather,
])
void main() {
  late MockGetCurrentWeather mockGetCurrentWeather;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeather = MockGetCurrentWeather();
    weatherBloc = WeatherBloc(
      getCurrentWeather: mockGetCurrentWeather,
    );
  });

  const tWeather = Weather(
    cityName: 'Jakarta',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const tCityName = 'Jakarta';

  test(
    'initial state should be empty',
    () {
      expect(weatherBloc.state, WeatherEmpty());
    },
  );

  blocTest<WeatherBloc, WeatherState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetCurrentWeather.execute(tCityName)).thenAnswer(
        (_) async => const Right(tWeather),
      );
      return weatherBloc;
    },
    act: (WeatherBloc bloc) => bloc.add(const OnCityChanged(
      cityName: tCityName,
    )),
    expect: () => [
      WeatherLoading(),
      const WeatherHasData(
        weather: tWeather,
      ),
    ],
    verify: (WeatherBloc bloc) {
      verify(mockGetCurrentWeather.execute(tCityName));
    },
  );

  blocTest<WeatherBloc, WeatherState>(
    'should emit [loading, error] when data is unsuccessful',
    build: () {
      when(mockGetCurrentWeather.execute(tCityName)).thenAnswer(
        (_) async => const Left(ServerFailure('Server failure')),
      );
      return weatherBloc;
    },
    act: (WeatherBloc bloc) => bloc.add(const OnCityChanged(
      cityName: tCityName,
    )),
    expect: () => [
      WeatherLoading(),
      const WeatherError(
        message: 'Server failure',
      ),
    ],
    verify: (WeatherBloc bloc) {
      verify(mockGetCurrentWeather.execute(tCityName));
    },
  );
}
