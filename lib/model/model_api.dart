import 'package:stream_builder/model/main_model.dart';


class CurrentWeather{
  final String? base;
  final MainWeather? main;
  final int? visibility;
  final int? dt;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeather(
      {

        this.base,
        this.main,
        this.visibility,
        this.dt,
        this.timezone,
        this.id,
        this.name,
        this.cod});

  factory CurrentWeather.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeather();
    }

    return CurrentWeather(
      base: json['base'],
      main: MainWeather.fromJson(json['main']),
      visibility: json['visibility'],
      dt: json['dt'],
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }



}