import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common_botom.dart';
import '../../config/colors/colors.dart';
import '../../controller/bottombar_controller/bottombar_controller.dart';

class BottomBar extends StatelessWidget {
  final BottomBarController _bottomBarController = Get.put(BottomBarController());

  BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: AppColors.appBgColor,
          body: _bottomBarController.currentPage.value,
          bottomNavigationBar: commonBottomBar(
              index: _bottomBarController.currentIndex.value,
              onClick: _bottomBarController.onClick)),
    );
  }
}
