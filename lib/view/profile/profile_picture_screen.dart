import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/colors/colors.dart';
import '../../../config/images/images.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        title: 'Profile Photo',
        onPressed: () {
          Get.back();
        },
        backgroundColor: AppColors.blackColor,
        textColor: AppColors.whiteColor,
        iconImage: IconImage.close,
      ),
      body: Center(
        child: ClipOval(
          child: Container(
            color: AppColors.searchFieldColor,
            width: 292,
            height: 292,
            child: Image.asset(AppImage.userImage),
          ),
        ),
      ),
    );
  }
}
