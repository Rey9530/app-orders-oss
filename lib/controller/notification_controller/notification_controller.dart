import 'package:get/get.dart';

import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';

class NotificationController extends GetxController {
  // =============== yesterday ===============

  List yesterdayImage = [
    AppImage.shop,
    AppImage.rewards,
    AppImage.specialdiscount,
  ];

  List yesterdayTitle = [
    EnString.shopNow,
    EnString.rewards,
    EnString.specialDiscounts,
  ];

  List yesterdaySubTitle = [
    EnString.promotionOnlyValid,
    EnString.promotionOnlyValid,
    EnString.promotionOnlyValid,
  ];

  List yesterdayTime = ["7:15PM", "8:44PM", "12:30AM"];

  // =============== date ===============

  List dateImage = [
    AppImage.shop,
    AppImage.specialdiscount,
  ];

  List dateTitle = [
    EnString.shopNow,
    EnString.specialDiscount,
  ];

  List dateSubTitle = [
    EnString.promotionOnlyValid,
    EnString.promotionOnlyValid,
    EnString.promotionOnlyValid,
  ];

  List datetime = [
    "12:30AM",
    "12:30AM",
  ];
}
