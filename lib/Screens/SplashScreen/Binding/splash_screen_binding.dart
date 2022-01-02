import 'package:get/get.dart';
import 'package:technical_task/Screens/SplashScreen/Controller/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashScreenController(),
    );
  }
}
