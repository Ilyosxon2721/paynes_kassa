import 'package:get/get.dart';

import 'controller.dart';

class MibCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MibCheckController>(() => MibCheckController());
  }
}
