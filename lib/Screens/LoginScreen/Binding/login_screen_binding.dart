import 'package:get/get.dart';
import 'package:technical_task/Screens/LoginScreen/Controller/login_screen_controller.dart';
import 'package:technical_task/Screens/SplashScreen/Controller/splash_screen_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginScreenController(),
    );
  }
}
