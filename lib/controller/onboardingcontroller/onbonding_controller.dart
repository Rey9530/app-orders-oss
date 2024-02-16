import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';

class OnBondingController extends GetxController {
  RxInt currentPage = 0.obs;

  final int numPages = 3;
  final PageController pageController = PageController(initialPage: 0);

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage.value ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.1),
      height: 8.0,
      width: isActive ? 26.0 : 7.0,
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.lightBlueColor : AppColors.indicatorGreyColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
