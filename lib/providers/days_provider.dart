import 'package:flutter/material.dart';
import 'package:weather_app2/models/weather_day.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DaysProvider extends ChangeNotifier {
  // final lat = '-34.7329404';
  // final lon = '-56.2168794';
  // final appid = 'ea11dcb1d1126a5b47a0ed82589a448f';
  // final units = 'metric';
  // final lang = 'sp';
  List<WeatherDay> listaDias = [];
  String ciudad = "";
  DaysProvider() {
    getDays();
  }
  var url = Uri.https('api.openweathermap.org', 'data/2.5/forecast', {
    'lat': '-34.7329404',
    'lon': '-56.2168794',
    'appid': 'ea11dcb1d1126a5b47a0ed82589a448f',
    'units': 'metric',
    'lang': 'sp'
  });

  Future<List<WeatherDay>> getDays() async {
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse);
      ciudad =
          '${jsonResponse['city']['name']}, ${jsonResponse['city']['country']}';

      if (listaDias.isEmpty) {
        for (var element in jsonResponse['list']) {
          listaDias.add(
            WeatherDay(
              fecha: element['dt_txt'],
              temp_min: element['main']['temp_min'].toString().split(".")[0],
              temp_max: element['main']['temp_max'].toString().split(".")[0],
              description: element['weather'][0]['description'],
            ),
          );
        }
      }

      // final data = WeatherDay.fromJson(jsonResponse);
      // listaDias.addAll(data);

      notifyListeners();
    }

    return listaDias;
  }
}
