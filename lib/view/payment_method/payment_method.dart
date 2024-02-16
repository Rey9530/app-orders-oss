import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/approutes/approutes.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';

import '../../controller/payment_controller/payment_controller.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({Key? key}) : super(key: key);

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: EnString.selectMethod,
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.appBgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.transparent,
            width: kIsWeb ? 360 : width / 1.1,
            child: Column(
              children: [
                SizedBox(
                  height: height / 50,
                ),
                Container(
                  height: SizeConfig.kPadding60,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indicatorGreyColor.withOpacity(0.3),
                        blurRadius: 4.0,
                      ),
                    ],
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.kPadding20),
                    child: Row(
                      children: [
                        Image.asset(
                          IconImage.cashdelivery,
                          color: AppColors.lightBlueColor,
                          height: height / 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 30, right: width / 30),
                          child: Text(
                            EnString.cashOnDelivery,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 170),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height / 66, horizontal: width / 200),
                  child: Row(
                    children: [
                      Text(
                        EnString.creditAndDebit,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: AppColors.blackColor,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w500,
                                fontFamily: poppinsMedium),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.addcard);
                        },
                        child: Image.asset(
                          IconImage.addicon,
                          height: height / 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 220),
                Container(
                  color: Colors.transparent,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: height / 100),
                    itemCount: paymentController.cardImage.length,
                    itemBuilder: (context, index) {
                      return _cards(
                        context,
                        paymentController.cardImage[index],
                        index,
                      );
                    },
                  ),
                ),
                Text(
                  EnString.seeMore,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.lightBlueColor,
                      fontSize: height / 50,
                      fontWeight: FontWeight.w500,
                      fontFamily: poppinsMedium),
                ),
                SizedBox(height: kIsWeb ? 0 : height / 40),
                Padding(
                  padding: EdgeInsets.only(left: width / 100),
                  child: Row(
                    children: [
                      Text(
                        EnString.paymentOption,
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
                ),
                Obx(
                  () => Column(
                    children: [
                      SizedBox(
                        height: height / 40,
                      ),
                      _paymentOption(context, EnString.applePay,
                          EnString.applePay, AppImage.apple),
                      SizedBox(
                        height: height / 70,
                      ),
                      _paymentOption(context, EnString.googlePay,
                          EnString.googlePay, AppImage.google),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 30),
                  child: Buttons(
                    btnText: EnString.continues,
                    buttonColor: AppColors.lightBlueColor,
                    onTap: () {
                      Get.toNamed(AppRoute.enterpin);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cardimageheight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return height / 9;
    } else if (MediaQuery.of(context).size.width < 900) {
      return height / 7;
    } else {
      return height / 7;
    }
  }

  Widget _cards(context, cardsimg, index) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: height / 50, left: width / 200, right: width / 200),
      child: GestureDetector(
        onTap: () {
          paymentController.index.value = index;
        },
        child: Obx(
          () => Container(
            // height: SizeConfig.kPadding110,
            width: kIsWeb ? width / 1.1 : width / 1.1,
            decoration: BoxDecoration(
              border: paymentController.index.value == index
                  ? Border.all(color: AppColors.lightBlueColor, width: 2)
                  : null,
              color: AppColors.whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.indicatorGreyColor.withOpacity(0.3),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(width / 50),
                  child:
                      Image.asset(cardsimg, height: _cardimageheight(context)),
                ),
                SizedBox(
                  width: width / 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.kPadding8),
                  child: SizedBox(
                    width: width / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          EnString.wadeWarren,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.blackColor,
                                fontSize: height / 55,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 100),
                          child: Text(
                            "**** **** **** 2345",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 70,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium),
                          ),
                        ),
                        Text(
                          EnString.expiryDate,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 80,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                        Text(
                          "02/30",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 60,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                PopupMenuButton<int>(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.kPadding70,
                      right: SizeConfig.kPadding8,
                      left: SizeConfig.kPadding8,
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: AppColors.blackColor,
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      height: SizeConfig.kPadding8,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: AppColors.redColor,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: SizeConfig.kPadding12),
                            child: Text(
                              EnString.removeCard,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: AppColors.redColor,
                                      fontSize: height / 60,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: poppinsMedium),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentOption(
      context, String values, String title, String paymentimg) {
    return Padding(
      padding: EdgeInsets.only(left: width / 100),
      child: RadioListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
              color: paymentController.option.value == values
                  ? AppColors.lightBlueColor
                  : AppColors.indicatorGreyColor.withOpacity(0.1),
              width: 4),
        ),
        activeColor: AppColors.lightBlueColor,
        value: values,
        controlAffinity: ListTileControlAffinity.trailing,
        groupValue: paymentController.option.value,
        onChanged: (value) {
          paymentController.option.value = value.toString();
        },
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: width / 25, left: width / 25),
              child: Image.asset(
                paymentimg,
                height: height / 35,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 50,
                  fontWeight: FontWeight.w500,
                  fontFamily: poppinsMedium),
            ),
          ],
        ),
      ),
    );
  }
}
