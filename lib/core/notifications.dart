import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class NotificationServices {
  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initlize() async {
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
        "https://w7.pngwing.com/pngs/881/489/png-transparent-red-bell-notification-thumbnail.png",
        "bigPicture");
    final styleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigImagePath),
      //  largeIcon: FilePathAndroidBitmap(largeIconPath)
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      id,
      "channelName",
      enableVibration: true,
      fullScreenIntent: true,
      importance: Importance.max,
      playSound: true,
      priority: Priority.max,
      styleInformation: styleInformation,
      channelDescription: "descreption",
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    return NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails(id.toString());
    await _localNotificationService.show(id, title, body, details);
  }
}

class Utils {
  static Future<String> downLoadFile(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
