import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/language_controller/language_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final String? iconImage;
  final Function()? onPressed;
  final List<Widget>? action;
  final PreferredSizeWidget? bottom;
  final String? path;

  CustomAppBar(
      {Key? key,
      this.title,
      this.backgroundColor,
      this.textColor,
      this.iconImage,
      required this.onPressed,
      this.action,
      this.bottom,
      this.path})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: backgroundColor ?? AppColors.appBgColor,
      elevation: 0,
      bottom: bottom,
      leading: GestureDetector(
          onTap: () {
            onPressed!();
          },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(height / 45),
              child: path=='language'?
              Obx(() =>languageController.arb.value? RotationTransition(
                turns: AlwaysStoppedAnimation(
                  languageController.arb.value ? 0.5 : 1.0,
                ),
                child: Image.asset(
                  iconImage ?? IconImage.backarrow,
                  color: textColor ?? AppColors.blackColor,
                  scale: 4,
                ),
              ): RotationTransition(
                turns: AlwaysStoppedAnimation(
                  languageController.arb.value ? 0.5 : 1.0,
                ),
                child: Image.asset(
                  iconImage ?? IconImage.backarrow,
                  color: textColor ?? AppColors.blackColor,
                  scale: 4,
                ),
              )):Image.asset(
                iconImage ?? IconImage.backarrow,
                color: textColor ?? AppColors.blackColor,
                scale: 4,
              ),
            ),
          )),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: textColor ?? AppColors.blackColor,
              fontSize: height / 40,
              fontWeight: FontWeight.w600,
            ),
      ),
      actions: action ?? [],
    );
  }
}
