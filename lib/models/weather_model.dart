import 'package:flutter/material.dart';

class WeatherModel {
 String ? date;
 String ? cityName;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.cityName});

  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        cityName: data['location']['region'],
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'temp = $temp midTemp = $minTemp date = $date ';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'||weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/imges/snow.png';
    } else if (weatherStateName == 'Heavy Cloud'||weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' || weatherStateName == 'Patchy rain possible' || weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'||weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud'||weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' || weatherStateName == 'Patchy rain possible') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.blueGrey;
    } else {
      return Colors.blue;
    }
  }
}
