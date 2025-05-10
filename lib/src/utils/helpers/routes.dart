import '../../features/authentication/views/sign_up/view/signup.dart';
import 'package:flutter/material.dart';

import '../../features/notification_view/view/notification.dart';
class AppRoutes {
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String notificationScreen = '/notification_screen';

  // static const String signIn = '/signIn';
  // static const String signIn = '/signIn';
  // static const String signIn = '/signIn';
  // static const String signIn = '/signIn';

  static Map<String, Widget Function(BuildContext)> routes = {
    notificationScreen : (context) => const NotificationPages(),
    signUp : (context) =>  const SignUp(),
  };
}
