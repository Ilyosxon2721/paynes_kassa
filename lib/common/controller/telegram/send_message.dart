import 'package:get/get.dart';
import 'package:paynes_kassa/common/res/global_controlls.dart';
import 'package:paynes_kassa/common/res/payments/links.dart';
import 'package:paynes_kassa/pages/home/screens/pay/controller.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

import '../../global.dart';

class SendMessageController extends GetxController {
  final Tdlib tg = Get.put(Global()).tg;
  final mainLinks = Get.put(MainLinks());
  final propsLinks = Get.put(PropsLinks());
  final gosLinks = Get.put(GosUslugiLinks());
  final payController = Get.put(PayController());
  void sendMessage(String text) async {
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": text})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void getDatas(String text) async {
    mibFirstController.isProgress.value = true;
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": text})
        .then((value) =>
            print('Telegrammmmmmmmmmmmmmmmmmmmmmmmm ${value.toString()}'))
        .catchError((onError) {
          print(onError.toString());
          mibFirstController.isProgress.value = false;
          mibFirstController.result.value = onError.toString();
        });
  }

  void back() async {
    // payController.isProgress.value = false;
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": propsLinks.back})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void cancel() async {
    // payController.isProgress.value = false;
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": propsLinks.cancel})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void toMain() async {
    // payController.isProgress.value = false;
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": mainLinks.main})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void toPay() async {
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": mainLinks.pay})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void toProps() async {
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": mainLinks.props})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  void toGosUslug() async {
    await tg
        .request("sendMessage",
            parameters: {"chat_id": 118365835, "text": mainLinks.gosUslugi})
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }
}
