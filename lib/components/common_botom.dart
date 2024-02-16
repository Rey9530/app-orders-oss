import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/enstring/enstring.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';

commonBottomBar({index, onClick}) {
  return BottomNavigationBar(
    selectedItemColor: AppColors.lightBlueColor,
    selectedLabelStyle:
        TextStyle(color: Colors.transparent, fontSize: height / 65),
    unselectedLabelStyle: TextStyle(fontSize: height / 65),
    type: BottomNavigationBarType.fixed,
    onTap: (val) {
      onClick(val);
    },
    currentIndex: index,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(
          index == 0 ? IconImage.homes : IconImage.home,
          height: height / 33,
        ),
        label: EnString.home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          index == 1 ? IconImage.dotecatogory : IconImage.categories,
          height: height / 33,
        ),
        label: EnString.categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          index == 2 ? IconImage.dotecart : IconImage.cart,
          height: height / 33,
        ),
        label: EnString.cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          index == 3 ? IconImage.profiledote : IconImage.profile,
          height: height / 33,
        ),
        label: EnString.profile,
      ),
    ],
  );
}
