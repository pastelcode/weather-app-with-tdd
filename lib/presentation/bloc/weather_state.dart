part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  const WeatherError({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

class WeatherHasData extends WeatherState {
  const WeatherHasData({
    required this.weather,
  });

  final Weather weather;

  @override
  List<Object?> get props => [weather];
}
