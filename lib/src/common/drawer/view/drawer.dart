import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/data/repositories/auth_repositories.dart';
import '../../../features/feedback/view/feedback_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/drawer_card.dart';
import 'widgets/header_part.dart';

class AppDrawer extends StatelessWidget {
  final String userName, email;

  const AppDrawer({required this.userName, required this.email, super.key});

  void _showDialog() {
    AuthRepository controller = Get.put(AuthRepository());
    showDialog(
        context: Get.overlayContext!,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.info),
            title: Text(AppLocalizations.of(context)!.logout),
            content: Text(AppLocalizations.of(context)!.logoutWarning),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                      onPressed: () async {
                        controller.logout();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.yes,
                      )),
                  CupertinoButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(AppLocalizations.of(context)!.no)),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            DrawerHeaderPart(userName: userName, email: email),
            DrawerCard(
              onTap: () {
                Get.to(() => const FeedbackForm());
              },
              title: AppLocalizations.of(context)!.feedback,
              icon: Icons.feedback,
            ),
            DrawerCard(
              onTap: () => _showDialog(),
              title: AppLocalizations.of(context)!.logout,
              icon: Icons.logout,
            ),
          ],
        ),
      ],
    ));
  }
}
