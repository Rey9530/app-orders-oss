import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors/colors.dart';
import '../config/enstring/enstring.dart';
import '../config/fontfamily.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';
import '../controller/bottombar_controller/bottombar_controller.dart';
import '../view/bottom_bar/bottom_bar.dart';

class WidgetCategories extends StatelessWidget {
  WidgetCategories({Key? key}) : super(key: key);
  final BottomBarController _bottomBarController =
      Get.put(BottomBarController());

  final List _categoriesImage = [
    AppImage.brandcloth,
    AppImage.categorieselectronics,
    AppImage.freshvegetables,
    AppImage.medicine,
    AppImage.beauty,
    AppImage.appliances,
    AppImage.jewellery,
    AppImage.kitchen,
  ];

  final List _categoriesTitle = [
    EnString.fashion,
    EnString.electronics,
    EnString.grocery,
    EnString.pharmacy,
    EnString.beauty,
    EnString.appliances,
    EnString.jewellery,
    EnString.kitchen,
  ];

  final List _categoriesSubTitle = [
    EnString.brandsClothingFootWear,
    EnString.mobileTvRefrigerator,
    EnString.vegetablesClothingFootWear,
    EnString.medicinesAyurvedicVitamins,
    EnString.skincareMakeupGrooming,
    EnString.goldDiamondSilver,
    EnString.goldDiamondSilver,
    EnString.gasStoveMicrowaveGrinder,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _categoriesImage.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _bottomBarController.changePageList(true);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomBar(),
                  ));
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kIsWeb ? width / 75 : width / 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.searchFieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: height / 7.3,
                          width: kIsWeb ? width / 8 : width / 3,
                          child: Image.asset(
                            _categoriesImage[index],
                          ),
                        ),
                        SizedBox(width: width / 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: kIsWeb ? height / 80 : height / 200),
                            Text(
                              _categoriesTitle[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize:
                                          kIsWeb ? height / 33 : height / 40,
                                      fontFamily: poppinsBold),
                            ),
                            Text(
                              _categoriesSubTitle[index],
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize:
                                          kIsWeb ? height / 70 : height / 80,
                                      fontFamily: poppinsMedium,
                                      color: AppColors.indicatorGreyColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 50)
              ],
            ),
          );
        },
      ),
    );
  }
}
