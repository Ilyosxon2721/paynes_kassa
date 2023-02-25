import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/style/images.dart';
import 'package:telegram_client/telegram_client.dart';

import '../../common/controller/telegram/telegram_service.dart';
import '../../common/global.dart';
import '../../common/values/colors.dart';
import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _buildRegisterForm() {
    final Tdlib tg = Get.put(Global()).tg;
    final telegramService = Get.put(TelegramService());
    return Center(
      child: SizedBox(
        width: 100.w,
        height: 400.h,
        child: Card(
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
                // PrettyQr(
                //   roundEdges: true,
                //   size: 200,
                //   data:
                //       'tg://login?token=AQLpWe9jGp6l4TEBKhYH6XbpNoYK0R7l-iOlOLuXu7L0fQ==',
                //   errorCorrectLevel: QrErrorCorrectLevel.M,
                // ),

                TextFormField(
                  controller: controller.phoneController.value,
                  onChanged: (value) {
                    controller.phoneNumber.value = '+998$value';
                    print(controller.phoneNumber.value);
                    if (value.length == 9) {
                      telegramService
                          .setPhoneNumber(controller.phoneNumber.value);
                    }
                  },
                  onTap: () {},
                  onEditingComplete: () {},
                  keyboardType: TextInputType.number,
                  maxLength: 9,
                  decoration: const InputDecoration(
                    prefixText: '+998',
                    prefixStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'phone number',
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: _buildRegisterForm(),
    );
  }
}
