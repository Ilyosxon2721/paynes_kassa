import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/res/global_controlls.dart';
import '../../../../../../../../common/values/colors.dart';
import 'index.dart';

class MibFirstPage extends GetView<MibFirstController> {
  const MibFirstPage({Key? key}) : super(key: key);

  Widget _buildScreen() {
    return Obx(() {
      return Center(
        child: Container(
          width: 70.w,
          child: Column(
            children: [
              Image.asset(
                gosController.state.uslugi[12].iconLink,
                width: 50.w,
                height: 100.h,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                maxLength: 14,
                cursorColor: AppColors.primaryText,
                controller: mibFirstController.numberController.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryText),
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusColor: AppColors.primaryText,
                  isDense: true,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: 'Номер квитанции',
                ),
                onEditingComplete: () {
                  mibFirstController.isProgress.value
                      ? null
                      : sendMsg.getDatas(
                          mibFirstController.numberController.value.text);
                },
              ),
              mibFirstController.isError.value
                  ? Text(
                      mibFirstController.result.value,
                      style: TextStyle(color: Colors.red, fontSize: 3.sp),
                    )
                  : Container(),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryElement,
                    fixedSize: Size(70.w, 35.h),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
                onPressed: () {
                  // mibFirstController.isProgress.value
                  //     ? null
                  //     : sendMsg.getDatas(
                  //         mibFirstController.numberController.value.text);
                  gosController.mibCheckingSuccess.value = true;
                },
                child: mibFirstController.isProgress.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Продолжить',
                            style:
                                TextStyle(color: Colors.white, fontSize: 3.sp),
                          )
                        ],
                      )
                    : Text(
                        'Продолжить',
                        style: TextStyle(color: Colors.white, fontSize: 3.sp),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9).withAlpha(500),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                mibFirstController.clear();
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: _buildScreen());
  }
}
