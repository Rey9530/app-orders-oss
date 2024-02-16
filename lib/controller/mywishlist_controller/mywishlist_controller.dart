import 'package:get/get.dart';

import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';

class MyWishListController extends GetxController {
  RxList isSelect= [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  List mensJeansImage = [
    AppImage.casual,
    AppImage.fashionableMen,
    AppImage.elegantGlamrous,
    AppImage.designeruniqueJ,
    AppImage.ravishingmodern,
    AppImage.menspartywear,
    AppImage.stylishtrendyJ,
    AppImage.roughestrendy,
    AppImage.fancymodernJ,
    AppImage.comfortdenim,
    AppImage.rigbonemodern,
    AppImage.unitecolorsmen,
    AppImage.ussoloassign,
    AppImage.pepefashionable,
  ];

  List mensJeansTitle = [
    EnString.casualTrendy,
    EnString.fashionAbleMen,
    EnString.elegant,
    EnString.designer,
    EnString.raviShingModern,
    EnString.menPartyWear,
    EnString.stylishTrendy,
    EnString.roughesTrendy,
    EnString.fancyModern,
    EnString.comfortDenim,
    EnString.rigBoneModern,
    EnString.unitedColorMen,
    EnString.usSoloAssign,
    EnString.pepeFashionable,
  ];

  List mensJeansPrice = [
    "\$140.00",
    "\$85.00",
    "\$75.00",
    "\$100.00",
    "\$190.00",
    "\$205.00",
    "\$390.00",
    "\$70.00",
    "\$140.00",
    "\$95.00",
    "\$105.00",
    "\$90.00",
    "\$120.00",
    "\$100.00",
  ];

  List mensJeansRating = [
    "5.0",
    "4.8",
    "4.7",
    "4.9",
    "4.0",
    "4.3",
    "4.4",
    "4.2",
    "4.1",
    "4.0",
    "4.8",
    "4.4",
    "4.0",
    "4.5",
  ];
}
