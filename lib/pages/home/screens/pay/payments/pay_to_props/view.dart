import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/controller/telegram/send_message.dart';
import 'package:paynes_kassa/pages/home/screens/pay/payments/pay_to_props/controller.dart';

import '../dialogs/pay_to_props_dialogs/pay_to_props_20.dart';

class PayToPropsPage extends GetView<PropsController> {
  const PayToPropsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PropsController());
    final sendMsg = Get.put(SendMessageController());
    sendMsg.back();
    sendMsg.toProps();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          itemCount: controller.state.props.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  getDialogPayToProps20(
                    index,
                  );
                  sendMsg.sendMessage(controller.state.props[index].link);
                },
                child: Image.asset(
                  controller.state.props[index].iconLink,
                ),
              ),
            );
          }),
    );
  }
}
