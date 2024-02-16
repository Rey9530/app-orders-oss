import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/approutes/approutes.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../controller/ongoing_controller/ongoing_controller.dart';

class Ongoing extends StatelessWidget {
  Ongoing({Key? key}) : super(key: key);

  final OngoingController _ongoingController = Get.put(OngoingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      body: carts(),
    );
  }

  Widget carts() {
    return Center(
      child: Container(
        width: kIsWeb ? width / 3 : width,
        color: Colors.transparent,
        child: ListView.builder(
          padding: EdgeInsets.only(top: height / 45),
          itemCount: _ongoingController.cartImages.length,
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
                                      _ongoingController.cartImages[index]),
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
                                        _ongoingController.titleOngoing[index],
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
                                                color: _ongoingController
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
                                              _ongoingController
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
                                            if(index == 0) ...[
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
                                            Text(EnString.qty,
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
                                          onTap: () =>
                                              Get.toNamed(AppRoute.trackorder),
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
                                                EnString.trackOrder,
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
}
