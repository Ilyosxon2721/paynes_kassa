import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class MonitoringController extends GetxController {
  MonitoringController();
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = MonitoringState();
}
