import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app2/models/today_response.dart';

class TodayProvider extends ChangeNotifier {
  double temp = 0;
  double temp_min = 0;
  double temp_max = 0;
  String country_city = "";
  int humidity = 0;
  double wind = 0;
  int weather_id = 0;
  String weather_desc = "";

  final url = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
    'lat': '-34.7329404',
    'lon': '-56.2168794',
    'appid': 'ea11dcb1d1126a5b47a0ed82589a448f',
    'units': 'metric',
    'lang': 'sp'
  });

  TodayProvider() {
    getTodatWeather();
  }

  getTodatWeather() async {
    final response = await http.get(url);
    final data = TodayResponse.fromJson(response.body);

    temp = data.main.temp;
    temp_min = data.main.tempMin;
    temp_max = data.main.tempMax;
    country_city = "${data.name}, ${data.sys.country}";
    humidity = data.main.humidity;
    wind = data.wind.speed;
    weather_id = data.weather[0].id;
    weather_desc = data.weather[0].description;
  }
}
