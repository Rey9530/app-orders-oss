import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../controller/bottombar_controller/bottombar_controller.dart';
import '../../../widget/categories_widget.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () => _willPop(context),
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text(EnString.customers),
          leading: Image.asset(
            IconImage.backarrow,
            color: AppColors.whiteColor,
          ),
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.blackColor,
          elevation: 0,
          centerTitle: true,
          leadingWidth: 16,
        ),
        body: Column(
          children: [
            SizedBox(height: kIsWeb ? height / 50 : 0),
            WidgetCategories(),
          ],
        ),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    Get.find<BottomBarController>().changePage(bottomNavIndex: 0);
    return false;
  }
}
