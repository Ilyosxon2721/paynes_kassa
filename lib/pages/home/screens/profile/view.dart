import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';
import 'index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
