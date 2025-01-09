import 'package:get/get.dart';
import 'package:pack_and_go/view/screens/launch/splash_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splash_screen,
      page: () => const SplashScreen(),
    ),
  ];
}

class AppLinks {
  static const splash_screen = '/splash_screen';
}
