import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class ExchangeController extends GetxController {
  ExchangeController();
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = ExchangeState();
}
