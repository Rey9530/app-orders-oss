import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/buttons.dart';
import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/approutes/approutes.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../controller/checkout_controller/checkout_controller.dart';

class Checkout extends StatelessWidget {
  Checkout({Key? key}) : super(key: key);

  final CheckOutController _checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(

        title: EnString.checkout,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 5 : width / 1.55),
              child: Text(
                EnString.orderList,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: height / 40,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(
              height: height / 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 44),
              child: checkoutcart(),
            ),
            SizedBox(
              height: height / 80,
            ),
            Padding(
              padding: EdgeInsets.only(right: kIsWeb ? width / 7 : width / 2.4),
              child: Text(
                EnString.shippingAddress,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: height / 40,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(height: height / 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 14),
              child: Container(
                height: kIsWeb ? height / 4.8 : height / 4.3,
                width: kIsWeb ? width / 4 : width / 1.1,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        SizedBox(width: kIsWeb ? width / 80 : 0),
                        Container(
                          height: height / 18,
                          width: kIsWeb ? width / 45 : width / 5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.lightBlueColor.withOpacity(0.5),
                                blurRadius: 6.0,
                              ),
                            ],
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(height / 90),
                              child: Image.asset(
                                IconImage.home,
                                color: AppColors.lightBlueColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: kIsWeb ? width / 100 : width / 40),
                        Text(
                          EnString.home,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 40,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsRegular),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoute.deliveryaddress);
                          },
                          child: Text(
                            EnString.change,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsRegular),
                          ),
                        ),
                        SizedBox(width: kIsWeb ? width / 80 : width / 25),
                      ],
                    ),
                    SizedBox(height: height / 45),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kIsWeb ? width / 70 : width / 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            EnString.estherHoward,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 47,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsRegular),
                          ),
                          SizedBox(height: height / 100),
                          Container(
                            color: Colors.transparent,
                            width: width / 1.2,
                            child: Text(
                              EnString.santaAna,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: AppColors.indicatorGreyColor,
                                      fontSize: height / 50,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: poppinsRegular),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height / 40),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 5.8 : width / 1.9),
              child: Text(
                EnString.promoCode,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: height / 40,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(height: height / 40),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.applycoupon);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 14),
                child: Container(
                  height: height / 10,
                  width: kIsWeb ? width / 4 : width / 1.1,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indicatorGreyColor.withOpacity(0.3),
                        blurRadius: 4.0,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kIsWeb ? width / 80 : width / 28),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImage.star,
                          height: height / 20,
                        ),
                        SizedBox(
                          width: width / 80,
                        ),
                        Text(
                          "Code",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 65,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                        SizedBox(
                          width: width / 100,
                        ),
                        Text(
                          "TRYNEW",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.lightBlueColor,
                                  fontSize: height / 60,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                        SizedBox(
                          width: width / 100,
                        ),
                        Text(
                          "applied!",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 65,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                        const Spacer(),
                        Text(
                          EnString.remove,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.red,
                                  fontSize: height / 75,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 40),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 5.5 : width / 1.7),
              child: Text(
                EnString.billDetail,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: height / 40,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(height: height / 40),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 14),
              child: Container(
                height: height / 4.1,
                width: kIsWeb ? width / 4 : width,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.indicatorGreyColor.withOpacity(0.3),
                      blurRadius: 4.0,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kIsWeb ? width / 70 : width / 20,
                      vertical: height / 80),
                  child: Column(
                    children: [
                      Row(
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
                                    fontFamily: poppinsMedium),
                          ),
                          const Spacer(),
                          Text(
                            "\$3,205.00",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 150,
                      ),
                      Row(
                        children: [
                          Text(
                            EnString.shippingCharges,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                          const Spacer(),
                          Text(
                            "\$35.00",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 150),
                      Row(
                        children: [
                          Text(
                            EnString.discount,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                          const Spacer(),
                          Text(
                            "-\$35.00",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 60),
                      Divider(
                        color: AppColors.indicatorGreyColor.withOpacity(0.5),
                        thickness: 1,
                      ),
                      SizedBox(height: height / 60),
                      Row(
                        children: [
                          Text(
                            EnString.totalAmount,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                          const Spacer(),
                          Text(
                            "\$3,235.00",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 13),
              child: Buttons(
                btnText: EnString.continues,
                buttonColor: AppColors.lightBlueColor,
                onTap: () {
                  Get.toNamed(AppRoute.paymentmethod);
                },
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget checkoutcart() {
    return Center(
      child: Container(
        height: height / 1.4,
        width: kIsWeb ? width / 3 : width,
        color: Colors.transparent,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: height / 200),
          itemCount: _checkOutController.cartImages.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.emptycart);
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
                                      _checkOutController.cartImages[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: kIsWeb ? width / 100 : width / 25),
                            child: SizedBox(
                              height: kIsWeb ? height / 8 : height / 7.5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                fontFamily: 'Poppins_Medium'),
                                      ),
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
                                                color: _checkOutController
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
                                            SizedBox(
                                              width: width / 3,
                                              child: Text(
                                                _checkOutController
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
                                                color: AppColors.lightBlueColor,
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
                                                        IconImage.remove,
                                                        width: kIsWeb
                                                            ? width / 180
                                                            : width / 30),
                                                  ),
                                                ),
                                                onTap: () => _checkOutController
                                                    .minus(index),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  '${_checkOutController.n[index]}',
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
                                                onTap: () => _checkOutController
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
                SizedBox(height: height / 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
