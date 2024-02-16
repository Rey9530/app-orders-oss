import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';
import '../../../../utils/textstyle/textstyle.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.privacy,
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
                      EnString.privacyShopinoz,
                      style: TextStyleConfig.styleBlackTitle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                      child: Text(
                        EnString.privacyDetails,
                        style: TextStyleConfig.greySmallText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.kPadding15),
                      child: Text(
                        EnString.consent,
                        style: TextStyleConfig.styleBlackTitle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                      child: Text(
                        EnString.consentDetails,
                        style: TextStyleConfig.greySmallText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                      child: Text(
                        EnString.consentSecond,
                        style: TextStyleConfig.greySmallText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.kPadding15),
                      child: Text(
                        EnString.logfiles,
                        style: TextStyleConfig.styleBlackTitle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                      child: Text(
                        EnString.loremIpsum,
                        style: TextStyleConfig.greySmallText,
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
