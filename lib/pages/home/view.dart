import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paynes_kassa/common/controller/telegram/send_message.dart';
import 'package:paynes_kassa/common/style/images.dart';
import 'package:paynes_kassa/pages/home/screens/credit/index.dart';
import 'package:paynes_kassa/pages/home/screens/credit_request/index.dart';
import 'package:paynes_kassa/pages/home/screens/exchange/index.dart';
import 'package:paynes_kassa/pages/home/screens/incash/index.dart';
import 'package:paynes_kassa/pages/home/screens/incash_operations/index.dart';
import 'package:paynes_kassa/pages/home/screens/monitoring/index.dart';
import 'package:paynes_kassa/pages/home/screens/profile/index.dart';

import '../../common/values/colors.dart';
import 'index.dart';
import 'screens/main/index.dart';
import 'screens/pay/index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 60.0.h,
      leadingWidth: 30.w,
      leading: Image.asset(
        ImagesBox.brandFull,
        width: 150.w,
        height: 70.h,
      ),
      centerTitle: false,
      elevation: 1.0,
      title: Column(
        children: [
          ListTile(
            title: Text(
              'Balance',
              style: GoogleFonts.aBeeZee(color: Colors.grey),
            ),
            subtitle: Text(
              '1 000 000.00 Som',
              style: GoogleFonts.aBeeZee(
                  fontSize: 4.sp, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
      actions: [
        Text(
          'Собиров Илёсхон Илхомович',
          style: GoogleFonts.alice(fontSize: 4.sp, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '12.02.2023',
          style:
              GoogleFonts.aBeeZee(fontSize: 4.sp, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 10.w,
            height: 25.h,
            child: Image.asset(
              ImagesBox.exitLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
      ],
    );
  }

  Widget _buildSideMenu() {
    final sendMsg = Get.put(SendMessageController());
    List<SideMenuItem> items = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'Главное',
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
          sendMsg.back();
          sendMsg.toMain();
        },
      ),
      SideMenuItem(
        priority: 1,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
          sendMsg.toPay();
          sendMsg.toProps();
        },
        title: 'Оплата',
      ),
      SideMenuItem(
        priority: 2,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Обмен валют',
      ),
      SideMenuItem(
        priority: 3,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Кредиты',
      ),
      SideMenuItem(
        priority: 4,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Запрос на кредит',
      ),
      SideMenuItem(
        priority: 5,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Мониторинг',
      ),
      SideMenuItem(
        priority: 6,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Выдача денег',
      ),
      SideMenuItem(
        priority: 7,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Инкассовые операции',
      ),
      SideMenuItem(
        priority: 8,
        onTap: (index, side) {
          controller.page.value.jumpToPage(index);
          controller.side.value.changePage(index);
        },
        title: 'Профиль',
        badgeContent: Image.asset(
          ImagesBox.profileLogo,
          fit: BoxFit.cover,
        ),
      ),
    ];
    return Obx(() {
      return SideMenu(
        // Page controller to manage a PageView
        controller: controller.side.value,
        // Will shows on top of all items, it can be a logo or a Title text
        // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
        // Notify when display mode changed
        onDisplayModeChanged: (mode) {
          print(mode);
        },
        // List of SideMenuItem to show them on SideMenu
        items: items,
        style: SideMenuStyle(
            backgroundColor: AppColors.primaryElement.withOpacity(0.7),
            selectedColor: Colors.white,
            hoverColor: AppColors.primaryText,
            selectedTitleTextStyle:
                const TextStyle(color: AppColors.primaryText),
            unselectedTitleTextStyle: const TextStyle(color: Colors.white),
            itemOuterPadding: const EdgeInsets.all(0),
            itemBorderRadius: BorderRadius.zero),
      );
    });
  }

  Widget _buildPages() {
    return Expanded(child: Obx(() {
      return PageView(
        controller: controller.page.value,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MainPage(),
          PayPage(),
          ExchangePage(),
          CreditPage(),
          CreditRequestPage(),
          MonitoringPage(),
          IncashPage(),
          IncashOperationsPage(),
          ProfilePage(),
        ],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: _buildAppBar(),
      body: Row(
        children: [
          _buildSideMenu(),
          _buildPages(),
        ],
      ),
    );
  }
}
