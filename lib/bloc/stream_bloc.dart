
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/model/model_api.dart';
import 'package:http/http.dart' as http;

part 'stream_event.dart';
part 'stream_state.dart';

class StreamBloc extends Bloc<StreamEvent, StreamState> {
  static StreamBloc get(context)=>BlocProvider.of(context);
  StreamBloc() : super(StreamInitialStates()) {

    // ignore: void_checks
    on<StreamEvent>((event, emit) async* {
      if(event is GetStreamChangeApiEvents){
        Stream<CurrentWeather> getChangeStreams() async* {

          try {
            var url = Uri.parse(
                'https://api.openweathermap.org/data/2.5/weather?q=Amman&appid=e381772382f359ffed08cbcfab063a2d');
            var response = await http.get(url);
            var dataBody = json.decode(response.body);

            CurrentWeather dataModel = CurrentWeather.fromJson(dataBody);
            print(dataModel.name);

            yield dataModel;


          } catch (error) {
            print(error);
            emit(StreamErrorState(error.toString()));

          }
        }

        var a= getChangeStreams();
        emit(StreamSuccessState(a));
      }

    });
  }

}
