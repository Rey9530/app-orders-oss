import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';
import '../../../../utils/textstyle/textstyle.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.appBgColor,
          appBar: CustomAppBar(title: EnString.contactus, onPressed: (){
            Get.back();
          },),
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
                          EnString.getInTouch,
                          style: TextStyleConfig.styleBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            EnString.friendlyTeam,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: height / 60,
                              fontWeight: FontWeight.w500,
                              fontFamily: poppinsMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Align(
                                alignment: Alignment.topCenter
                                ,child: Image.asset(IconImage.sms,height: height / 30,)),
                                Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.kPadding12,right:SizeConfig.kPadding12 ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        EnString.emailUs,
                                        style: TextStyleConfig.styleBlackTitle
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                                        child: Text(
                                            EnString.teamHelp,
                                            style: TextStyleConfig.greySmallText
                                        ),
                                      ),
                                      Text(
                                          EnString.exampleEmail,
                                          style: TextStyleConfig.greySmallText
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: SizeConfig.kPadding25),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Align(
                                alignment: Alignment.topCenter
                                    ,child: Image.asset(IconImage.location,height: height / 30,)),
                                Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.kPadding12,right: SizeConfig.kPadding12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          EnString.office,
                                          style: TextStyleConfig.styleBlackTitle
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                                        child: Text(
                                            EnString.comeSay,
                                            style: TextStyleConfig.greySmallText
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                                        child: Text(
                                            EnString.smithStreet,
                                            style: TextStyleConfig.greySmallText
                                        ),
                                      ),
                                      Text(
                                          EnString.collingwood,
                                          style: TextStyleConfig.greySmallText
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.kPadding25),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                 Align(
                                alignment: Alignment.topCenter
                                ,child: Image.asset(IconImage.call,height: height / 30,)),
                                Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.kPadding12,right: SizeConfig.kPadding12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          EnString.phone,
                                          style: TextStyleConfig.styleBlackTitle
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                                        child: Text(
                                            EnString.weekend,
                                            style: TextStyleConfig.greySmallText
                                        ),
                                      ),
                                      Text(
                                          EnString.numbers,
                                          style: TextStyleConfig.greySmallText
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconImage.instagram,height: height / 30),
                SizedBox(width: width / 30,),
                Image.asset(IconImage.facebook,height: height / 30),
                SizedBox(width: width / 30,),
                Image.asset(IconImage.twitter,height: height / 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
