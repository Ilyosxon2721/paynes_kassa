import 'package:get/get.dart';

import 'controller.dart';

class MibFirstBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MibFirstController>(() => MibFirstController());
  }
}
