import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/cubit/streamcubit_cubit.dart';
import 'package:stream_builder/cubit/streamcubit_state.dart';
import 'package:stream_builder/model/model_api.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StreamCubit()..fetchData("Amman"),
      child: BlocConsumer<StreamCubit, StreamCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          var cubit = StreamCubit.get(context);
          return StreamBuilder<CurrentWeather>(
              stream: cubit.getChangeStreams(),
              builder: (context, snapshot) {
                print("cccccccccccccccccccccccccccccccccccccccccccc");
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
                                  '${(snapshot.data!.main!.temp! - 273.15).round().toString()}\u2103',
                                  style: const TextStyle(
                                    fontSize: 30.0,


                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                }
              });
        },
      ),
    );
  }
}
