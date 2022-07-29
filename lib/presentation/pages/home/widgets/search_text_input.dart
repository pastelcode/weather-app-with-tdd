import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_tdd/presentation/presentation.dart';

class SearchTextInput extends StatefulWidget {
  const SearchTextInput({Key? key}) : super(key: key);

  @override
  State<SearchTextInput> createState() => _SearchTextInputState();
}

class _SearchTextInputState extends State<SearchTextInput> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _triggerCitySearch() {
    final cityToSearch = _textController.text.trim();
    context.read<WeatherBloc>().add(OnCityChanged(
          cityName: cityToSearch,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _textController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Guatemala',
            ),
            onSubmitted: (_) => _triggerCitySearch(),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: _triggerCitySearch,
          tooltip: 'Search city',
          icon: const Icon(Icons.search_rounded),
        ),
      ],
    );
  }
}
