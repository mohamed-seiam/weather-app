import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wetharpp/constance.dart';
import 'package:wetharpp/models/weather_model.dart';

class WebServices {
  Future<WeatherModel ?> getWeather({required String cityName}) async {
    WeatherModel ? weatherModel;
   try
   {
     Uri url =
     Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
     http.Response response = await http.get(url);
     Map<String, dynamic> data = jsonDecode(response.body);
     print(data.toString());
    weatherModel  = WeatherModel.fromjson(data);
   }
   catch (e)
   {
      print(e.toString());
   }
    return weatherModel;
  }
}
