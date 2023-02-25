import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterController extends GetxController {
  RegisterController();
  // final telegramService = Get.put(GetXTelegramService());
  final phoneController = TextEditingController().obs;
  final phoneNumber = ''.obs;
  final state = RegisterState();
}
