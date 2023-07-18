import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/cubit_statful/statful_cubit.dart';
import 'package:stream_builder/cubit_statful/statful_state.dart';

class HomeStatFulCubit extends StatelessWidget {
  const HomeStatFulCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatefulCubit()..initState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: BlocConsumer<StatefulCubit, StatefulState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var cubit=StatefulCubit.get(context);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (cubit.model != null)
                    Column(
                      children: [
                        Text(
                          '${cubit.model!.name}',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${(cubit.model!.main!.temp!  - 273.15).round().toString()}\u2103',
                          style:const  TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 16),
                        Text(
            'min: ${(cubit.model!.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(cubit.model!.main!
                .tempMax
            !- 273.15).round().toString()}\u2103'),

                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
