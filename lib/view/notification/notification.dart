import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../controller/notification_controller/notification_controller.dart';

class ShowNotificationScreen extends StatelessWidget {
  ShowNotificationScreen({Key? key}) : super(key: key);

  final NotificationController _notificationController =
      Get.put(NotificationController());

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 50),
            Padding(
              padding: EdgeInsets.only(right: kIsWeb ? width / 4 : width / 1.4),
              child: Text(
                EnString.today,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: height / 45,
                    ),
              ),
            ),
            SizedBox(height: height / 45),
            _todaynotificationlist(context),
            SizedBox(height: height / 50),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 4.3 : width / 1.6),
              child: Text(
                EnString.yesterday,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: height / 45,
                    ),
              ),
            ),
            SizedBox(height: height / 45),
            _yesterdaynotificationlist(context),
            SizedBox(height: height / 60),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 4.3 : width / 1.6),
              child: Text(
                "15/05/2021",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: height / 45,
                    ),
              ),
            ),
            SizedBox(height: height / 45),
            _datenotificationlist(context)
          ],
        ),
      ),
    );
  }

  Widget _todaynotificationlist(context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        height: height / 8,
        width: kIsWeb ? width / 3.5 : width / 1.1,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              height: height / 8,
              width: width / 1.1,
              decoration: BoxDecoration(
                color: AppColors.searchFieldColor,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                children: [
                  Container(
                    height: height / 11,
                    width: kIsWeb ? width / 17 : width / 3.5,
                    decoration: BoxDecoration(
                        color: AppColors.lightBlueColor.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(AppImage.specialdiscount,
                          height: height / 29, color: AppColors.lightBlueColor),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height / 30),
                          Text(
                            EnString.specialDiscount,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontSize:
                                        kIsWeb ? height / 50 : height / 70,
                                    fontFamily: poppinsMedium),
                          ),
                          SizedBox(height: height / 150),
                          Text(
                            EnString.promotionOnlyValid,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontSize:
                                        kIsWeb ? height / 60 : height / 80,
                                    fontFamily: poppinsRegular),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: height / 15),
                    child: Text(
                      "9:44PM",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.indicatorGreyColor,
                            fontSize: height / 65,
                            fontFamily: poppinsMedium,
                          ),
                    ),
                  ),
                  SizedBox(width: width / 35)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _yesterdaynotificationlist(context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        height: height / 2.3,
        width: kIsWeb ? width / 3.5 : width / 1.1,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _notificationController.yesterdayImage.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: height / 8,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                    color: AppColors.searchFieldColor,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: height / 11,
                        width: kIsWeb ? width / 17 : width / 3.5,
                        decoration: BoxDecoration(
                            color: AppColors.lightBlueColor.withOpacity(0.3),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Image.asset(
                              _notificationController.yesterdayImage[index],
                              height: height / 29,
                              color: AppColors.lightBlueColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height / 30),
                          Text(
                            _notificationController.yesterdayTitle[index],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontSize:
                                        kIsWeb ? height / 50 : height / 70,
                                    fontFamily: poppinsMedium),
                          ),
                          SizedBox(height: height / 150),
                          Text(
                            _notificationController.yesterdaySubTitle[index],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontSize:
                                        kIsWeb ? height / 60 : height / 80,
                                    fontFamily: poppinsRegular),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: height / 15),
                        child: Text(
                          _notificationController.yesterdayTime[index],
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 65,
                                    fontFamily: poppinsMedium,
                                  ),
                        ),
                      ),
                      SizedBox(width: width / 35)
                    ],
                  ),
                ),
                SizedBox(height: height / 45)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _datenotificationlist(context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        height: height / 2.3,
        width: kIsWeb ? width / 3.5 : width / 1.1,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _notificationController.dateImage.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: height / 8,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                    color: AppColors.searchFieldColor,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: height / 11,
                        width: kIsWeb ? width / 17 : width / 3.5,
                        decoration: BoxDecoration(
                            color: AppColors.lightBlueColor.withOpacity(0.3),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Image.asset(
                              _notificationController.dateImage[index],
                              height: height / 29,
                              color: AppColors.lightBlueColor),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: kIsWeb ? 0 : width / 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height / 30),
                              Text(
                                _notificationController.dateTitle[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize:
                                          kIsWeb ? height / 50 : height / 70,
                                      fontFamily: poppinsMedium,
                                    ),
                              ),
                              SizedBox(height: height / 150),
                              Text(
                                _notificationController.dateSubTitle[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize:
                                          kIsWeb ? height / 60 : height / 80,
                                      fontFamily: poppinsRegular,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: height / 15,
                        ),
                        child: Text(
                          "9:44PM",
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: AppColors.indicatorGreyColor,
                                    fontSize: height / 65,
                                    fontFamily: poppinsMedium,
                                  ),
                        ),
                      ),
                      SizedBox(width: width / 35)
                    ],
                  ),
                ),
                SizedBox(height: height / 45)
              ],
            );
          },
        ),
      ),
    );
  }
}
