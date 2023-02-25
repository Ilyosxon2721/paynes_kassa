import 'package:get/get.dart';

import 'controller.dart';

class IncashOperationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncashOperationsController>(() => IncashOperationsController());
  }
}
