import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  String url = "https://anita-fcm-git-main-adilasharaf.vercel.app";
  String vapId =
      "BIADHO3J6drNfon_68SFyYmpTh82vUawBwjZ41W5fripULSJHKq0cM0hv7_L78NuPDju9D6nVEP1KOZvkCdXxIc";
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log('A bg message just showed up:${message.messageId}');
  }

  Future<void> initialize() async {
    try {
      await FlutterLocalNotificationsPlugin()
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        await getToken();
        log("Messaage Service Activated");
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        log('provisional Messaage Service Activated');
        await getToken();
      } else {
        log('User declined or has not accepted permission');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getToken() async {
    String? token;
    try {
      if (kIsWeb) {
        token = await FirebaseMessaging.instance.getToken(vapidKey: vapId);
      } else {
        token = await FirebaseMessaging.instance.getToken();
      }
      log(token.toString());
    } catch (error) {
      log("token error");
    }
    return token;
  }

  Future<void> notificationLayout(
    RemoteMessage message,
  ) async {
    RemoteNotification? notification = message.notification;
    try {
      await FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                importance: Importance.max,
                icon: "@drawable/notification_icon",
                priority: Priority.max,
                enableVibration: true,
              ),
              iOS: const DarwinNotificationDetails()));
      log("Showing Notification");
    } catch (e) {
      log("notificationLayout Error :$e");
    }
  }

  void onMessageOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message opened App');
    });
  }

  Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      if (notification != null && !kIsWeb) {
        await notificationLayout(message);
        log(message.toMap().toString());
      }
      log('A message Recieved in foreground');
    });
  }

  Future<void> subscribetoTopic(String topic) async {
    try {
      await http.post(Uri.parse('$url/subscribe'), body: {
        "token": await getToken(),
        "topic": topic,
      });
      log(" Subscribed to  $topic ");
    } catch (e) {
      log(e.toString());
      log("could't subscribe to topic ");
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await http.post(Uri.parse('$url/unsubscribe'), body: {
        "token": await getToken(),
        "topic": topic,
      });
      log(" unsubscribed from $topic ");
    } catch (e) {
      log(e.toString());
      log("could't unsubscribe from topic ");
    }
  }

  Future<void> sendmessage(
      {required String to, required String title, required String body}) async {
    try {
      await http.post(Uri.parse('$url/send'),
          body: {"title": title, "body": body, "topic": to});
      log('Message Sended');
    } catch (e) {
      log(e.toString());
    }
  }
}
