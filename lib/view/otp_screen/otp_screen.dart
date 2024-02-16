import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../controller/otp_controller/otp_controller.dart';

import '../../components/buttons.dart';
import '../../components/customappbar/custom_appbar.dart';
import '../../config/approutes/approutes.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/fontfamily.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  OtpController otpController = Get.put(OtpController());
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
              height: height / 50,
            ),
            Center(
              child: Image(
                image: const AssetImage(
                  AppImage.logosmall,
                ),
                height: height / 7,
                width: width / 7,
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            Text(
              EnString.enterOtp,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 35,
                  fontWeight: FontWeight.w600,
                  fontFamily: poppinsMedium),
            ),
            SizedBox(
              height: height / 60,
            ),
            Text(
              EnString.enterDigits,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.indicatorGreyColor,
                  fontSize: height / 55,
                  fontWeight: FontWeight.w400,
                  fontFamily: poppinsRegular),
            ),
            SizedBox(
              height: height / 200,
            ),
            Text(
              "(+44) 555-0120",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 55,
                  fontWeight: FontWeight.w500,
                  fontFamily: poppinsMedium),
            ),
            SizedBox(height: height / 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Pinput(
                controller: pinController,
                mainAxisAlignment: kIsWeb
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                onTap: () {},
                autofocus: true,
              ),
            ),
            SizedBox(height: height / 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    EnString.codeExpire,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.indicatorGreyColor,
                        fontSize: height / 55,
                        fontFamily: poppinsRegular),
                  ),
                  Obx(
                    ()=> Text(otpController.timerCompleted.value
                        ? "00 sec"
                        : otpController.getFormattedTime(),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.lightBlueColor,
                          fontSize: height / 55,
                          fontWeight: FontWeight.w600,
                          fontFamily: poppinsRegular),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 60),
            GestureDetector(
              onTap: (){
                if (otpController.timerCompleted.value) {
                  otpController.isSelect.value = true;
                  pinController.clear();
                  Timer(const Duration(seconds: 1),
                          () =>  otpController.isSelect.value = false);
                  otpController.restartTimer();
                }
              },
              child: Obx(
                ()=> Text(
                  EnString.resendOtp,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color:otpController.isSelect.value? AppColors.lightBlueColor: AppColors.indicatorGreyColor,
                        fontSize: height / 55,
                        fontWeight: FontWeight.w600,
                        fontFamily: poppinsMedium,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: height / 22,
            ),
            Buttons(
              btnText: EnString.verify,
              buttonColor: AppColors.lightBlueColor,
              onTap: () => Get.toNamed(AppRoute.bottomBar),
            )
          ],
        ),
      ),
    );
  }
}
