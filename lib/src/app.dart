import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:upgrader/upgrader.dart';
import '../main.dart';
import 'features/splash/view/splash_screen.dart';
import './utils/theme/theme.dart';
import './utils/constants/text_strings.dart';
import 'common/bindings/general_bindings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utils/helpers/routes.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp(
        title: AppTexts.appName,
        themeMode: ThemeMode.system,
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
          initialBinding: GeneralBindings(),
          locale: const Locale('en'),
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],
        navigatorKey: navigatorKey,
        home: UpgradeAlert(

          child: const SplashScreen(),
        ),

        routes: AppRoutes.routes,
      ),
    );
  }
}


