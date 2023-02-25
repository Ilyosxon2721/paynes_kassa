import 'package:get/get.dart';

import 'controller.dart';

class VerifyWithQRBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyWithQRController>(() => VerifyWithQRController());
  }
}
