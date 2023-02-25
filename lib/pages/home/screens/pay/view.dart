import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';
import 'index.dart';
import 'payments/gos_uslugi/index.dart';
import 'payments/pay_to_props/index.dart';

class PayPage extends GetView<PayController> {
  const PayPage({Key? key}) : super(key: key);

  Widget _buildPayments() {
    final controller = Get.put(PayController());

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(0),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[0].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[0].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(1),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[1].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[1].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(2),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[2].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[2].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(3),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[3].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[3].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(4),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[4].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[4].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(5),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[5].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[5].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.controller.value.jumpToPage(6),
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              controller.state.payments[6].iconLink,
                              width: 15.w,
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          controller.state.payments[6].title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final controller = Get.put(PayController());

        return Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildPayments(),
            ),
            const Divider(),
            Expanded(
              flex: 4,
              child: PageView(
                controller: controller.controller.value,
                children: const [
                  PayToPropsPage(),
                  PayToGosUslugiPage(),
                  Center(
                    child: Text('Comunal'),
                  ),
                  Center(
                    child: Text('Credit'),
                  ),
                  Center(
                    child: Text('Tax'),
                  ),
                  Center(
                    child: Text('Insurance'),
                  ),
                  Center(
                    child: Text('Education'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
