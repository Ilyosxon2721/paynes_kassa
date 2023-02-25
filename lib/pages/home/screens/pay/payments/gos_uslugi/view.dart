import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/pages/home/screens/pay/payments/screens/mib/check_screen/index.dart';
import 'package:paynes_kassa/pages/home/screens/pay/payments/screens/mib/second_screen/index.dart';

import '../../../../../../common/res/global_controlls.dart';
import '../screens/mib/first_screen/index.dart';
import 'controller.dart';

class PayToGosUslugiPage extends GetView<GosUslugiController> {
  const PayToGosUslugiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sendMsg.back();
    sendMsg.toGosUslug();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: gosController.state.uslugi.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Get.generalDialog(pageBuilder: (context, _, __) {
                  return Obx(() => gosController.mibCheckingSuccess.value
                      ? const MibSecondPage()
                      : gosController.mibPaid.value
                          ? const MibCheckScreenPage()
                          : const MibFirstPage());
                });
                // print(controller.state.uslugi.length);
                sendMsg.sendMessage(controller.state.uslugi[index].link);
                // switch (index) {
                //   case 12:
                //     Get.toNamed(AppRoutes.mibFirstPage);
                //     break;
                // }
              },
              child: Image.asset(
                gosController.state.uslugi[index].iconLink,
              ),
            ),
          );
        },
      ),
    );
  }
}
