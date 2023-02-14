import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetharpp/models/weather_model.dart';
import 'package:wetharpp/pages/home_pages.dart';
import 'package:wetharpp/provider/wheather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return WeatherProvider();
  },
  child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue :Provider.of<WeatherProvider>(context).weatherData!.getColor() ,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
