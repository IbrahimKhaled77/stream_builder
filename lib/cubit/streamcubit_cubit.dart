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
  CurrentWeather? dataModel;
  void fetchData(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e381772382f359ffed08cbcfab063a2d';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var  dataBody = json
          .decode(response.body);

       dataModel = CurrentWeather.fromJson(dataBody);
    emit(StreamCubitSuccessState());
      print(dataModel!.main!.tempMax!);
      getChangeStreams();

    } else {
     emit(StreamCubitErrorState());
      throw Exception('Failed to fetch data');
    }
  }


  Stream<CurrentWeather> getChangeStreams() async* {

      yield dataModel!;



  }


}
