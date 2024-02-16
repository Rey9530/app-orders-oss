import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';

class FashionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxInt selectedIndex = 0.obs;

  // =============== Top Rated Men ===============

  List topRatedMenClothImage = [
    AppImage.jeans,
    AppImage.tshirt,
    AppImage.shirt,
    AppImage.trousers,
  ];

  List topRatedMenClothTitle = [
    EnString.jeans,
    EnString.tShirts,
    EnString.shirts,
    EnString.trousers,
  ];

  // =============== Top Rated Women ===============

  List topRatedWomenClothImage = [
    AppImage.blackdress,
    AppImage.frocks,
    AppImage.whitedress,
    AppImage.jackets,
  ];

  List topRatedWomenClothTitle = [
    EnString.dresses,
    EnString.frocks,
    EnString.tShirts,
    EnString.jackets,
  ];

  // =============== Top Rated children ===============

  List topRatedChildrenClothImage = [
    AppImage.childtshirt,
    AppImage.chilfrock,
    AppImage.childdresses,
    AppImage.childshorts,
  ];

  List topRatedChildrenClothTitle = [
    EnString.tShirts,
    EnString.frocks,
    EnString.dresses,
    EnString.shorts,
  ];

  @override
  void onInit() {
    super.onInit();
    tabController =
        TabController(length: 4, animationDuration: Duration.zero, vsync: this);
    tabController!.addListener(() {
      selectedIndex.value = tabController!.index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }
}
