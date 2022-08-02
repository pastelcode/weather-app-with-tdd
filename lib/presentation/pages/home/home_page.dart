import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app_with_tdd/data/data.dart';
import 'package:flutter_weather_app_with_tdd/presentation/pages/home/widgets/widgets.dart';
import 'package:flutter_weather_app_with_tdd/presentation/presentation.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  final _gap = const SizedBox(
    height: 32.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/cloud-lightning.svg',
                  height: kToolbarHeight - 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Weather',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search your city',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(),
              const SearchTextInput(),
              _gap,
              Text(
                'Your result',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (BuildContext context, WeatherState state) {
                  if (state is WeatherLoading) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 25,
                            ),
                            Text('Getting weather...'),
                          ],
                        ),
                      ),
                    );
                  } else if (state is WeatherHasData) {
                    return Column(
                      key: const Key('weather_data'),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.weather.cityName,
                              style: const TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            Image(
                              image: NetworkImage(
                                Urls.weatherIcon(
                                  state.weather.iconCode,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${state.weather.main} | ${state.weather.description}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Table(
                          defaultColumnWidth: const FixedColumnWidth(150.0),
                          border: TableBorder.all(
                            color: Theme.of(context).primaryColor,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          children: [
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Temperature',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${state.weather.temperature} ºC',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ), // Will be change later
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Pressure',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${state.weather.pressure} hPa',
                                  style: const TextStyle(
                                      fontSize: 16.0, letterSpacing: 1.2),
                                ),
                              ), // Will be change later
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Humidity',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${state.weather.humidity}%',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ), // Will be change later
                            ]),
                          ],
                        ),
                      ],
                    );
                  } else if (state is WeatherError) {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
