import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/approutes/approutes.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../controller/trackordercontroller/trackordercontroller.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';
import '../../../../utils/textstyle/textstyle.dart';
import '../../controller/language_controller/language_controller.dart';

class TrackOrder extends StatelessWidget {
  TrackOrder({Key? key}) : super(key: key);

  final TrackOrderController _trackOrderController =
      Get.put(TrackOrderController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.trackOrder,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 100,
            ),
            _carts(context),
            SizedBox(height: height / 70),
            Timeline.tileBuilder(
              physics: const ScrollPhysics(),
              theme: TimelineThemeData(
                nodeItemOverlap: true,
                indicatorPosition: 0.38,
                nodePosition: 0.09,
              ),
              shrinkWrap: true,
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: 3,
                contentsAlign: ContentsAlign.basic,
                contentsBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 8, top: index == 2 ? 20 : 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.kPadding8,
                                  ),
                                  Image.asset(
                                    AppImage.box,
                                    height: SizeConfig.kPadding19,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.kPadding19,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        EnString.orderConfirmed,
                                        style: _trackOrderController.index
                                                .contains(index)
                                            ? TextStyleConfig.styleBlackTitle
                                            : TextStyleConfig.styleBlackTitle,
                                      ),
                                      Text(
                                        "Order#234562",
                                        style: _trackOrderController.index
                                                .contains(index)
                                            ? TextStyleConfig.greySmallText
                                            : TextStyleConfig.greySmallText,
                                      ),
                                      Text(
                                        "9:10 PM, 19 june 2022",
                                        style: _trackOrderController.index
                                                .contains(index)
                                            ? TextStyleConfig.greySmallText
                                            : TextStyleConfig.greySmallText,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : index == 1
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.kPadding8,
                                      ),
                                      Image.asset(
                                        IconImage.orderDispatched,
                                        height: SizeConfig.kPadding19,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.kPadding19,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            EnString.orderDispatched,
                                            style: _trackOrderController.index
                                                    .contains(index)
                                                ? TextStyleConfig
                                                    .styleBlackTitle
                                                : TextStyleConfig
                                                    .styleBlackTitle,
                                          ),
                                          Text(
                                            "Order#234562",
                                            style: _trackOrderController.index
                                                    .contains(index)
                                                ? TextStyleConfig.greySmallText
                                                : TextStyleConfig.greySmallText,
                                          ),
                                          Text(
                                            "11:00 PM, 20 june 2022",
                                            style: _trackOrderController.index
                                                    .contains(index)
                                                ? TextStyleConfig.greySmallText
                                                : TextStyleConfig.greySmallText,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.kPadding8,
                                      ),
                                      Image.asset(
                                        IconImage.orderDispatch,
                                        height: SizeConfig.kPadding19,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.kPadding19,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            EnString.orderDelivered,
                                            style: TextStyle(
                                              color:
                                                  AppColors.indicatorGreyColor,
                                              fontSize: SizeConfig.kPadding16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: poppinsSemiBold,
                                            ),
                                          ),
                                          Text(
                                            "Order#234562",
                                            style: _trackOrderController.index
                                                    .contains(index)
                                                ? TextStyleConfig.greySmallText
                                                : TextStyleConfig.greySmallText,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                      ],
                    ),
                  );
                },
                indicatorBuilder: (_, index) {
                  if (index == 0 || index == 1) {
                    return Image.asset(
                      IconImage.rightfill,
                      height: 20,
                      width: 20,
                    );
                  } else {
                    return Image.asset(
                      IconImage.unfilltrack,
                      height: 20,
                      width: 20,
                    );
                  }
                },
                connectorBuilder: (context, index, type) {
                  return DashedLineConnector(
                    dash: 4.0,
                    gap: 4.0,
                    thickness: 1.0,
                    color: index == 1
                        ? AppColors.lightBlueColor
                        : AppColors.indicatorGreyColor,
                  );
                },
              ),
            ),
            SizedBox(height: height / 50),
            Padding(
              padding:
                  EdgeInsets.only(right: kIsWeb ? width / 5 : width / 1.95),
              child: Text(
                EnString.deliveryAddress,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.blackColor,
                      fontSize: height / 45,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.deliveryaddress);
              },
              child: _homeAddress(context),
            ),
            SizedBox(height: height / 40),
          ],
        ),
      ),
    );
  }

  Widget _homeAddress(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kIsWeb ? 0 : width / 12, vertical: width / 44),
      child: Center(
        child: Container(
          height: kIsWeb ? height / 4.8 : height / 4.4,
          width: kIsWeb ? width / 3.5 : width / 1.1,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.indicatorGreyColor.withOpacity(0.3),
                blurRadius: 4.0,
              ),
            ],
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 50),
              Row(
                children: [
                  SizedBox(width: kIsWeb ? width / 80 : 0),
                  Container(
                    height: height / 18,
                    width: kIsWeb ? width / 45 : width / 5,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightBlueColor.withOpacity(0.5),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(height / 90),
                        child: Image.asset(
                          IconImage.home,
                          color: AppColors.lightBlueColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: kIsWeb ? width / 100 : width / 40),
                  Text(
                    EnString.home,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: height / 40,
                        fontWeight: FontWeight.w500,
                        fontFamily: poppinsRegular),
                  ),
                  SizedBox(width: kIsWeb ? width / 80 : width / 25),
                ],
              ),
              SizedBox(height: height / 45),
              Padding(
                padding:
                    EdgeInsets.only(left: kIsWeb ? width / 70 : width / 25,right:kIsWeb ? width / 70 : width / 25 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      EnString.estherHoward,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: height / 47,
                              fontWeight: FontWeight.w500,
                              fontFamily: poppinsRegular),
                    ),
                    SizedBox(height: height / 100),
                    Container(
                      color: Colors.transparent,
                      width: width / 1.2,
                      child: Text(
                        EnString.santaAna,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: AppColors.indicatorGreyColor,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w400,
                                fontFamily: poppinsRegular),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cardHeight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return height / 5.5;
    } else if (MediaQuery.of(context).size.width < 900) {
      return height / 4.7;
    } else {
      return height / 5.5;
    }
  }

  Widget _carts(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 14),
      child: Container(
        height: _cardHeight(context),
        width: kIsWeb ? width / 3.5 : width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.indicatorGreyColor.withOpacity(0.3),
              blurRadius: 4.0,
            ),
          ],
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: kIsWeb ? height / 35 : height / 30,
                ),
               Obx(() =>  Padding(
                 padding: EdgeInsets.only(
                     left: languageController.arb.value
                         ? 0
                         : kIsWeb
                         ? width / 60
                         : width / 18,
                     right: languageController.arb.value
                         ? kIsWeb
                         ? width / 60
                         : width / 18
                         : 0),
                 child: Container(
                   height: kIsWeb ? height / 8 : height / 9,
                   width: kIsWeb ? width / 12 : width / 5,
                   decoration: BoxDecoration(
                     color: AppColors.searchFieldColor,
                     borderRadius: const BorderRadius.all(
                       Radius.circular(10),
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.all(height / 80),
                     child: Image.asset(
                       AppImage.designjeans,
                     ),
                   ),
                 ),
               ),)
              ],
            ),
            SizedBox(width: kIsWeb ? width / 100 : width / 40),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: height / 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          EnString.designerJeans,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: height / 45,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: poppinsMedium),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 160),
                    Row(
                      children: [
                        Container(
                          height: height / 40,
                          width: kIsWeb ? width / 70 : width / 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.blueColor,
                          ),
                        ),
                        SizedBox(
                          width: width / 80,
                        ),
                        Text(
                          "Color",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.indicatorGreyColor,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          height: height / 40,
                          width: width / 300,
                          color: AppColors.indicatorGreyColor,
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          "Size : M",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.indicatorGreyColor,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          height: height / 40,
                          width: width / 300,
                          color: AppColors.indicatorGreyColor,
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Flexible(
                          child: Text(
                            "Qty= 1",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.indicatorGreyColor,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 160),
                    Container(
                      width: width / 3,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              "\$100.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.lightBlueColor,
                                    fontSize: height / 45,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => languageController.arb.value
                              ? Container(
                                  height: height / 26,
                                  width: kIsWeb ? width / 14 : width / 4,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlueColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: languageController.arb.value
                                          ? const Radius.circular(15)
                                          : const Radius.circular(0),
                                      topRight: languageController.arb.value
                                          ? const Radius.circular(20)
                                          : const Radius.circular(0),
                                      topLeft: languageController.arb.value
                                          ? const Radius.circular(0)
                                          : const Radius.circular(20),
                                      bottomRight: languageController.arb.value
                                          ? const Radius.circular(0)
                                          : const Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      EnString.delivered,
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: poppinsMedium,
                                        fontWeight: FontWeight.w500,
                                        fontSize: height / 55,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: height / 26,
                                  width: kIsWeb ? width / 14 : width / 4,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlueColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: languageController.arb.value
                                          ? const Radius.circular(15)
                                          : const Radius.circular(0),
                                      topRight: languageController.arb.value
                                          ? const Radius.circular(20)
                                          : const Radius.circular(0),
                                      topLeft: languageController.arb.value
                                          ? const Radius.circular(0)
                                          : const Radius.circular(20),
                                      bottomRight: languageController.arb.value
                                          ? const Radius.circular(0)
                                          : const Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      EnString.delivered,
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: poppinsMedium,
                                        fontWeight: FontWeight.w500,
                                        fontSize: height / 55,
                                      ),
                                    ),
                                  ),
                                ),
                        )
                      ],
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
