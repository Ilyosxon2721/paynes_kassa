import 'package:get/get.dart';
import 'package:paynes_kassa/pages/home/screens/pay/payments/screens/mib/second_screen/controller.dart';

import '../../pages/home/screens/pay/payments/gos_uslugi/controller.dart';
import '../../pages/home/screens/pay/payments/screens/mib/first_screen/controller.dart';
import '../controller/telegram/send_message.dart';

final gosController = Get.put(GosUslugiController());
final sendMsg = Get.put(SendMessageController());
final mibFirstController = Get.put(MibFirstController());
final mibSecondController = Get.put(MibSecondController());
