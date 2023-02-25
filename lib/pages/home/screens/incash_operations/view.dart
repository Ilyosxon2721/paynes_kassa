import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';
import 'index.dart';

class IncashOperationsPage extends GetView<IncashOperationsController> {
  const IncashOperationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Text('IncashOperations Page'),
      ),
    );
  }
}
