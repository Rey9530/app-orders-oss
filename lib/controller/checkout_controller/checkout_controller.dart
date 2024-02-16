import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/images/images.dart';

class CheckOutController extends GetxController {
  RxList n = [0, 0, 0, 0].obs;

  ///add quantity
  void add(int index) {
    n[index]++;
  }

  ///minus quantity
  void minus(int index) {
    if (n[index] > 0) n[index]--;
  }

  List cartImages = [
    AppImage.designjeans,
    AppImage.nokia,
    AppImage.coatrockerz,
    AppImage.dropper
  ];

  List cartColors = [
    AppColors.blueColor,
    AppColors.pinkColor,
    AppColors.blackColor,
    AppColors.blueColor
  ];

  List description = [
    "Size: M",
    "2 GB Ram,32 GB Storage",
    "Connector: Wireless",
  ];
}
