part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class OnCityChanged extends WeatherEvent {
  const OnCityChanged({
    required this.cityName,
  });

  final String cityName;

  @override
  List<Object?> get props => [cityName];
}
