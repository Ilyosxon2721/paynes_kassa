import 'package:get/get.dart';

import 'controller.dart';

class VerifyWithSmsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyWithSmsController>(() => VerifyWithSmsController());
  }
}
