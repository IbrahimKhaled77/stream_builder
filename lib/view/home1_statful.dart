import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stream_builder/model/model_api.dart';
import 'package:http/http.dart' as http;

class home2 extends StatefulWidget {
  const home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
    late Stream< CurrentWeather> c=getChangeStreams();
  StreamController<CurrentWeather>? streamController = StreamController();

  @override
  void initState() {
 // Timer.periodic(Duration(seconds: 3), (timer) {
 //  c =getChangeStreams();
 // });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CurrentWeather>(
        stream: c,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Scaffold(
                body: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Witing"),
                  ),
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Scaffold(
                  body: Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("ERROR"),
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(snapshot.data!.main!.temp! - 273.15)
                                .round()
                                .toString()}\u2103',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          }
        });
  }


  Stream<CurrentWeather> getChangeStreams() async* {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Amman&appid=c30a9c4042837879d2a7bfd705c01df6');
    try {
      final response = await http.get(url);
      final dataBody = json
          .decode(response.body);

      CurrentWeather dataModel = CurrentWeather.fromJson(dataBody);
      print(dataModel.name);
      // add API response to stream controller sink
      yield dataModel;
     // streamController!.sink.add(dataModel);

      //  emit(StreamCubitSuccessState());


    } catch (error) {
      print(error);
      // emit(StreamCubitErrorState());

    }
  }
}
