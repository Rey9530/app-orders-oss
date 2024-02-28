import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/images/images.dart';

class MyCartController extends GetxController {
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
  ];

  List cartColors = [
    AppColors.blueColor,
    AppColors.pinkColor,
  ];

  List description = [
    "SUPER LACTEOS METAPAN",
    "LACTEOS DAYSI",
  ];

  List names = [
    "ROBERTO ULISES FIGUEROA CASTILLO",
    "LOS QUESITOS",
  ];
}
