import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static Future<void> requestPermission() async {
    //Request permission to show notification
    PermissionStatus status = await Permission.notification.request();
    if (status != PermissionStatus.granted) {
      throw Exception("Permission not granted");
    }
  }

  static Future<void> uploadFCMToken() async {
    final firebaseFirestore = FirebaseFirestore.instance;
    final _currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseMessaging.instance.getToken().then((token) async {
        log("getToken:::::: $token");
        await firebaseFirestore.collection(USERS).doc(_currentUser!.uid).set({
          NOTIFICATION_TOKEN: token,
          EMAIL: _currentUser.email,
        });
        FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
          log("onTokenRefresh:::::::::$token");
          await firebaseFirestore.collection(USERS).doc(_currentUser.uid).set({
            NOTIFICATION_TOKEN: token,
            EMAIL: _currentUser.email,
          });
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    try {
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      log(e.toString());
    }
  }

  showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_Id', 'basic_channel',
            channelDescription: "Channel Description",
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    int notificationId = 1;
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        notificationId,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: "No Present");
  }
}

class ConstantValue {
  static const String BASE_URL = 'https://fcm.googleapis.com/fcm/send';
  static const String KEY_SERVER =
      'AAAAMzzhKek:APA91bFD1LYL7XsxTAXvc-iuIa_RbFk-X_2zYk9bHgvVrr0xblLAXyMh4WBCxIk3MYxmDHjcah8ZqWXZvCaykr0Cj3qBxLTLKKU7wxFr3Qo29sst_Y6tNz1QqpnZk6mrPbeCxP2rAk2p';
  static const String SENDER_ID = '220064721385';
}

class AdminNotificationServices {
  Future<bool> pushNotification(
      {required String title,
      required String body,
      required String token}) async {
    try {
      Map<String, dynamic> payload = {
        'to': token,
        // 'data': {
        //   'via': 'FlutterFire Cloud Messaging!!!',
        //   'count': _messageCount.toString(),
        // },
        'notification': {
          'title': title,
          'body': body,
          'priority': 'high',
          'sound': 'default'
        },
      };
      String dataNotifications = jsonEncode(payload);
      var response = await http.post(
          // 'https://api.rnfirebase.io/messaging/send'
        Uri.parse(ConstantValue.BASE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key= ${ConstantValue.KEY_SERVER}'
        },
        body: dataNotifications,
      );
      debugPrint(response.body.toString());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
