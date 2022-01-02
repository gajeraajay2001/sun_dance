import 'package:get/get.dart';
import 'package:technical_task/Data/ApiClient/api_client.dart';
import 'pref_utils.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
  }
}
