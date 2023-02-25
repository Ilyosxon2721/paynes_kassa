import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProfileController extends GetxController {
  ProfileController();
  final loginController = TextEditingController().obs;
  final pswController = TextEditingController().obs;
  final state = ProfileState();
}
