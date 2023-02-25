import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/scroll/scroll_behaviour.dart';
import 'package:paynes_kassa/common/values/colors.dart';

import 'common/global.dart';
import 'common/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final global = Get.put(Global());
  global.tg.init();
  global.tg.initIsolate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 700),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'Paynes Kassa',
          theme: ThemeData.light(useMaterial3: true).copyWith(
              primaryColor: AppColors.primaryElement,
              primaryColorLight: AppColors.primaryElement),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
