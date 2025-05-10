import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../../common/layouts/layout_with_back_button/layout_with_back_button.dart';

class NotificationPages extends StatelessWidget {
  const NotificationPages({super.key});

  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage;

    return AppLayoutWithBackButton(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message.notification!.title.toString()),
            Text(message.notification!.body.toString()),
          ],
        ),
      ),
    );
  }
}