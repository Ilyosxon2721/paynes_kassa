import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/style/images.dart';
import '../../../../common/style/theme.dart';
import '../../../../common/values/colors.dart';
import '../../controller.dart';
import 'index.dart';

class VerifyWithTelegramPage extends GetView<VerifyWithTelegramController> {
  const VerifyWithTelegramPage({Key? key}) : super(key: key);

  Widget _buildPinPutForm() {
    final pinThemes = Get.put(PinPutThemes());
    final registerController = Get.put(RegisterController());
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
                  Text("Telegram Verify"),
                  Center(
                    child: SizedBox(
                      child: Pinput(
                        defaultPinTheme: pinThemes.defaultPinTheme,
                        focusedPinTheme: pinThemes.focusedPinTheme,
                        submittedPinTheme: pinThemes.submittedPinTheme,
                        errorPinTheme: pinThemes.errorPinTheme,
                        senderPhoneNumber: registerController.phoneNumber.value,
                        pinAnimationType: PinAnimationType.fade,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                        smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
                        listenForMultipleSmsOnAndroid: false,
                        controller: controller.pinPutController,
                        length: 5,
                        onCompleted: (value) {
                          controller.checkAuthenticationCode(value);
                        },
                      ),
                    ),
                  ),
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
      body: _buildPinPutForm(),
    );
  }
}
