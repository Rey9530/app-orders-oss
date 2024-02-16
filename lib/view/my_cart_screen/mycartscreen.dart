import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/approutes/approutes.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../controller/bottombar_controller/bottombar_controller.dart';
import '../../../widget/cart_screen_bottomsheet.dart';
import '../../controller/mycart_controller/mycart_controller.dart';

// ignore: must_be_immutable
class MyCart extends StatelessWidget {
  bool isBackButtonShow;
  MyCart({super.key,required this.isBackButtonShow});

  final MyCartController _myCartController = Get.put(MyCartController());

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () => _willPop(context),
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.blackColor,
          elevation: 0,
          leading: GestureDetector(
              onTap: !isBackButtonShow ? null :  () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(height / 45),
                  child: Image.asset(IconImage.backarrow, color: isBackButtonShow ? AppColors.blackColor : AppColors.whiteColor,
                    scale: 4,
                    ),
                ),
              )),
          centerTitle: true,
          title: Text(EnString.myCart),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              carts(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Card(
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  color: AppColors.whiteColor,
                  child: Container(
                    height: height / 8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.lightGreyFilledColor,
                            offset: const Offset(2, 8),
                            blurRadius: 10),
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              EnString.totalPrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Text(
                              "\$3,205.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            // SizedBox(height: height / 10,),
                          ],
                        ),
                        SizedBox(width: kIsWeb ? width / 50 : width / 8.2),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.checkout);
                          },
                          child: Container(
                            height: height / 16,
                            width: kIsWeb ? width / 7 : width / 2,
                            decoration: BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: Center(
                              child: Text(
                                EnString.checkout,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: height / 50,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: poppinsSemiBold),
                              ),
                            ),
                          ),
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
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    _onTap();
    return false;
  }

  _onTap() {
    Get.find<BottomBarController>().changePage(bottomNavIndex: 0);
  }

  Widget carts() {
    return Center(
      child: Container(
        height: height / 1.4,
        width: kIsWeb ? width / 3 : width,
        color: Colors.transparent,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: height / 200),
          itemCount: _myCartController.cartImages.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.myorders);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: width / 46),
                    child: Container(
                      height: height / 6.3,
                      width: width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppColors.indicatorGreyColor.withOpacity(0.3),
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
                                        _myCartController.cartImages[index]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  // top: height / 50,
                                  left: kIsWeb ? width / 100 : width / 25),
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
                                          EnString.designerJeans,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                  color: AppColors.blackColor,
                                                  fontSize: height / 50,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'c'),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            cartdailog(context);
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Image.asset(
                                              IconImage.delete,
                                              height: height / 40,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              kIsWeb ? width / 80 : width / 45,
                                        )
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
                                                  color: _myCartController
                                                      .cartColors[index],
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      kIsWeb ? 0 : width / 80),
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
                                                color: AppColors
                                                    .indicatorGreyColor,
                                              ),
                                              SizedBox(
                                                width: kIsWeb
                                                    ? width / 130
                                                    : width / 50,
                                              ),
                                              Text(
                                                _myCartController
                                                    .description[index],
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .indicatorGreyColor,
                                                      fontSize: height / 70,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          poppinsSemiBold,
                                                    ),
                                              ),
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
                                                  color:
                                                      AppColors.lightBlueColor,
                                                  fontSize: kIsWeb
                                                      ? height / 50
                                                      : height / 40,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Obx(
                                          () => Container(
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
                                                        color: _myCartController
                                                                    .n[index] ==
                                                                0
                                                            ? AppColors.lightBlueColor
                                                                .withOpacity(
                                                                    0.5)
                                                            : AppColors
                                                                .lightBlueColor,
                                                        border: Border.all(
                                                            color: _myCartController.n[index] == 0
                                                                ? AppColors
                                                                    .lightBlueColor
                                                                    .withOpacity(
                                                                        0.5)
                                                                : AppColors
                                                                    .lightBlueColor)),
                                                    child: Center(
                                                      child: Image.asset(
                                                          IconImage.remove,
                                                          width: kIsWeb
                                                              ? width / 180
                                                              : width / 30),
                                                    ),
                                                  ),
                                                  onTap: () => _myCartController
                                                      .minus(index),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    '${_myCartController.n[index]}',
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
                                                  onTap: () => _myCartController
                                                      .add(index),
                                                ),
                                                SizedBox(
                                                    width: kIsWeb
                                                        ? width / 80
                                                        : width / 20)
                                              ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
