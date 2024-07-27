import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather/model/DataModel.dart';

import '../provider/Search_Provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 4,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Search Here...",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<WeatherProvider>(context, listen: false)
                        .fetchWeatherData(searchController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    elevation: 5,
                  ),
                  child: Text("Search"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  return ListView.builder(
                    itemCount: weatherProvider.weatherDataList.length,
                    itemBuilder: (context, i) {
                      final data = weatherProvider.weatherDataList[i];
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => buildBottomSheet(data),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https:${data.conditionIcon}",
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.locationName,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.blue, // Primary blue color
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Temperature: ${data.tempC} °C / ${data.tempF} °F",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "Condition: ${data.conditionText}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(WeatherData data) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 50,
                color: Colors.blue.shade200, // Light blue color
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.location_on,
                    color: Colors.blue), // Primary blue color
                SizedBox(width: 10),
                Text(
                  data.locationName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 10),
            buildDetailRow("Region", data.region),
            buildDetailRow("Country", data.country),
            buildDetailRow(
              "Temperature",
              "${data.tempC} °C / ${data.tempF} °F",
            ),
            buildDetailRow("Condition", data.conditionText),
            SizedBox(height: 10),
            Center(
              child: Image.network(
                "https:${data.conditionIcon}",
                height: 80,
              ),
            ),
            SizedBox(height: 10),
            buildDetailRow("Wind", "${data.windKph} kph"),
            buildDetailRow("Humidity", "${data.humidity}%"),
            buildDetailRow("Cloud", "${data.cloud}%"),
            buildDetailRow(
              "Feels Like",
              "${data.feelslikeC} °C / ${data.feelslikeF} °F",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
