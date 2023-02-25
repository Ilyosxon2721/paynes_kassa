import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class IncashController extends GetxController {
  IncashController();
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = IncashState();
}
