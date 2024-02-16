import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../config/colors/colors.dart';
import '../config/enstring/enstring.dart';
import '../config/fontfamily.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';
import '../controller/language_controller/language_controller.dart';

class RatingReviewsWidget extends StatelessWidget {
  RatingReviewsWidget({Key? key}) : super(key: key);
  final LanguageController languageController = Get.put(LanguageController());
  final List _ratingImageList = [
    AppImage.wadewarren,
    AppImage.ralphedwards,
    AppImage.devonlane,
    AppImage.darrellsteward,
    AppImage.ronaldrichards,
  ];

  final List _commentList = [
    EnString.goodProductWorth,
    EnString.goodProductWorth,
    EnString.goodProductWorth,
    EnString.goodProductWorth,
    EnString.goodProductWorth,
  ];
  final List ronaldRichards = [
    EnString.wadeWarren,
    EnString.ralphEdwards,
    EnString.devonLane,
    EnString.darrellSteward,
    EnString.ronaldRichards,
  ];

  final List _timeList = [
    "Today",
    "Yesterday",
    "10/07/2022",
    "05/07/2022",
    "23/06/2022"
  ];

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Padding(
      padding: EdgeInsets.only(top: height / 33),
      child: ListView.builder(
        itemCount: _ratingImageList.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Image.asset(_ratingImageList[index], height: height / 13),
                    SizedBox(width: width / 30),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width / 1.8,
                                  child: Text(
                                    ronaldRichards[index],
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontSize: height / 45,
                                          color: AppColors.blackColor,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 6,
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Obx(
                                        () => Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  languageController.arb.value
                                                      ? 0
                                                      : width / 30,
                                              left: languageController.arb.value
                                                  ? width / 30
                                                  : 0),
                                          child: Text(
                                            _timeList[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                    fontSize: height / 60,
                                                    color: AppColors
                                                        .indicatorGreyColor,
                                                    fontFamily: poppinsMedium),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: height / 165),
                            RatingBar(
                              glowColor: AppColors.starColor,
                              initialRating: 3,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 25,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star_rounded,
                                  color: AppColors.starColor,
                                ),
                                half: Icon(
                                  Icons.star_half,
                                  color: AppColors.starColor,
                                ),
                                empty: Icon(
                                  Icons.star_border_rounded,
                                  color: AppColors.starColor,
                                ),
                              ),
                              wrapAlignment: WrapAlignment.start,
                              itemPadding: EdgeInsets.zero,
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(width: width / 20),
                  ],
                ),
                SizedBox(
                  height: height / 66,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      _commentList[index],
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontSize: height / 62,
                              color: AppColors.blackColor,
                              fontFamily: poppinsRegular),
                    ),
                  ],
                ),
                SizedBox(height: height / 70),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    thickness: 1,
                    color: const Color(0xff565DEB).withOpacity(0.2),
                  ),
                ),
                SizedBox(height: height / 80),
              ],
            ),
          );
        },
      ),
    );
  }
}
