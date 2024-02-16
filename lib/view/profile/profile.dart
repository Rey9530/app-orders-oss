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
import '../../../widget/add_profile_photo.dart';
import 'profile_picture_screen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () => _willPop(context),
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBgColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            EnString.profile,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 40,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(const ProfilePicture());
                        },
                        child: Container(
                          height: height / 8,
                          width: width / 3.9,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "R",
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: poppinsMedium,
                                fontSize: _profileImageHeight(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => addprofilephoto(context),
                        child: Image.asset(
                          AppImage.camera,
                          height: _selectCameraHeight(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 80),
              Text(
                EnString.wadeWarren,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: height / 42,
                    fontWeight: FontWeight.w500,
                    fontFamily: poppinsMedium),
              ),
              SizedBox(
                height: height / 50,
              ),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.myaccount);
                  },
                  child:
                      _catagory(context, EnString.myAccount, IconImage.user)),
              // Container(
              //   color: Colors.transparent,
              //   width: kIsWeb ? width / 3.5 : width,
              //   child: Divider(
              //     indent: 55,
              //     endIndent: 20,
              //     thickness: 0.5,
              //     color: AppColors.indicatorGreyColor,
              //   ),
              // ),
              // GestureDetector(
              //     onTap: () {
              //       Get.toNamed(AppRoute.myorders);
              //     },
              //     child:
              //         _catagory(context, EnString.myOrder, IconImage.myorder)),
              // Container(
              //   color: Colors.transparent,
              //   width: kIsWeb ? width / 3.5 : width,
              //   child: Divider(
              //     indent: 55,
              //     endIndent: 20,
              //     thickness: 0.5,
              //     color: AppColors.indicatorGreyColor,
              //   ),
              // ),
              // GestureDetector(
              //     onTap: () {
              //       Get.toNamed(AppRoute.deliveryaddress);
              //     },
              //     child: _catagory(
              //         context, EnString.myAddress, IconImage.myaddress)),
              // Container(
              //   color: Colors.transparent,
              //   width: kIsWeb ? width / 3.5 : width,
              //   child: Divider(
              //     indent: 55,
              //     endIndent: 20,
              //     thickness: 0.5,
              //     color: AppColors.indicatorGreyColor,
              //   ),
              // ),
              // GestureDetector(
              //     onTap: () {
              //       Get.toNamed(AppRoute.paymentmethod);
              //     },
              //     child: _catagory(
              //         context, EnString.paymentMethod, IconImage.payment)),
              // Container(
              //   color: Colors.transparent,
              //   width: kIsWeb ? width / 3.5 : width,
              //   child: Divider(
              //     indent: 55,
              //     endIndent: 20,
              //     thickness: 0.5,
              //     color: AppColors.indicatorGreyColor,
              //   ),
              // ),
              // GestureDetector(
              //     onTap: () => Get.toNamed(AppRoute.addtowishlist),
              //     child: _catagory(
              //         context, EnString.myWishlist, IconImage.wishlist)),
              // Container(
              //   color: Colors.transparent,
              //   width: kIsWeb ? width / 3.5 : width,
              //   child: Divider(
              //     indent: 55,
              //     endIndent: 20,
              //     thickness: 0.5,
              //     color: AppColors.indicatorGreyColor,
              //   ),
              // ),
              // GestureDetector(
              //     onTap: () {
              //       Get.toNamed(AppRoute.settings);
              //     },
              //     child: _catagory(
              //         context, EnString.accountSetting, IconImage.setting)),
              Container(
                color: Colors.transparent,
                width: kIsWeb ? width / 3.5 : width,
                child: Divider(
                  indent: 55,
                  endIndent: 20,
                  thickness: 0.5,
                  color: AppColors.indicatorGreyColor,
                ),
              ),
              GestureDetector(
                  onTap: () => _showAlertDialog(context),
                  child: _catagory(context, EnString.logout, IconImage.logout)),
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

  _profileImageHeight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return height / 20;
    } else if (MediaQuery.of(context).size.width < 900) {
      return height / 50;
    } else {
      return height / 20;
    }
  }

  _selectCameraHeight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return height / 20;
    } else if (MediaQuery.of(context).size.width < 900) {
      return height / 25;
    } else {
      return height / 20;
    }
  }

  Widget _catagory(BuildContext context, String text, String imgs) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        height: height / 16,
        width: kIsWeb ? 300 : width,
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              imgs,
              height: height / 34,
              color: AppColors.blackColor,
            ),
            SizedBox(width: width / 30),
            Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 47,
                  fontWeight: FontWeight.w500,
                  fontFamily: poppinsMedium),
            ),
            const Spacer(),
            Image.asset(
              IconImage.rightarrow,
              height: height / 43,
            ),
            SizedBox(width: width / 32)
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: const EdgeInsets.only(top: 20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          title: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 25,
                  child: Text(
                    EnString.logout,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: height / 45,
                        color: const Color(0xffF04949),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                height: height / 9,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(height: height / 200),
                    Divider(
                      endIndent: 1,
                      height: 0.5,
                      color: AppColors.indicatorGreyColor,
                      thickness: 0.2,
                    ),
                    SizedBox(height: height / 70),
                    SizedBox(
                      width: width / 1.8,
                      child: Text(
                        EnString.areYouSureLogout,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: height / 55,
                                // color: const Color(0xffF04949),
                                fontFamily: poppinsMedium),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: height / 17,
                      width: width / 3.5,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          EnString.cancel,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontSize: height / 55,
                                  // color: const Color(0xffF04949),
                                  fontFamily: poppinsMedium),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width / 25),
                  GestureDetector(
                    onTap: () => Get.offAllNamed(AppRoute.loginscreen),
                    child: Container(
                      height: height / 17,
                      width: width / 3.5,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          EnString.yes,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontSize: height / 55,
                                  color: AppColors.whiteColor,
                                  fontFamily: poppinsMedium),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 30),
            ],
          ),
        );
      },
    );
  }
}
