

import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/cubit_statful/statful_state.dart';
import 'package:http/http.dart' as http;
import 'package:stream_builder/model/model_api.dart';
class StatefulCubit extends Cubit<StatefulState> {
  StatefulCubit() : super(StatefulInitial());

  static StatefulCubit get(context)=>BlocProvider.of(context);

  CurrentWeather? model;
  Timer? timer;
  void initState() {

    fetchData('Amman').then((data) {
      model = data;
    });

    // Set up a timer to fetch data every 5 minutes
    timer = Timer.periodic(const Duration(minutes: 2), (Timer t) {
      fetchData('Amman').then((data) {
        model = data;

      });
    });
  }

  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed

  }



  Future<CurrentWeather> fetchData(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e381772382f359ffed08cbcfab063a2d';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var  dataBody = json
          .decode(response.body);

      CurrentWeather  dataModel = CurrentWeather.fromJson(dataBody);
      emit(StatefulSuccessState());
      print(dataModel.main!.tempMax!);
      return dataModel;
    } else {
      emit(StatefulErrorState());
      throw Exception('Failed to fetch data');
    }
  }





}
