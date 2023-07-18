

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/bloc/stream_bloc.dart';
import 'package:stream_builder/model/model_api.dart';

class home3 extends StatelessWidget {
  const home3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StreamBloc()..add(GetStreamChangeApiEvents()),
      child: BlocConsumer<StreamBloc, StreamState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StreamBloc.get(context);
          if(state is StreamSuccessState){
            return StreamBuilder<CurrentWeather>(
                stream: state.a,
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
          }else if(state is StreamErrorState){
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Text(state.error,style: const  TextStyle(fontSize: 30.0),),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body:  Center(
              child:CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
