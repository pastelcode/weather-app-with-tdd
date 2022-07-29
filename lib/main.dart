import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app_with_tdd/injection.dart'
    as dependency_injection;
import 'package:flutter_weather_app_with_tdd/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  dependency_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => dependency_injection.locator<WeatherBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Weather app',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
