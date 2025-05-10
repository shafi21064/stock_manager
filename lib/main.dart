import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'src/app.dart';
import 'src/utils/firebase/push_notification.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp(
  //     name: "Boilerplate",
  //   options: DefaultFirebaseOptions.currentPlatform
  // );
  print("Handling a background message: ${message.data}");
}


Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final baseUrl = dotenv.env["BASE_URL"];
  if (baseUrl == null) {
    throw Exception("BASE_URL is not defined in .env file.");
  }

  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();

  await Firebase.initializeApp(
    name: "Boilerplate",
      options: DefaultFirebaseOptions.currentPlatform
  );
  final notificationServices = NotificationServices();
  notificationServices.requestNotificationPermission();
  notificationServices.firebaseInit();



  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}
