


import 'package:stream_builder/model/model_api.dart';

abstract class StreamCubitState {}

class StreamCubitInitialState extends StreamCubitState {}

class StreamCubitSuccessState extends StreamCubitState {
  Stream<CurrentWeather> model;

  StreamCubitSuccessState(this.model);

}

class StreamCubitErrorState extends StreamCubitState {}

class StreamCubitError22State extends StreamCubitState {}
