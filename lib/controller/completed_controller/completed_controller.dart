import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';

class CompletedController extends GetxController {
  List titleOngoing = [
    EnString.designerJeans,
    EnString.okiA,
    EnString.coatrockerz,
    EnString.dropper500,
  ];

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
