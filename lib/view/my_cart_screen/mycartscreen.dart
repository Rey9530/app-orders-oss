import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../controller/bottombar_controller/bottombar_controller.dart';
import '../../controller/mycart_controller/mycart_controller.dart';

// ignore: must_be_immutable
class CustumerView extends StatelessWidget {
  bool isBackButtonShow;
  CustumerView({
    super.key,
    required this.isBackButtonShow,
  });

  final MyCartController _myCartController = Get.put(MyCartController());

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () => _willPop(context),
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.blackColor,
          elevation: 0,
          leading: GestureDetector(
              onTap: !isBackButtonShow
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(height / 45),
                  child: Image.asset(
                    IconImage.backarrow,
                    color: isBackButtonShow
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                    scale: 4,
                  ),
                ),
              )),
          centerTitle: true,
          title: Text(EnString.customers),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              carts(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    _onTap();
    return false;
  }

  _onTap() {
    Get.find<BottomBarController>().changePage(bottomNavIndex: 0);
  }

  Widget carts() {
    return Center(
      child: Container(
        height: height / 1.4,
        width: kIsWeb ? width / 3 : width,
        color: Colors.transparent,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: height / 200),
          itemCount: _myCartController.cartImages.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppRoute.myorders);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: width / 46),
                    child: Container(
                      height: 75,
                      width: width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppColors.indicatorGreyColor.withOpacity(0.3),
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
                          Container(
                            width: 40,
                            height: 40,
                            // color: Colors.red,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              IconImage.user,
                              // height: height / 43,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: kIsWeb ? width / 100 : width / 25),
                              child: SizedBox(
                                height: kIsWeb ? height / 8 : height / 7.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      _myCartController.names[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'c',
                                          ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Negocio: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: AppColors
                                                    .indicatorGreyColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: poppinsSemiBold,
                                              ),
                                        ),
                                        Text(
                                          _myCartController.description[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: AppColors
                                                    .indicatorGreyColor,
                                                fontSize: height / 70,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Telefono: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: AppColors
                                                    .indicatorGreyColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: poppinsSemiBold,
                                              ),
                                        ),
                                        Text(
                                          "7827-3695",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: AppColors
                                                    .indicatorGreyColor,
                                                fontSize: height / 70,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 160),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
