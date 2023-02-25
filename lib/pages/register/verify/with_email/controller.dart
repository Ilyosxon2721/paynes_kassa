import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

import '../../../../common/global.dart';
import 'index.dart';

class VerifyWithEmailController extends GetxController {
  VerifyWithEmailController();
  var pinPutController = TextEditingController();
  final Tdlib tg = Get.put(Global()).tg;
  void checkAuthenticationCode(code) async {
    await tg
        .request(
          "checkAuthenticationEmailCode",
          parameters: {
            "code": code,
          },
          clientId: tg.client_id,
        )
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void resendAuthCode() async {
    await tg
        .invoke(
          "resendAuthenticationCode",
          clientId: tg.client_id,
        )
        .then((value) => print(value))
        .catchError((onError) => print(onError));
  }

  final state = VerifyWithEmailState();
}
