import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/approutes/approutes.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';

class NotificationNotFound extends StatelessWidget {
  const NotificationNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.notifications,
        onPressed: () {
          Get.back();
        },
      ),
      body: Column(
        children: [
          SizedBox(height: height / 8),
          Center(
            child: Image.asset(AppImage.notification, height: height / 3.3),
          ),
          SizedBox(height: height / 15),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoute.notificationscreen),
            child: Text(
              EnString.noNotificationFound,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: height / 31,
                    color: AppColors.lightBlueColor,
                  ),
            ),
          ),
          SizedBox(height: height / 180),
          Text(
            EnString.youHaveNotGotten,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: height / 70,
                color: AppColors.blackColor,
                fontFamily: poppinsMedium),
          )
        ],
      ),
    );
  }
}
