import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

import '../../../../common/global.dart';
import 'index.dart';

class VerifyWithTelegramController extends GetxController {
  VerifyWithTelegramController();
  var pinPutController = TextEditingController();
  final Tdlib tg = Get.put(Global()).tg;
  void checkAuthenticationCode(code) async {
    await tg
        .invoke(
          "checkAuthenticationCode",
          parameters: {
            "code": code,
          },
          clientId: tg.client_id,
        )
        .then((value) => print(value));
  }

  final state = VerifyWithTelegramState();
}
