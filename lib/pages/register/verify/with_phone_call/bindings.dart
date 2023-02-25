import 'package:get/get.dart';

import 'controller.dart';

class VerifyWithPhoneCallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyWithPhoneCallController>(
        () => VerifyWithPhoneCallController());
  }
}
