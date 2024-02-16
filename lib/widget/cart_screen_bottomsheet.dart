import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors/colors.dart';
import '../config/enstring/enstring.dart';
import '../config/fontfamily.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';
import '../controller/checkout_controller/checkout_controller.dart';

final CheckOutController _checkOutController = Get.put(CheckOutController());

cartdailog(context) {
  showModalBottomSheet(
    backgroundColor: AppColors.appBgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: height / 90,
                ),
                Container(
                  height: height / 180,
                  width: width / 5,
                  decoration: BoxDecoration(
                    color: AppColors.indicatorGreyColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Text(
                  EnString.removeItem,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: height / 40,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Divider(
                  color: AppColors.indicatorGreyColor.withOpacity(0.3),
                  thickness: 2,
                ),
                SizedBox(
                  height: height / 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 25),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: height / 40,
                              ),
                              Container(
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
                                  child: Image.asset(AppImage.designjeans),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width / 40,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: height / 8.5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 160,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: height / 40,
                                        width: width / 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.blackColor,
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
                                              color:
                                                  AppColors.indicatorGreyColor,
                                              fontSize: height / 50,
                                              fontWeight: FontWeight.w500,
                                            ),
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
                                              color:
                                                  AppColors.indicatorGreyColor,
                                              fontSize: height / 50,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 160,
                                  ),
                                  Obx(
                                    () => Row(
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
                                                    color: AppColors
                                                        .lightBlueColor,
                                                    fontSize: height / 40,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        poppinsSemiBold),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  height: kIsWeb
                                                      ? height / 25
                                                      : height / 28,
                                                  width: kIsWeb
                                                      ? width / 50
                                                      : width / 14,
                                                  decoration: BoxDecoration(
                                                      borderRadius: const BorderRadius.all(
                                                          Radius.circular(5)),
                                                      color: _checkOutController
                                                                  .n[1] ==
                                                              0
                                                          ? AppColors
                                                              .lightBlueColor
                                                              .withOpacity(0.5)
                                                          : AppColors
                                                              .lightBlueColor,
                                                      border: Border.all(
                                                          color: _checkOutController
                                                                      .n[1] ==
                                                                  0
                                                              ? AppColors
                                                                  .lightBlueColor
                                                                  .withOpacity(0.5)
                                                              : AppColors.lightBlueColor)),
                                                  child: Center(
                                                    child: Image.asset(
                                                        IconImage.remove,
                                                        width: kIsWeb
                                                            ? width / 180
                                                            : width / 30),
                                                  ),
                                                ),
                                                onTap: () => _checkOutController
                                                    .minus(1),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  '${_checkOutController.n[1]}',
                                                  style: TextStyle(
                                                      fontSize: height / 40,
                                                      color: AppColors
                                                          .lightBlueColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  height: kIsWeb
                                                      ? height / 25
                                                      : height / 28,
                                                  width: kIsWeb
                                                      ? width / 50
                                                      : width / 14,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5)),
                                                      color: AppColors
                                                          .lightBlueColor,
                                                      border: Border.all(
                                                          color: AppColors
                                                              .lightBlueColor)),
                                                  child: Center(
                                                    child: Image.asset(
                                                        IconImage.add,
                                                        width: kIsWeb
                                                            ? width / 180
                                                            : width / 30),
                                                  ),
                                                ),
                                                onTap: () =>
                                                    _checkOutController.add(1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: height / 15,
                          width: width / 2.4,
                          decoration: BoxDecoration(
                            color: AppColors.lightGreyColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(11),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              EnString.cancel,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w600,
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
                          height: height / 15,
                          width: width / 2.4,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(11),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              EnString.remove,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
