import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../components/buttons.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../controller/completed_controller/completed_controller.dart';
import '../../controller/language_controller/language_controller.dart';

// ignore: must_be_immutable
class Completed extends StatelessWidget {
  Completed({Key? key}) : super(key: key);

  final CompletedController _completedController =
      Get.put(CompletedController());
  TextEditingController review = TextEditingController();
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(backgroundColor: AppColors.appBgColor, body: carts());
  }

  Widget carts() {
    return Center(
      child: Container(
        width: kIsWeb ? width / 3 : width,
        color: Colors.transparent,
        child: ListView.builder(
          padding: EdgeInsets.only(top: height / 45),
          itemCount: _completedController.cartImages.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: height / 6.3,
                    width: width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.indicatorGreyColor.withOpacity(0.3),
                          blurRadius: 4.0,
                        ),
                      ],
                      color: AppColors.whiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: kIsWeb ? width / 150 : width / 50),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: kIsWeb ? height / 57 : height / 80),
                              Container(
                                height: kIsWeb ? height / 8 : height / 7.5,
                                width: kIsWeb ? width / 12 : width / 3.8,
                                decoration: BoxDecoration(
                                  color: AppColors.searchFieldColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(height / 80),
                                  child: Image.asset(
                                      _completedController.cartImages[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(height / 70),
                            child: SizedBox(
                              height: kIsWeb ? height / 8 : height / 7.5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        _completedController
                                            .titleOngoing[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                color: AppColors.blackColor,
                                                fontSize: height / 45,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'c'),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: height / 160),
                                  index == 3
                                      ? Text(
                                          "Style name: 120 ml",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: AppColors
                                                    .indicatorGreyColor,
                                                fontSize: height / 70,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        )
                                      : Row(
                                          children: [
                                            Container(
                                              height: kIsWeb
                                                  ? height / 60
                                                  : height / 45,
                                              width: kIsWeb
                                                  ? width / 50
                                                  : width / 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _completedController
                                                    .cartColors[index],
                                              ),
                                            ),
                                            SizedBox(
                                                width: kIsWeb ? 0 : width / 80),
                                            Text(
                                              "Color",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .indicatorGreyColor,
                                                      fontSize: height / 65,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          poppinsSemiBold),
                                            ),
                                            SizedBox(
                                              width: kIsWeb
                                                  ? width / 130
                                                  : width / 50,
                                            ),
                                            Container(
                                              height: height / 70,
                                              width: kIsWeb
                                                  ? width / 800
                                                  : width / 300,
                                              color:
                                                  AppColors.indicatorGreyColor,
                                            ),
                                            SizedBox(
                                              width: kIsWeb
                                                  ? width / 130
                                                  : width / 50,
                                            ),
                                            Text(
                                              _completedController
                                                  .description[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                    color: AppColors
                                                        .indicatorGreyColor,
                                                    fontSize: height / 80,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: poppinsSemiBold,
                                                  ),
                                            ),
                                            if (index == 0) ...[
                                              SizedBox(
                                                width: kIsWeb
                                                    ? width / 130
                                                    : width / 50,
                                              ),
                                              Container(
                                                height: height / 70,
                                                width: kIsWeb
                                                    ? width / 800
                                                    : width / 300,
                                                color: AppColors
                                                    .indicatorGreyColor,
                                              ),
                                              SizedBox(
                                                width: kIsWeb
                                                    ? width / 130
                                                    : width / 50,
                                              ),
                                              Text(
                                                EnString.qty,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .indicatorGreyColor,
                                                      fontSize: height / 80,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          poppinsSemiBold,
                                                    ),
                                              ),
                                            ],
                                          ],
                                        ),
                                  SizedBox(height: height / 160),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Text(
                                          "\$100.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: AppColors.lightBlueColor,
                                                fontSize: kIsWeb
                                                    ? height / 50
                                                    : height / 40,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: width / 40),
                                        child: GestureDetector(
                                          onTap: () => _leaveView(context),
                                          child: Container(
                                            height: height / 28,
                                            width: kIsWeb
                                                ? width / 16
                                                : width / 4.5,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightBlueColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                EnString.leaveView,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: kIsWeb
                                                            ? height / 60
                                                            : height / 75,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            poppinsMedium),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _leaveView(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.appBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AnimatedPadding(
              curve: Curves.linear,
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height / 150),
                    Center(
                      child: Container(
                        height: height / 220,
                        width: width / 5,
                        decoration: BoxDecoration(
                          color: AppColors.indicatorGreyColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 70),
                    Text(
                      EnString.leaveAView,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: height / 40,
                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: height / 60),
                    Divider(color: AppColors.dividerColor, thickness: 2),
                    SizedBox(
                      height: height / 60,
                    ),
                    _reviewCart(context),
                    SizedBox(
                      height: height / 60,
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: 2,
                      indent: width / 20,
                      endIndent: width / 20,
                    ),
                    Text(
                      EnString.yourOrder,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: height / 40,
                              fontFamily: poppinsMedium,
                              fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    RatingBar(
                      glowColor: AppColors.starColor,
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
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
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        //print(rating);
                      },
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          EnString.writeAreView,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Container(
                        height: height / 8,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                              color:
                                  AppColors.indicatorGreyColor.withOpacity(0.7),
                              width: 1),
                        ),
                        child: TextFormField(
                          controller: review,
                          maxLines: 5,
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: height / 50,
                              fontFamily: poppinsRegular),
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: EnString.likeOrdIsLike,
                            hintStyle: TextStyle(
                                color: AppColors.indicatorGreyColor,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w400,
                                fontFamily: poppinsRegular),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            isDense: false,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Buttons(
                      btnText: EnString.submit,
                      buttonColor: review.text.isEmpty
                          ? AppColors.lightBlueColor.withOpacity(0.5)
                          : AppColors.lightBlueColor,
                      onTap: () => Get.back(),
                    ),
                    SizedBox(height: height / 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _reviewCart(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        height: height / 6,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.indicatorGreyColor.withOpacity(0.3),
              blurRadius: 4.0,
            ),
          ],
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height / 30,
                ),
              Obx(() =>   Padding(
                padding: EdgeInsets.only(left: languageController.arb.value?0:width / 18,right: languageController.arb.value?width / 18:0),
                child: Container(
                  height: height / 9,
                  width: width / 5,
                  decoration: BoxDecoration(
                    color: AppColors.searchFieldColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(height / 80),
                    child: Image.asset(
                      AppImage.designjeans,
                    ),
                  ),
                ),
              ),)
              ],
            ),
            SizedBox(
              width: width / 40,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: height / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          EnString.designerJeans,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    Row(
                      children: [
                        Container(
                          height: height / 50,
                          width: width / 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.blueColor,
                          ),
                        ),
                        SizedBox(
                          width: width / 80,
                        ),
                        Text(
                          "Color",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.indicatorGreyColor,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          height: height / 55,
                          width: width / 300,
                          color: AppColors.indicatorGreyColor,
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          "Size : M",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.indicatorGreyColor,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          height: height / 55,
                          width: width / 300,
                          color: AppColors.indicatorGreyColor,
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          "Qty= 1",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.indicatorGreyColor,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 160,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
