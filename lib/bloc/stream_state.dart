part of 'stream_bloc.dart';

abstract class StreamState {}

class StreamInitialStates extends StreamState {}

class StreamSuccessState extends StreamState {
  Stream <CurrentWeather>a;
  StreamSuccessState(this.a);
}
class StreamSuccessStates extends StreamState {

}


class StreamErrorState extends StreamState {
  String error;
  StreamErrorState(this.error);


}