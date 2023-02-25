import 'package:get/get.dart';

import 'controller.dart';

class VerifyWithEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyWithEmailController>(() => VerifyWithEmailController());
  }
}
