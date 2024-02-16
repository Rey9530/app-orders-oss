import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/buttons.dart';
import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.myCart,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Center(
              child: Image.asset(
                AppImage.emptycart,
                height: height / 3.5,
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Text(
              EnString.cartEmpty,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.lightBlueColor,
                    fontSize: height / 32,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 10),
              child: Text(
                EnString.anythingCart,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: height / 52,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(
              height: height / 10,
            ),
            Buttons(
              btnText: EnString.shopNow,
              buttonColor: AppColors.lightBlueColor,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
