import 'package:get/get.dart';
import 'package:technical_task/Screens/HomeScreen/Controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeScreenController(),
    );
  }
}
