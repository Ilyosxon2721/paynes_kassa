import 'package:get/get.dart';

import 'controller.dart';

class CreditRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditRequestController>(() => CreditRequestController());
  }
}
