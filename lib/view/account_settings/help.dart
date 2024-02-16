import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/textstyle/textstyle.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.help,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: kIsWeb ? 300 : width / 1.15,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      EnString.popularFaq,
                      style: TextStyleConfig.styleBlackTitle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 40),
                      child: Text(
                        EnString.whatIsShopinoz,
                        style: TextStyleConfig.blackSmallText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 70),
                      child:
                          Divider(color: AppColors.blackColor, thickness: 0.7),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 60),
                      child: Text(
                        EnString.differentThings,
                        style: TextStyleConfig.blackSmallText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 70),
                      child:
                          Divider(color: AppColors.blackColor, thickness: 0.7),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 60),
                      child: Text(
                        EnString.getOffers,
                        style: TextStyleConfig.blackSmallText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 70),
                      child:
                          Divider(color: AppColors.blackColor, thickness: 0.7),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 60),
                      child: Text(
                        EnString.purchaseProduct,
                        style: TextStyleConfig.blackSmallText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
