import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';

class HomeScreenController extends GetxController {
  final int _numPages = 4;
  final PageController pageController = PageController(initialPage: 0);

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == currentbanner.value ? _indicator(true) : _indicator(false));
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

//========== all homecategories List ==========

  List allcategoriesimagelist = [
    AppImage.fashion,
    AppImage.electronics,
    AppImage.grocery,
    AppImage.pharmacy,
  ];
  List allcategoriestextlist = [
    EnString.fashion,
    EnString.electronics,
    EnString.grocery,
    EnString.pharmacy,
  ];

  //========== Popular Products List ==========

  List popularproductimage = [
    AppImage.blackdress,
    AppImage.whitedress,
    AppImage.blackdress,
    AppImage.whitedress,
    AppImage.whitedress,
  ];

  List popularproducttitle = [
    EnString.blackLongDress,
    EnString.whiteTShirt,
    EnString.blackLongDress,
    EnString.whiteTShirt,
    EnString.blackLongDress,
  ];

  List popularproductprice = [
    "\$140.00",
    "\$85.00",
    "\$140.00",
    "\$85.00",
    "\$140.00",
  ];

  List popularproductless = [
    "\$160.00",
    "\$100.00",
    "\$160.00",
    "\$100.00",
    "\$160.00",
  ];

  //========== Deals of the Day List ==========

  List dealsofthedayimage = [
    AppImage.phone,
    AppImage.headphones,
    AppImage.phone,
    AppImage.headphones,
    AppImage.phone,
  ];

  List dealsofthedaytitle = [
    EnString.okiA,
    EnString.coatrockerz,
    EnString.okiA,
    EnString.coatrockerz,
    EnString.okiA,
  ];

  List dealsofthedayprice = [
    "\$2,900.00",
    "\$351.00",
    "\$2,900.00",
    "\$351.00",
    "\$2,900.00",
  ];

  //========== Hot Selling Product List ==========

  List hotsellingproductimage = [
    AppImage.fompree,
    AppImage.headphones,
    AppImage.fompree,
    AppImage.headphones,
    AppImage.fompree,
  ];

  List hotsellingproducttitle = [
    EnString.naturefoundation,
    EnString.coatrockerz,
    EnString.naturefoundation,
    EnString.coatrockerz,
    EnString.naturefoundation,
  ];

  List hotsellingproductprice = [
    "\$205.00",
    "\$351.00",
    "\$205.00",
    "\$351.00",
    "\$205.00",
  ];

  RxInt currentbanner = 0.obs;

  RxBool like = true.obs;
  RxBool like1 = true.obs;

  RxBool like2 = true.obs;
  RxBool like3 = true.obs;

  RxBool like4 = true.obs;
  RxBool like5 = true.obs;
}
