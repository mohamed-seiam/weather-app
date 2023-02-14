import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetharpp/models/weather_model.dart';
import 'package:wetharpp/provider/wheather_provider.dart';
import 'package:wetharpp/services/web_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key, this.upDateUi});

  VoidCallback? upDateUi;

  @override
  Widget build(BuildContext context) {
    void _close() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WebServices? webServices = WebServices();
              WeatherModel ? weatherModel =
                  await webServices.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              _close();
            },
            decoration:  InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              hintText: 'Enter a City',
              label: const Text('search'),
              suffixIcon: IconButton(
                  onPressed: () async{
                    WebServices? webServices = WebServices();
                    WeatherModel ? weatherModel =
                        await webServices.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false).weatherData =
                        weatherModel;
                    Provider.of<WeatherProvider>(context, listen: false).cityName =
                        cityName;
                    _close();
                  },
                  icon: const Icon(Icons.search_rounded),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              // filled: true,
            ),
          ),
        ),
      ),
    );
  }
}
