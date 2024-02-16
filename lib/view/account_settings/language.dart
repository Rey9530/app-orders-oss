import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';
import '../../controller/language_controller/language_controller.dart';

class Language extends StatelessWidget {
  Language({Key? key}) : super(key: key);

  final LanguageController _languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        path: 'language',
        title: EnString.language.tr,
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              _languages(context, EnString.us, EnString.us),
              _languages(context, EnString.hindi, EnString.hindi),
              _languages(context, EnString.french, EnString.french),
              _languages(context, EnString.arabic, EnString.arabic),
              _languages(context, EnString.german, EnString.german),
              _languages(context, EnString.chinese, EnString.chinese),
            ],
          ),
        ),
      ),
    );
  }

  Widget _languages(context, String values, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.kPadding12),
      child: Center(
        child: Container(
          width: kIsWeb ? 350 : width,
          color: Colors.transparent,
          child: RadioListTile(
            activeColor: AppColors.lightBlueColor,
            value: values,
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: _languageController.languageName.value,
            onChanged: (value) {
              _languageController.languageName.value = value.toString();
              _languageController.changeLanguage(language: value);
            },
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: height / 50,
                  fontWeight: FontWeight.w500,
                  fontFamily: poppinsMedium),
            ),
          ),
        ),
      ),
    );
  }
}
