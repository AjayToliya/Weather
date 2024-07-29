import 'package:flutter/material.dart';
import 'package:wather/model/DataModel.dart';
import 'package:wather/utils/helper/ApiHelper.dart';

class WeatherProvider extends ChangeNotifier {
  List<WeatherData> weatherDataList = [];

  Future<void> fetchWeatherData(String search) async {
    final weatherData = await Apihelpers.apihelper.fetchData(search: search);
    if (weatherData != null) {
      weatherDataList = [weatherData];
      notifyListeners();
    }
  }
}
