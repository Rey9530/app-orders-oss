import 'package:flutter/material.dart';

import '../../config/colors/colors.dart';
import '../../config/fontfamily.dart';
import '../sizeconfig/sizeconfig.dart';

class TextStyleConfig {
  static TextStyle styleBlack = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleBlackTitle = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleBlackBoldPrice = TextStyle(
    color: AppColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle styleBluePrice = TextStyle(
    color: AppColors.lightBlueColor,
    fontSize: SizeConfig.kPadding16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleBlackGridTitle = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleText = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding16,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsMedium,
  );

  static TextStyle text16Text500 = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding16,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsRegular,
  );

  static TextStyle text18Text500 = TextStyle(
    color: AppColors.blackColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsRegular,
  );

  static TextStyle greySmallText = TextStyle(
    color: AppColors.indicatorGreyColor,
    fontSize: SizeConfig.kPadding14,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsMedium,
  );

  static TextStyle blackSmallReviewText = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding12,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsMedium,
  );

  static TextStyle blackSmallText = TextStyle(
    color: AppColors.blackColor,
    fontSize: SizeConfig.kPadding15,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsMedium,
  );

  static TextStyle black18NormalText = TextStyle(
    color: AppColors.blackColor,
    fontSize: 18,
    fontFamily: poppinsMedium,
  );
}
