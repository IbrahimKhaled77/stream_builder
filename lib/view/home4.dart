import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map<String, dynamic> weatherData = {};

  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchData('Amman').then((data) {
      setState(() {
        weatherData = data;
      });
    });

    // Set up a timer to fetch data every 5 minutes
    timer = Timer.periodic(Duration(minutes: 5), (Timer t) {
      fetchData('Amman').then((data) {
        setState(() {
          weatherData = data;
        });
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<Map<String, dynamic>> fetchData(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e381772382f359ffed08cbcfab063a2d';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (weatherData.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        weatherData['name'],
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${weatherData['main']['temp']}°C',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
              ],
            ),
            ),
       );
    }
}