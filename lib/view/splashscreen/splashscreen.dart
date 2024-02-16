import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/splash_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

 final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      body: Center(
        child: Image.asset(AppImage.applogo, height: height / 3),
      ),
    );
  }
}
