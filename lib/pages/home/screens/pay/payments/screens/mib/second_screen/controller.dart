import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class MibSecondController extends GetxController {
  MibSecondController();
  final controller = PageController().obs;
  final isError = false.obs;
  RxString result = ''.obs;
  final isProgress = false.obs;
  void setIsProgress(bool value) {
    isProgress.value = value;
    update();
  }

  void setResult(String value) {
    result.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  final state = MibSecondState();
}
