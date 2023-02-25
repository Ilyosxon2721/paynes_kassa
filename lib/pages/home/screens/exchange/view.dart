import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';
import 'index.dart';

class ExchangePage extends GetView<ExchangeController> {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Text('Exchange Page'),
      ),
    );
  }
}
