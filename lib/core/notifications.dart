/*
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
//import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initlize() async {
    tz.initializeTimeZones();

    _localNotificationService
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("mipmap/ic_launcher");
    DarwinInitializationSettings darwinInitializationSettings =
    const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    await _localNotificationService.initialize(initializationSettings);
  }

  Future<NotificationDetails> _notificationDetails(String id) async {
    //  final largeIconPath = await Utils.downLoadFile('url', "largeIcon");
    final bigImagePath = await Utils.downLoadFile(
        "https://sacredsites.com/images/middle_east/saudi_arabia/mecca_great_mosque_600.jpg",
        "bigPicture");
    final styleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigImagePath),
      //  largeIcon: FilePathAndroidBitmap(largeIconPath)
    );
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(id, "channelName",
        enableVibration: true,
        fullScreenIntent: true,
        importance: Importance.max,
        playSound: true,
        priority: Priority.max,
        styleInformation: styleInformation,
        channelDescription: "descreption",
        sound: const RawResourceAndroidNotificationSound("notification"));
    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(sound: "notification.wav");
    return NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required DateTime date,
  }) async {
    final details = await _notificationDetails(id.toString());
    await _localNotificationService.zonedSchedule(
        id, title, body, tz.TZDateTime.from(date, tz.local), details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);

    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkk$date");
  }

  // Define the callback function
  Future<void> _onNotificationReceived(RemoteMessage message) async {
    await showNotification(
        id: 1,
        title: "fireeeeeee",
        body: "baseeeeee",
        date: DateTime.now().add(Duration(seconds: 5)));
  }

  onmessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onNotificationReceived(message);
    });
    FirebaseMessaging.onBackgroundMessage(
            (message) => _onNotificationReceived(message));
  }

  void sendFCMMessage(String recipientToken, String title, String body) async {
    // Create the message data
    final Map<String, String> messagee = {
      'title': title,
      'body': body,
      'to': recipientToken,
    };

    // Send the message using FirebaseMessaging
    await FirebaseMessaging.instance
        .sendMessage(data: messagee, to: recipientToken);
      }
}*/
