import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/approutes/approutes.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.myAccount,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: kIsWeb ? 300 : width / 1.15,
            color: Colors.transparent,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.editprofile);
                    },
                    child: _catagory(
                        context, EnString.editProfile, IconImage.useredit)),
                Divider(
                  indent: 40,
                  endIndent: 0,
                  thickness: 0.2,
                  color: AppColors.indicatorGreyColor,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.changepassword);
                    },
                    child: _catagory(
                        context, EnString.changePassword, IconImage.unlock)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _catagory(BuildContext context, String text, String imgs) {
    return Container(
      height: height / 16,
      color: Colors.transparent,
      child: Row(
        children: [
          Image.asset(
            imgs,
            height: height / 34,
            color: AppColors.blackColor,
          ),
          SizedBox(
            width: width / 30,
          ),
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
    );
  }
}
