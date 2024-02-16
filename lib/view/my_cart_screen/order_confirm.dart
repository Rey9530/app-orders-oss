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
import '../../../controller/bottombar_controller/bottombar_controller.dart';

class OrderConfirm extends StatelessWidget {
  const OrderConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: "",
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 12,
            ),
            Center(
              child: Image.asset(
                AppImage.orderconfirm,
                height: height / 3,
              ),
            ),
            SizedBox(
              height: height / 27,
            ),
            Text(
              EnString.orderPlaced,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.lightBlueColor,
                    fontSize: height / 28,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: height / 70),
            Text(
              EnString.orderConfirm,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 60,
                  fontWeight: FontWeight.w500,
                  fontFamily: poppinsMedium),
            ),
            Text(
              EnString.orderNumber,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.indicatorGreyColor,
                    fontSize: height / 60,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium,
                  ),
            ),
            SizedBox(height: height / 12),
            Buttons(
              btnText: EnString.continueShopping,
              buttonColor: AppColors.lightBlueColor,
              onTap: () {
                Get.toNamed(AppRoute.bottomBar);
                Get.find<BottomBarController>().changePage(bottomNavIndex: 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
