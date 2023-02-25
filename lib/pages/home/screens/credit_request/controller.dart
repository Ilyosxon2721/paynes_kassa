import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class CreditRequestController extends GetxController {
  CreditRequestController();
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = CreditRequestState();
}
