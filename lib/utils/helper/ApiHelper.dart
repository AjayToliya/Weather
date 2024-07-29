import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/DataModel.dart';

class Apihelpers {
  Apihelpers._();

  static final Apihelpers apihelper = Apihelpers._();

  Future<WeatherData?> fetchData({required search}) async {
    final response = await http.get(
      Uri.parse(
          "https://api.weatherapi.com/v1/current.json?key=65f30b74ba9b4e95b9580358242707&q=${search}&aqi=no"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      WeatherData weather = WeatherData.fromJson(decodedData);
      return weather;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }
}
