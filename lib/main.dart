import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/bloc_observse/bloc_observs.dart';
import 'package:stream_builder/view/home4.dart';
import 'package:stream_builder/view/home4_statful_cubit.dart';
import 'package:stream_builder/view/home_cubit.dart';

void main() {
  Bloc.observer=const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStatFulCubit(),
    );
  }
}


