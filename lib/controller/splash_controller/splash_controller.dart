import 'dart:async';

import 'package:get/get.dart';

import '../../config/approutes/approutes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3),
        () => Get.offAllNamed(AppRoute.loginscreen));
  }
}
