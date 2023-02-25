import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/controller/telegram/send_message.dart';
import 'index.dart';

class HomeController extends GetxController {
  HomeController();
  final state = HomeState();
  final sendMsg = Get.put(SendMessageController());
  Rx<PageController> page = PageController().obs;
  Rx<SideMenuController> side = SideMenuController().obs;
  @override
  void onInit() {
    sendMsg.sendMessage('/start');
    super.onInit();
  }
}
