import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telegram_client/tdlib/tdlib.dart';
import 'package:telegram_client/telegram_client.dart';

import '../../../../common/global.dart';
import 'index.dart';

class MainController extends GetxController {
  MainController();
  final Tdlib tg = Get.put(Global()).tg;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> cashInMobileNumberController =
      TextEditingController().obs;
  Rx<FocusNode> mobileNumberFocus = FocusNode().obs;
  Rx<FocusNode> cashInMobileNumberFocus = FocusNode().obs;
  void sendMessage() async {
    // await tg.invoke("sendMessage", iSAutoGetChat: true, parameters: {
    //   "chat_id": 118365835,
    //   "text": "/start"
    // }).then((value) => print(value));
    tg.request("sendMessage", parameters: {
      "chat_id": 118365835,
      "text": "💸 Оплата"
    }).then((value) => print(value));
  }

  void getChat() async {
    final result = await tg.getChat(
      118365835,
      clientId: tg.client_id,
    );
    print(result);
    // final result = await tg.invoke('getMessages');
    // print(result);
  }

  void getChats() async {
    await tg
        .invoke(
          "getChat",
          parameters: {
            "limit": 1000,
          },
          clientId: tg.client_id,
        )
        .then((value) => print(value));
  }

  final state = MainState();
}
