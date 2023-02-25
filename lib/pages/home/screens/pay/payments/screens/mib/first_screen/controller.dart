import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class MibFirstController extends GetxController {
  MibFirstController();
  final controller = PageController().obs;
  final isError = false.obs;
  RxString result = ''.obs;
  final isProgress = false.obs;
  Rx<TextEditingController> numberController = TextEditingController().obs;
  void setIsProgress(bool value) {
    isProgress.value = value;
    update();
  }

  void setResult(String value) {
    result.value = value;
    update();
  }

  void clear() {
    isError.value = false;
    result.value = '';
    isProgress.value = false;
    numberController.value.text = '';
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  final state = MibFirstState();
}
