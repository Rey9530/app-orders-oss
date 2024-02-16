
import '../../config/approutes/approutes.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../config/fontfamily.dart';
import '../../controller/onboardingcontroller/onbonding_controller.dart';

class OnBonding extends StatelessWidget {
  OnBonding({Key? key}) : super(key: key);
 final OnBondingController _onBondingController = Get.put(OnBondingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: height / 15),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.loginscreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: kIsWeb ? width / 5.7 : width / 1.3),
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color:_onBondingController.currentPage.value == 2 ?  AppColors.whiteColor : AppColors.orangeColor,
                            fontSize: height / 50,
                            fontFamily: poppinsBold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: height / 1.5,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _onBondingController.pageController,
                    onPageChanged: (int page) {
                      _onBondingController.currentPage.value = page;
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: height / 10),
                            Center(
                              child: Image(
                                image: const AssetImage(
                                  AppImage.onbondingone,
                                ),
                                height: height / 3.1,
                                width: width / 1.2,
                              ),
                            ),
                            SizedBox(height: height / 24),
                            Text(
                              EnString.chooseProduct,
                              style: TextStyle(
                                  color: AppColors.lightBlueColor,
                                  fontSize: height / 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: height / 50),
                            Text(
                              EnString.findYourBest,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: height / 56.5,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: poppinsMedium),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: height / 10),
                            Center(
                              child: Image(
                                image: const AssetImage(
                                  AppImage.onbondingtwo,
                                ),
                                height: height / 3.1,
                                width: width / 1.2,
                              ),
                            ),
                            SizedBox(height: height / 24),
                            Text(
                              EnString.makePayment,
                              style: TextStyle(
                                  color: AppColors.lightBlueColor,
                                  fontSize: height / 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: height / 50),
                            Text(
                              EnString.thereAreManyPayment,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: height / 56.5,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: poppinsMedium),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: height / 10),
                            Center(
                              child: Image(
                                image: const AssetImage(
                                  AppImage.onbondingthree,
                                ),
                                height: height / 3.1,
                                width: width / 1.2,
                              ),
                            ),
                            SizedBox(height: height / 24),
                            Text(
                              EnString.getYourOrders,
                              style: TextStyle(
                                  color: AppColors.lightBlueColor,
                                  fontSize: height / 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: height / 50),
                            Text(
                              EnString.yourProductDesPatch,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: height / 56.5,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: poppinsMedium),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _onBondingController.buildPageIndicator(),
                ),
                SizedBox(height: height / 20),
                _onBondingController.currentPage.value !=
                    _onBondingController.numPages - 1
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () => Get.offNamed(AppRoute.loginscreen),
                            child: Container(
                              width: kIsWeb ? width / 5 : width / 1.4,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          kIsWeb ? height / 50 : height / 50),
                                  child: Text(
                                    "Get started",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontSize: height / 50,
                                            fontWeight: FontWeight.w600,
                                            ),
                                  ),
                                ),
                              ),
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
