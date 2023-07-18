import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/cubit/streamcubit_state.dart';
import 'package:http/http.dart' as http;
import 'package:stream_builder/model/model_api.dart';

class StreamCubit extends Cubit<StreamCubitState> {
  StreamCubit() : super(StreamCubitInitialState());

  static StreamCubit get(context)=>BlocProvider.of(context);


  Stream<int?> getChangeStream() async*{

    await Future.delayed(const Duration(seconds: 3));
    yield 2;
    await Future.delayed(const Duration(seconds: 1));
    yield 5;
    await Future.delayed(const Duration(seconds: 0));
    yield 8;


  }

  CurrentWeather?  dataModel;
  Stream<CurrentWeather> getChangeStreams() async* {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=amman&appid=e381772382f359ffed08cbcfab063a2d');
    try {
      var response = await http.get(url);
      var  dataBody = json
          .decode(response.body);

       dataModel = CurrentWeather.fromJson(dataBody);
      print(dataModel!.name);
      yield dataModel!;

   //   streamController.sink.add(dataModel);


    } catch (error) {
      print(error);
       //emit(StreamCubitErrorState());

    }

  }


}
