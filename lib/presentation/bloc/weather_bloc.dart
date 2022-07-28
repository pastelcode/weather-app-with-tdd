import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app_with_tdd/domain/domain.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required GetCurrentWeather getCurrentWeather})
      : _getCurrentWeather = getCurrentWeather,
        super(WeatherEmpty()) {
    on<OnCityChanged>((OnCityChanged event, Emitter<WeatherState> emit) async {
      final cityName = event.cityName;

      emit(WeatherLoading());

      final result = await _getCurrentWeather.execute(cityName);
      result.fold(
        (Failure failure) {
          emit(WeatherError(
            message: failure.message,
          ));
        },
        (Weather data) {
          emit(WeatherHasData(
            weather: data,
          ));
        },
      );
    });
  }

  final GetCurrentWeather _getCurrentWeather;
}
