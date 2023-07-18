import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_builder/bloc_observse/bloc_observs.dart';
import 'package:stream_builder/view/home4_statful_cubit.dart';

import 'core/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const SimpleBlocObserver();

  final notificationService = NotificationServices();
  await notificationService.initlize();
  notificationService.showNotification(
      id: 1, title: "اشعار تغير الحراره", body: "لقد تغيرت الحراره");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStatFulCubit(),
    );
  }
}
