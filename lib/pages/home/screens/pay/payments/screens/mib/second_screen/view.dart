import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/res/global_controlls.dart';
import '../../../../../../../../common/values/colors.dart';
import 'index.dart';

class MibSecondPage extends GetView<MibSecondController> {
  const MibSecondPage({Key? key}) : super(key: key);
  Widget _buildScreen(BuildContext context) {
    return Center(
      child: Container(
        width: 150.w,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              gosController.state.uslugi[12].iconLink,
              width: 50.w,
              height: 100.h,
            ),
            Text(
              'Собиров Илёсхон Илхомович',
              style: TextStyle(fontSize: 7.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Номер квитанции',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.grey[500]),
                            ),
                            Text(
                              '15151151551',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Адрес',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.grey[500]),
                            ),
                            Text(
                              '15151151551',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Основная задолженность',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.grey[500]),
                            ),
                            Text(
                              '15151151551',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Комиссия',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.grey[500]),
                            ),
                            Text(
                              '15151151551',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Назначение',
                              style: TextStyle(
                                  fontSize: 3.sp, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 300.h,
                  color: Colors.black12,
                ),
                Container(
                  width: 70.w,
                  height: 250.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Сумма платежа',
                        style:
                            TextStyle(fontSize: 3.sp, color: Colors.grey[600]),
                      ),
                      Text(
                        '1 225 222,22 сўм',
                        style: TextStyle(
                            fontSize: 6.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        cursorColor: AppColors.primaryText,
                        controller: mibFirstController.numberController.value,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                // borderSide:
                                //     BorderSide(color: AppColors.primaryText),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusColor: AppColors.primaryText,
                            hoverColor: Colors.grey[300],
                            isDense: true,
                            fillColor: Colors.grey[300],
                            filled: true,
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(10),
                            //   ),
                            // ),
                            labelText: 'Сумма платежа',
                            labelStyle: TextStyle(color: Colors.grey[600])),
                        onEditingComplete: () {
                          mibFirstController.isProgress.value
                              ? null
                              : sendMsg.getDatas(mibFirstController
                                  .numberController.value.text);
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryElement,
                            fixedSize: Size(70.w, 35.h),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
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
                                    'Оплатить',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 3.sp),
                                  )
                                ],
                              )
                            : Text(
                                'Оплатить',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 3.sp),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9).withAlpha(500),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                gosController.mibCheckingSuccess.value = false;
                gosController.mibPaid.value = false;
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: _buildScreen(context));
  }
}
