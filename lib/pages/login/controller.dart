import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class LoginController extends GetxController {
  LoginController();
  // final telegramService = Get.put(GetXTelegramService());
  final telegramController = Get.put(TelegramController());
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = LoginState();
  @override
  void onReady() {
    print(telegramController.tg.client_id);
    super.onReady();
  }
}
