import 'package:get/get.dart';

import 'controller.dart';

class ExchangeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExchangeController>(() => ExchangeController());
  }
}
