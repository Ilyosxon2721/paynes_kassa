import 'package:get/get.dart';

import 'controller.dart';

class IncashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncashController>(() => IncashController());
  }
}
