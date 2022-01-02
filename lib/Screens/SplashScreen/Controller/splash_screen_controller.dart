import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_task/Routes/app_routes.dart';

import '../../../main.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await initFireBaseApp();
    String? value = "Null";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString('UserName');
    Timer(
      const Duration(milliseconds: 1500),
      () => (value != "Null")
          ? Get.offNamed(AppRoutes.loginScreen)
          : Get.offNamed(AppRoutes.loginScreen),
    );
    super.onInit();
  }
}
