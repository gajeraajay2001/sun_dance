import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_task/Routes/app_routes.dart';
import '../../../main.dart';

class SplashScreenController extends GetxController {
  late var userName;
  @override
  void onInit() async {
    await initFireBaseApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('UserName2');
    Timer(
      const Duration(milliseconds: 1500),
      () => (userName != null)
          ? Get.offNamed(AppRoutes.homeScreen)
          : Get.offNamed(AppRoutes.loginScreen),
    );
    super.onInit();
  }
}
