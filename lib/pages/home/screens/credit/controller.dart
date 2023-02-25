import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class CreditController extends GetxController {
  CreditController();
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = CreditState();
}
