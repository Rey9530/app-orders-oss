import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../utils/textstyle/textstyle.dart';
import '../../controller/language_controller/language_controller.dart';

class ApplyCoupon extends StatelessWidget {
  ApplyCoupon({Key? key}) : super(key: key);
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.applyCoupon,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 80),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 6.5 : width / 2.46),
              child: Text(
                EnString.cartValue,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.lightBlueColor,
                    fontSize: height / 48,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(height: height / 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 13),
              child: Container(
                height: height / 14,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: AppColors.indicatorGreyColor.withOpacity(0.5),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: height / 80, right: height / 60),
                  child: Row(
                    children: [
                      Container(
                        height: kIsWeb ? height / 30 : height / 21.2,
                        width: kIsWeb ? width / 5.2 : width / 1.7,
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(top: height / 47.5),
                          child: TextField(
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: height / 50),
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                              filled: true,
                              hintText: 'Enter Coupon Code',
                              hintStyle: TextStyle(
                                fontSize: height / 50,
                                color: AppColors.indicatorGreyColor,
                                fontFamily: poppinsRegular,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            EnString.apply,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.orangeColor,
                                  fontSize: height / 55,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 40),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 5.5 : width / 1.79),
              child: Text(
                EnString.bestCoupon,
                style: TextStyleConfig.black18NormalText,
              ),
            ),
            SizedBox(height: height / 45),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: _offercard(context),
            ),
            SizedBox(height: height / 45),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 5.5 : width / 1.7),
              child: Text(
                EnString.moreOffers,
                style: TextStyleConfig.black18NormalText,
              ),
            ),
            SizedBox(height: height / 60),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width / 20, vertical: 10),
                child: _offercard(context),
              ),
            ),
            SizedBox(height: height / 40),
          ],
        ),
      ),
    );
  }

  Widget _offercard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: kIsWeb ? 0 : width / 40, right: kIsWeb ? 0 : width / 60),
      child: Container(
        width: kIsWeb ? width / 3.8 : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.indicatorGreyColor.withOpacity(0.2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Obx(() => languageController.arb.value
                  ? Container(
                      width: kIsWeb ? width / 20 : width / 4,
                      decoration: BoxDecoration(
                          color: const Color(0xFF07AEAF),
                          borderRadius: BorderRadius.only(
                            topLeft: languageController.arb.value
                                ? const Radius.circular(0)
                                : const Radius.circular(8),
                            bottomLeft: languageController.arb.value
                                ? const Radius.circular(0)
                                : const Radius.circular(8),
                            topRight: languageController.arb.value
                                ? const Radius.circular(8)
                                : const Radius.circular(0),
                            bottomRight: languageController.arb.value
                                ? const Radius.circular(8)
                                : const Radius.circular(0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: width / 15),
                              Text(
                                "75",
                                style: TextStyle(
                                    fontSize: Get.height / 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                    fontSize: Get.height / 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: width / 15),
                              Text(
                                "OFF",
                                style: TextStyle(
                                    fontSize: Get.height / 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: kIsWeb ? width / 20 : width / 4,
                      decoration: BoxDecoration(
                          color: const Color(0xFF07AEAF),
                          borderRadius: BorderRadius.only(
                            topLeft: languageController.arb.value
                                ? const Radius.circular(0)
                                : const Radius.circular(8),
                            bottomLeft: languageController.arb.value
                                ? const Radius.circular(0)
                                : const Radius.circular(8),
                            topRight: languageController.arb.value
                                ? const Radius.circular(8)
                                : const Radius.circular(0),
                            bottomRight: languageController.arb.value
                                ? const Radius.circular(8)
                                : const Radius.circular(0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: width / 15),
                              Text(
                                "75",
                                style: TextStyle(
                                    fontSize: Get.height / 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                    fontSize: Get.height / 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: width / 15),
                              Text(
                                "OFF",
                                style: TextStyle(
                                    fontSize: Get.height / 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kIsWeb ? height / 20 : height / 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          EnString.trynew,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.lightBlueColor,
                                fontSize: kIsWeb ? height / 40 : height / 40,
                                fontWeight: FontWeight.w500,
                                fontFamily: poppinsMedium,
                              ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            EnString.apply,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.orangeColor,
                                  fontSize: kIsWeb ? height / 40 : height / 60,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        SizedBox(width: kIsWeb ? width / 60 : width / 25),
                      ],
                    ),
                    SizedBox(height: kIsWeb ? height / 80 : height / 150),
                    Row(
                      children: [
                        Text(
                          EnString.saveOrder,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.orangeColor,
                                fontSize: kIsWeb ? height / 50 : height / 65,
                                fontFamily: poppinsRegular,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    SizedBox(width: kIsWeb ? width / 20 : 0),
                    Padding(
                      padding: EdgeInsets.only(
                          right: kIsWeb ? width / 50 : width / 18),
                      child: DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 3.0,
                        dashColor: AppColors.lightBlueColor,
                        dashGapLength: 6.0,
                        dashGapColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            EnString.codeOrder,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: kIsWeb ? height / 50 : height / 80,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: poppinsRegular,
                                ),
                          ),
                        ),
                        SizedBox(width: Get.width / 100)
                      ],
                    ),
                    SizedBox(height: kIsWeb ? height / 20 : height / 45),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
