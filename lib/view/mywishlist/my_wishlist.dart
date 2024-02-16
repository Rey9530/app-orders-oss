import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import 'mywishlistwidget.dart';

class MyWishList extends StatelessWidget {
  const MyWishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: AppBar(scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.appBgColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              color: Colors.transparent,
              child: Image.asset(
                IconImage.backarrow,
                color: AppColors.blackColor,
                height: height / 50,
              ),
            ),
          ),
        ),
        title: Text(
          EnString.myWishlist,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.blackColor,
                fontSize: height / 40,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10,left: 10),
            child: Text(
              "6 Items",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.indicatorGreyColor,
                  fontSize: height / 55,
                  fontFamily: poppinsMedium),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 40),
            MyWishListWidget(),
          ],
        ),
      ),
    );
  }
}
