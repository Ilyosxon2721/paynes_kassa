import 'package:get/get.dart';

import 'controller.dart';

class MonitoringBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringController>(() => MonitoringController());
  }
}
