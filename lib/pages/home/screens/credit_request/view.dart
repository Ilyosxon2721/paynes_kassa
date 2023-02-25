import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';
import 'index.dart';

class CreditRequestPage extends GetView<CreditRequestController> {
  const CreditRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Text('CreditRequest Page'),
      ),
    );
  }
}
