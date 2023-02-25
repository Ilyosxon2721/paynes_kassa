import 'package:get/get.dart';

import 'controller.dart';

class MibSecondBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MibSecondController>(() => MibSecondController());
  }
}
