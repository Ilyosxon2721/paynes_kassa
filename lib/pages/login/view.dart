import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/style/images.dart';

import '../../common/routes/names.dart';
import '../../common/values/colors.dart';
import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  Widget _buildLoginForm() {
    return Center(
      child: SizedBox(
        width: 100.w,
        height: 400.h,
        child: Obx(() {
          return Card(
            color: Colors.white,
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImagesBox.paynes,
                    width: 100.w,
                    height: 150.h,
                  ),
                  TextField(
                    controller: controller.loginController.value,
                    focusNode: FocusNode(),
                    decoration: const InputDecoration(
                      label: Text('Login'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: controller.loginController.value,
                    focusNode: FocusNode(),
                    decoration: const InputDecoration(
                        label: Text('Password'), border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.home);
                      // telegramController.onInit();
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: _buildLoginForm(),
    );
  }
}
