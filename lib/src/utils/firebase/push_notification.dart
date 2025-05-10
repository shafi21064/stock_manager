import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../helpers/routing_helper.dart';
import '../local_storage/local_storage_keys.dart';
import '../local_storage/storage_utility.dart';

class NotificationServices {
  // Initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Initialising flutter local notifications plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(RemoteMessage message) async {
    var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
          // Handle interaction when app is active for android
          handleMessage(message);
        });
  }

  void firebaseInit() {
    // Check if the app was launched from a terminated state via notification
    _checkInitialMessage();

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print("Notifications Title: ${notification?.title}");
        print("Notifications Body: ${notification?.body}");
        print('Count: ${android?.count}');
        print('Data: ${message.data.toString()}');
        print(
            'channel id: ${message.notification!.android!.channelId.toString()}');
      }
      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(message);
        showNotification(message);
        forgroundMessage();
      }
    });

    // Listen for background messages
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('background state');
      handleMessage(message);
    });
  }

  Future<void> _checkInitialMessage() async {
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      print('terminated state');
      // navigatorKey.currentState?.pushNamed(initialMessage.data["route"]);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print(initialMessage.data["route"]);
        handleMessage(initialMessage);
      });
    }
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        getDeviceToken();
        print('User granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User denied permission');
      }
    }
  }

  // Function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.max,
      showBadge: true,
      playSound: true,
    );

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      styleInformation: const BigTextStyleInformation(''),
    );

    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  // Function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    print("FCM TOKEN $token");
    AppLocalStorage().saveData(LocalStorageKeys.fcmToken, token);
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      if (kDebugMode) {
        print('Token refreshed: $event');
      }
    });
  }

  // Handle tap on notification when app is in background or terminated
  void handleMessage(RemoteMessage message) {
    if (message.data["route"] != null) {
      RoutingHelper.urlRouting(message.data['route']);
    }
    // String route = message.data["route"].replaceFirst("https://beta.kireibd.com", '');
    // print(route);
    // navigatorKey.currentState?.pushNamed(message.data["route"]);
  }

  Future<void> forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
