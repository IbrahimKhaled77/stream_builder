/*import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class Notifications {
  static final notification = FlutterLocalNotificationsPlugin();
  static final onNotification=BehaviorSubject<String?>();

  static Future _notificationDetails() async {

    return NotificationDetails(

      android:  AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );


  }

  static Future init({bool initScheduled=false})async {
    final andriod=AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios=IOSInitializationSettings();
    final settings=InitializationSettings(android: andriod,iOS: ios);


        await notification.initialize(
          settings,

          onSelectNotification: (payload) async {
            onNotification.add(payload);
          }

        );
  }


  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notification.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
}

 */
