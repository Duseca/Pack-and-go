import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/config/routes/routes.dart';
import 'package:pack_and_go/config/theme/light_theme.dart';
import 'package:pack_and_go/localization/languages/languages.dart';

void main() {
  runApp(MyApp());
}

final String dummyImage2 =
    'https://images.unsplash.com/photo-1727891521863-ba8c598bad4e?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw5fHx8ZW58MHx8fHx8';
final String dummyImage =
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
final String dummyImage3 =
    'https://images.unsplash.com/photo-1736144287605-3919f585752c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMzR8fHxlbnwwfHx8fHw%3D';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      translations: Languages(),
      locale: Get.locale, // Ensure it's set correctly here
      fallbackLocale:
          Locale('es', 'ES'), // Fallback to Spanish if locale not set
      title: 'PACK AND GO',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppLinks.splash_screen,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: AppRoutes.pages,
    );
  }
}
