import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/res/global_controlls.dart';

import 'index.dart';

class MibCheckScreenPage extends GetView<MibCheckController> {
  const MibCheckScreenPage({Key? key}) : super(key: key);
  final thisId = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //     )),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              gosController.state.uslugi[12].iconLink,
              width: 50.w,
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
