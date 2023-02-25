import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';
import 'index.dart';

class IncashPage extends GetView<IncashController> {
  const IncashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Text('Incash Page'),
      ),
    );
  }
}
