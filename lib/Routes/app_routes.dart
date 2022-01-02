import 'package:get/get.dart';
import 'package:technical_task/Screens/HomeScreen/Binding/home_screen_binding.dart';
import 'package:technical_task/Screens/HomeScreen/home_screen.dart';
import 'package:technical_task/Screens/LoginScreen/Binding/login_screen_binding.dart';
import 'package:technical_task/Screens/LoginScreen/login_screen.dart';
import 'package:technical_task/Screens/SplashScreen/Binding/splash_screen_binding.dart';
import 'package:technical_task/Screens/SplashScreen/splash_screen.dart';

class AppRoutes {
  static String loginScreen = "/login_screen";
  static String initialRoute = "/splash_screen";
  static String homeScreen = "/home_screen";
  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeScreenBinding(),
      ],
    ),
  ];
}
