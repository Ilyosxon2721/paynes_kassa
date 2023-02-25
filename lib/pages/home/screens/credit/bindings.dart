import 'package:get/get.dart';

import 'controller.dart';

class CreditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditController>(() => CreditController());
  }
}
