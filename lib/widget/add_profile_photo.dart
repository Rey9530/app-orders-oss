import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors/colors.dart';
import '../config/enstring/enstring.dart';
import '../config/fontfamily.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';
import '../view/profile/profile_picture_screen.dart';

addprofilephoto(context) {
  showModalBottomSheet(
    backgroundColor: AppColors.appBgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: height / 90,
                ),
                Container(
                  height: height / 180,
                  width: width / 5,
                  decoration: BoxDecoration(
                    color: AppColors.indicatorGreyColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Text(
                  EnString.addProfilePhoto,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.blackColor,
                      fontSize: height / 50,
                      fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: AppColors.indicatorGreyColor.withOpacity(0.3),
                  thickness: 2,
                ),
                SizedBox(height: height / 60),
                GestureDetector(
                  onTap: (){
                    Get.to(const ProfilePicture());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: width / 10),
                      Image.asset(IconImage.takephoto, height: height / 40),
                      SizedBox(width: width / 30),
                      Text(
                        EnString.takeAPhoto,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: height / 50, fontFamily: poppinsMedium),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height / 30),
                GestureDetector(
                  onTap: (){
                    Get.to(const ProfilePicture());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: width / 10),
                      Image.asset(IconImage.gallery, height: height / 40),
                      SizedBox(width: width / 30),
                      Text(
                        EnString.upLoadFromGallery,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: height / 50, fontFamily: poppinsMedium),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 25),
              ],
            ),
          )
        ],
      );
    },
  );
}
