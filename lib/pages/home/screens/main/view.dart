import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paynes_kassa/common/values/colors.dart';

import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  Widget _buildGridBalance() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 70.w,
            height: 100.h,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '5000',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: AppColors.primaryText),
                        ),
                      )),
                  const VerticalDivider(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Наличный',
                          style: TextStyle(
                            fontSize: 4.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Баланс: 1 000 000 000.00 сум',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                          subtitle: Text(
                            'Инкасса: 300 000.00 сум',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            height: 100.h,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '5000',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: AppColors.primaryText),
                        ),
                      )),
                  const VerticalDivider(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'HUMO',
                          style: TextStyle(
                            fontSize: 4.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Баланс: 1 000 000 000.00 сум',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                          subtitle: Text(
                            'Инкасса: 300 000.00 сум',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            height: 100.h,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '5000',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: AppColors.primaryText),
                        ),
                      )),
                  const VerticalDivider(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'UZCARD',
                          style: TextStyle(
                            fontSize: 4.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Баланс: 1 000 000 000.00 сум',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                          subtitle: Text(
                            'Инкасса: 300 000.00 сум',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            height: 100.h,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '5000',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: AppColors.primaryText),
                        ),
                      )),
                  const VerticalDivider(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Доллар',
                          style: TextStyle(
                            fontSize: 4.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Баланс: 1 000 000 000.00 сум',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                          subtitle: Text(
                            'Инкасса: 300 000.00 сум',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritePayTypes() {
    return GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10));
  }

  Widget _buildCurrencyRanges() {
    return Container();
  }

  Widget _buildPayToMobile(BuildContext context) {
    final controller = Get.put(MainController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Оплата мобильной связи',
            style: TextStyle(
              fontSize: 5.sp,
            ),
          ),
        ),
        Obx(() {
          return Container(
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80.w,
                  child: TextField(
                    maxLength: 9,
                    cursorColor: AppColors.primaryText,
                    controller: controller.mobileNumberController.value,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryText),
                          gapPadding: 1,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusColor: AppColors.primaryText,
                      isDense: true,
                      prefixText: '+998 ',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Номер телефона',
                    ),
                  ),
                ),
                Obx(() {
                  return SizedBox(
                    width: 80.w,
                    child: TextField(
                      cursorColor: AppColors.primaryText,
                      controller: controller.cashInMobileNumberController.value,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryText),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusColor: AppColors.primaryText,
                        isDense: true,
                        helperText: 'от 500 до 1 500 000',
                        suffixText: 'сум',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryText),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Введите сумму',
                      ),
                    ),
                  );
                }),
                Container(
                    width: 50.w,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 18.h),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.only(
                                top: 18.h,
                                bottom: 18.h,
                              ),
                              backgroundColor: AppColors.primaryText),
                          onPressed: () {
                            controller.sendMessage();
                            // controller.getChat();
                          },
                          child: Text(
                            'Оплатить',
                            style:
                                TextStyle(color: Colors.white, fontSize: 3.sp),
                          )),
                    ))
              ],
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildGridBalance(),
            ),
            Expanded(
              flex: 1,
              child: _buildPayToMobile(context),
            ),
            Expanded(
              flex: 1,
              child: _buildFavoritePayTypes(),
            ),
            Expanded(
              flex: 1,
              child: _buildCurrencyRanges(),
            ),
          ],
        ),
      ),
    );
  }
}
