import 'package:get/get.dart';

import 'controller.dart';

class VerifyWithTelegramBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyWithTelegramController>(
        () => VerifyWithTelegramController());
  }
}
