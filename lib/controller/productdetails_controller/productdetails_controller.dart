import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';

class ProductDetailsController extends GetxController {
  RxInt currentProductImage = 0.obs;

  RxInt selectedColor = 0.obs;

  RxInt selected = 0.obs;

  RxList n = [0, 0].obs;

  RxBool isSelect = false.obs;

  ///add quantity
  void add(int index) {
    n[index]++;
  }

  ///minus quantity
  void minus(int index) {
    if (n[index] > 0) n[index]--;
  }

  final int _numPages = 4;
  final PageController pageController = PageController(initialPage: 0);

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == currentProductImage.value
          ? _indicator(true)
          : _indicator(false));
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
            isActive ? AppColors.lightBlueColor : AppColors.homeIndicatorColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  List colorList = [
    const Color(0xff212121),
    const Color(0xff7A5548),
    const Color(0xff89A7F5),
    const Color(0xff89DBF5),
    const Color(0xffD9D9D9),
    const Color(0xff757575),
  ];

  List sortBy = ["32", "34", "36", "38", "40"];
}
