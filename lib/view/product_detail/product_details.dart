import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/approutes/approutes.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../controller/productdetails_controller/productdetails_controller.dart';
import '../../../utils/textstyle/textstyle.dart';
import '../my_cart_screen/mycartscreen.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);

  final ProductDetailsController _productdetailsController =
      Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        },
        backgroundColor: AppColors.searchFieldColor,
        title: EnString.productDetails,
        action: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 8.0, right: 25),
            child: GestureDetector(
              onTap: () {
                _productdetailsController.isSelect.value =
                    !_productdetailsController.isSelect.value;
              },
              child: CircleAvatar(
                radius: height / 55,
                backgroundColor: AppColors.whiteColor,
                child: Center(
                  child: Obx(
                    () => Image.asset(
                      !_productdetailsController.isSelect.value
                          ? IconImage.unfev
                          : IconImage.fev,
                      height: height / 70,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: const Text(''),
        icon: Column(
          children: [
            Container(
              height: 1,
              width: kIsWeb ? width / 5 : width,
              color: AppColors.indicatorGreyColor,
            ),
            Container(
              alignment: Alignment.center,
              color: AppColors.whiteColor,
              width: kIsWeb ? width / 3.6 : width / 1,
              height: height / 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: kIsWeb ? 0 : width / 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 200),
                        child: Text(
                          EnString.totalPrice,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontSize: height / 60,
                                  fontFamily: poppinsRegular,
                                  color: AppColors.indicatorGreyColor),
                        ),
                      ),
                      Text(
                        "\$205.00",
                        style: TextStyleConfig.styleBlackBoldPrice,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(CustumerView(
                        isBackButtonShow: true,
                      ));
                    },
                    child: Container(
                      height: height / 15,
                      width: kIsWeb ? width / 7 : width / 2,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          EnString.addToCart,
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
                  SizedBox(width: width / 50),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              Container(
                color: Colors.transparent,
                height: height / 3.4,
                child: Stack(
                  children: [
                    PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _productdetailsController.pageController,
                      onPageChanged: (int page) {
                        _productdetailsController.currentProductImage.value =
                            page;
                      },
                      children: <Widget>[
                        Image.asset(AppImage.menspartywear),
                        Image.asset(AppImage.menspartywear),
                        Image.asset(AppImage.menspartywear),
                        Image.asset(AppImage.menspartywear),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              _productdetailsController.buildPageIndicator(),
                        ),
                        SizedBox(height: height / 40),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 40),
              Container(
                color: Colors.transparent,
                width: kIsWeb ? width / 3.6 : width / 1.1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 100),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          EnString.stylishRetro,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 40,
                                  fontFamily: poppinsMedium),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Container(
                          height: kIsWeb ? height / 25 : height / 28,
                          width: kIsWeb ? width / 50 : width / 14,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: _productdetailsController.n[1] != 0
                                  ? AppColors.lightBlueColor
                                  : AppColors.lightBlueColor.withOpacity(0.5),
                              border: Border.all(
                                  color: _productdetailsController.n[1] != 0
                                      ? AppColors.lightBlueColor
                                      : AppColors.lightBlueColor
                                          .withOpacity(0.5))),
                          child: Center(
                            child: Image.asset(IconImage.remove,
                                width: kIsWeb ? width / 180 : width / 30),
                          ),
                        ),
                        onTap: () => _productdetailsController.minus(1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '${_productdetailsController.n[1]}',
                          style: TextStyle(
                              fontSize: height / 40,
                              color: AppColors.lightBlueColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: kIsWeb ? height / 25 : height / 28,
                          width: kIsWeb ? width / 50 : width / 14,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: AppColors.lightBlueColor,
                              border:
                                  Border.all(color: AppColors.lightBlueColor)),
                          child: Center(
                            child: Image.asset(IconImage.add,
                                width: kIsWeb ? width / 180 : width / 30),
                          ),
                        ),
                        onTap: () => _productdetailsController.add(1),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 100),
              Container(
                color: Colors.transparent,
                width: kIsWeb ? width / 3.6 : width / 1.1,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.ratingreviews),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.starColor,
                        size: height / 30,
                      ),
                      SizedBox(width: width / 80),
                      Text(
                        "4.8",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: height / 50,
                                fontFamily: poppinsMedium),
                      ),
                      SizedBox(width: width / 80),
                      Text(
                        "(305 Reviews)",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: height / 50,
                                fontFamily: poppinsMedium),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 70),
              Padding(
                padding:
                    EdgeInsets.only(right: kIsWeb ? width / 4 : width / 1.3),
                child: Text(
                  EnString.color,
                  style: TextStyleConfig.titleText,
                ),
              ),
              SizedBox(height: height / 70),
              Container(
                width: kIsWeb ? width / 3.6 : width / 1.08,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: height / 13,
                      width: kIsWeb ? width / 4.1 : width / 1.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _productdetailsController.colorList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                _productdetailsController.selectedColor.value =
                                    index;
                              },
                              child: Obx(() {
                                return Container(
                                  height: height / 150,
                                  width: kIsWeb ? width / 45 : width / 11,
                                  decoration: BoxDecoration(
                                    color: _productdetailsController
                                        .colorList[index],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.done,
                                      color: _productdetailsController
                                                  .selectedColor.value ==
                                              index
                                          ? AppColors.whiteColor
                                          : Colors.transparent,
                                      size: height / 40,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height / 120),
              Padding(
                padding:
                    EdgeInsets.only(right: kIsWeb ? width / 3.9 : width / 1.25),
                child: Text(
                  EnString.size,
                  style: TextStyleConfig.titleText,
                ),
              ),
              Container(
                width: kIsWeb ? width / 3.6 : width / 1.08,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: height / 13,
                      width: kIsWeb ? width / 4.1 : width / 1.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _productdetailsController.sortBy.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                _productdetailsController.selected.value =
                                    index;
                              },
                              child: Obx(() {
                                return Container(
                                  height: height / 150,
                                  width: kIsWeb ? width / 45 : width / 11,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _productdetailsController
                                                    .selected.value ==
                                                index
                                            ? Colors.transparent
                                            : AppColors.blackColor,
                                        width: 2),
                                    color: _productdetailsController
                                                .selected.value ==
                                            index
                                        ? AppColors.lightBlueColor
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      _productdetailsController.sortBy[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color: _productdetailsController
                                                          .selected.value ==
                                                      index
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                              fontSize: height / 60,
                                              fontFamily: poppinsMedium),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height / 120),
              Padding(
                padding:
                    EdgeInsets.only(right: kIsWeb ? width / 4.6 : width / 1.56),
                child: Text(
                  EnString.description,
                  style: TextStyleConfig.titleText,
                ),
              ),
              SizedBox(height: height / 100),
              Padding(
                padding: EdgeInsets.only(left: width / 28, bottom: height / 6),
                child: Container(
                  width: kIsWeb ? width / 3.6 : width / 1.1,
                  color: Colors.transparent,
                  child: Text(
                    EnString.regularFitShirt,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.indicatorGreyColor,
                          fontSize: height / 52,
                          fontFamily: poppinsRegular,
                        ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
