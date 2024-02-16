import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../components/buttons.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/approutes/approutes.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';

class EnterPin extends StatelessWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.enterYourPin,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.kPadding100),
              child: Center(
                child: Text(
                  EnString.confirmPayment,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: height / 50,
                        fontWeight: FontWeight.w400,
                        fontFamily: poppinsRegular,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: height / 20),
              child: Pinput(
                obscuringWidget: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blackColor),
                ),
                obscureText: true,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                onTap: () {},
                autofocus: true,
              ),
            ),
            Buttons(
                btnText: EnString.pay,
                buttonColor: AppColors.lightBlueColor,
                onTap: () {
                  Get.toNamed(AppRoute.orderconfirm);
                }),
          ],
        ),
      ),
    );
  }
}
