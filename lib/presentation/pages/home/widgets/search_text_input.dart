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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasInputSearchError = false;

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

  void _validateSearchInput() {
    setState(() {
      _hasInputSearchError = !_formKey.currentState!.validate();
    });
  }

  void _triggerCitySearch() {
    _validateSearchInput();
    if (!_hasInputSearchError) {
      final cityToSearch = _textController.text.trim();
      context.read<WeatherBloc>().add(OnCityChanged(
            cityName: cityToSearch,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _textController,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: 'Type here',
              suffixIcon: _formKey.currentState != null
                  ? _hasInputSearchError
                      ? const Icon(Icons.error_outline_rounded)
                      : const Icon(Icons.check_circle_outline_rounded)
                  : null,
            ),
            validator: (String? value) {
              if (value == null || value == '') {
                return 'Enter a valid country name';
              }
              return null;
            },
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (_) => _triggerCitySearch(),
            onChanged: (_) => _validateSearchInput(),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton.icon(
            onPressed: _triggerCitySearch,
            label: const Text(
              'Search city',
            ),
            icon: const Icon(Icons.search_rounded),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              minimumSize: const Size(
                double.infinity,
                36,
              ),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
