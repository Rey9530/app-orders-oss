import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../../components/textbutton.dart';
import '../../config/approutes/approutes.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/fontfamily.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/bottombar_controller/bottombar_controller.dart';
import '../../controller/homescreen_controller/homescreen_controller.dart';
import '../../controller/language_controller/language_controller.dart';
import '../home_categories/fashion_category.dart';
import '../product_detail/product_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.bottomBarController}) : super(key: key);

  final BottomBarController? bottomBarController;
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return ConditionalWillPopScope(
      onWillPop: () => _willPop(context),
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.appBgColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(AppImage.logosmall),
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoute.notificationnotfound),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(IconImage.notification),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: HexColor("#ED4646"),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            return Column(
              children: [
                SizedBox(height: height / 100),
                _searchField(),
                SizedBox(height: height / 70),
                Container(
                  color: Colors.transparent,
                  width: width / 1.1,
                  height: kIsWeb ? height / 3 : height / 4.35,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _homeScreenController.pageController,
                    onPageChanged: (int page) {
                      _homeScreenController.currentbanner.value = page;
                    },
                    children: <Widget>[
                      Image.asset(
                        AppImage.bannersuperoffers,
                      ),
                      Image.asset(
                        AppImage.bannerpromoad,
                      ),
                      Image.asset(
                        AppImage.bannersuperoffers,
                      ),
                      Image.asset(
                        AppImage.bannerpromoad,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _homeScreenController.buildPageIndicator(),
                ),
                SizedBox(height: height / 55),
                Padding(
                  padding:
                      EdgeInsets.only(left: kIsWeb ? width / 100 : width / 20),
                  child: Row(
                    children: [
                      Obx(() => languageController.arb.value
                          ? SizedBox(width: kIsWeb ? width / 80 : width / 20)
                          : const SizedBox.shrink()),
                      Text(
                        EnString.allCategories,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: height / 40,
                                fontFamily: poppinsMedium,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor),
                      ),
                      const Spacer(),

                      ///Text Button
                      CustomTextButton(
                          buttonText: 'See All',
                          onPressed: () {
                            Get.find<BottomBarController>()
                                .changePage(bottomNavIndex: 1);
                          }),
                      Obx(
                        () => languageController.arb.value
                            ? const SizedBox.shrink()
                            : SizedBox(width: kIsWeb ? width / 80 : width / 20),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height / 55),

                /// ============= All Categories =============
                _allCategories(context),
                SizedBox(height: height / 55),
                Row(
                  children: [
                    Obx(() => languageController.arb.value
                        ? SizedBox(width: kIsWeb ? width / 80 : width / 20)
                        : const SizedBox.shrink()),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kIsWeb ? width / 100 : width / 19),
                      child: Text(
                        EnString.popularProducts,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: height / 40,
                                fontWeight: FontWeight.w500,
                                fontFamily: poppinsMedium,
                                color: AppColors.blackColor),
                      ),
                    ),
                    const Spacer(),
                    CustomTextButton(
                        buttonText: 'See All',
                        onPressed: () {
                          Get.toNamed(AppRoute.mansjeans);
                        }),
                    Obx(
                      () => languageController.arb.value
                          ? const SizedBox.shrink()
                          : SizedBox(width: kIsWeb ? width / 80 : width / 20),
                    )
                  ],
                ),
                SizedBox(height: height / 55),

                /// ============= Popular Products =============
                _popularProduct(context),
                SizedBox(height: height / 55),
                Row(
                  children: [
                    Obx(() => languageController.arb.value
                        ? SizedBox(width: kIsWeb ? width / 80 : width / 20)
                        : const SizedBox.shrink()),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kIsWeb ? width / 100 : width / 19),
                      child: Text(
                        EnString.dealsOfTheDay,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: height / 40,
                                fontWeight: FontWeight.w500,
                                fontFamily: poppinsMedium,
                                color: AppColors.blackColor),
                      ),
                    ),
                    const Spacer(),
                    CustomTextButton(buttonText: 'See All', onPressed: () {}),
                    Obx(
                      () => languageController.arb.value
                          ? const SizedBox.shrink()
                          : SizedBox(width: kIsWeb ? width / 80 : width / 20),
                    )
                  ],
                ),
                SizedBox(height: height / 55),

                /// ============= Deal of the Day =============
                _dealsOfTheDay(context),
                SizedBox(height: height / 55),
                Row(
                  children: [
                    Obx(() => languageController.arb.value
                        ? SizedBox(width: kIsWeb ? width / 80 : width / 20)
                        : const SizedBox.shrink()),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kIsWeb ? width / 100 : width / 19),
                      child: Text(
                        EnString.hotsellingproducts,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: height / 40,
                                fontWeight: FontWeight.w500,
                                fontFamily: poppinsMedium,
                                color: AppColors.blackColor),
                      ),
                    ),
                    const Spacer(),
                    CustomTextButton(buttonText: 'See All', onPressed: () {}),
                    Obx(
                      () => languageController.arb.value
                          ? const SizedBox.shrink()
                          : SizedBox(width: kIsWeb ? width / 80 : width / 20),
                    )
                  ],
                ),
                SizedBox(height: height / 55),

                /// ============= Hot Selling Products =============
                _hotSellingProducts(context),
                SizedBox(height: height / 30),
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    if (bottomBarController!.currentIndex.value == 0) {
      if (bottomBarController!.isExit.isTrue) {
        SystemNavigator.pop();
      } else {
        SnackBar snackBar = SnackBar(
          content: const Text('Tap again to exit the app'),
          backgroundColor: AppColors.lightBlueColor,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        bottomBarController!.isExit.value = true;
      }
    }
    bottomBarController!.changePage(bottomNavIndex: 0);
    return false;
  }

  Widget _searchField() {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: kIsWeb ? width / 110 : width / 22),
        child: TextField(
          // textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.searchFieldColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: EnString.search,
            prefixIcon: Image.asset(
              IconImage.search,
              scale: height / 300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _allCategories(context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kIsWeb ? width / 100 : width / 20,
        right: kIsWeb ? width / 100 : width / 20,
      ),
      child: Container(
        height: kIsWeb ? height / 6 : height / 7,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _categories(AppImage.fashion, EnString.fashion, context),
            _categories(AppImage.electronics, EnString.electronics, context),
            _categories(AppImage.grocery, EnString.grocery, context),
            _categories(AppImage.pharmacy, EnString.pharmacy, context),
          ],
        ),
      ),
    );
  }

  Widget _categories(images, categoriesText, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(FashionCategory());
          },
          child: Container(
            height: height / 10.5,
            width: kIsWeb ? width / 9 : width / 5,
            decoration: BoxDecoration(
              color: AppColors.lightBlueColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(images, height: height / 30),
            ),
          ),
        ),
        SizedBox(height: height / 80),
        Row(
          children: [
            Center(
              child: Text(
                categoriesText,
                style: TextStyle(
                    color: AppColors.lightBlueColor,
                    fontSize: height / 60,
                    fontFamily: poppinsMedium),
              ),
            ),
            SizedBox(width: width / 100),
          ],
        ),
      ],
    );
  }

  Widget _popularProduct(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 30),
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetails());
        },
        child: Container(
          color: Colors.transparent,
          height: kIsWeb ? height / 3.1 : height / 3.2,
          width: kIsWeb ? 400.w : 350.w,
          child: ListView.separated(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: kIsWeb ? 0.h : 34.h,
                    width: kIsWeb ? 40.h : 20.4.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.indicatorGreyColor.withOpacity(0.2),
                          blurRadius: 4.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: kIsWeb ? 17.h : 18.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                Obx(() {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            index == 0
                                                ? _homeScreenController
                                                        .like.value =
                                                    !_homeScreenController
                                                        .like.value
                                                : _homeScreenController
                                                        .like1.value =
                                                    !_homeScreenController
                                                        .like1.value;
                                          },
                                          child: CircleAvatar(
                                            radius: 2.2.h,
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            child: Center(
                                              child: index == 0
                                                  ? _homeScreenController
                                                          .like.value
                                                      ? Image.asset(
                                                          IconImage.unfev,
                                                          height: height / 70,
                                                        )
                                                      : Image.asset(
                                                          IconImage.fev,
                                                          height: height / 70,
                                                        )
                                                  : _homeScreenController
                                                          .like1.value
                                                      ? Image.asset(
                                                          IconImage.unfev,
                                                          height: height / 70,
                                                        )
                                                      : Image.asset(
                                                          IconImage.fev,
                                                          height: height / 70,
                                                        ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Image.asset(
                                      _homeScreenController
                                          .popularproductimage[index],
                                      scale: 0.40.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.w,
                            right: 3.w,
                            top: 1.1.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      _homeScreenController
                                          .popularproducttitle[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    _homeScreenController
                                        .popularproductprice[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontSize: 16,
                                            color: AppColors.lightBlueColor),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 1.w,
                                    ),
                                    child: Text(
                                      _homeScreenController
                                          .popularproductless[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12,
                                              color:
                                                  AppColors.indicatorGreyColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _homeScreenController.popularproductimage.length),
        ),
      ),
    );
  }

  Widget _dealsOfTheDay(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 30),
      child: Container(
        color: Colors.transparent,
        height: height / 3.1,
        width: 350.w,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: kIsWeb ? 0.h : 34.h,
                  width: kIsWeb ? 40.h : 20.4.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indicatorGreyColor.withOpacity(0.2),
                        blurRadius: 4.0,
                      ),
                    ],
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: kIsWeb ? width / 150 : width / 50,
                          right: kIsWeb ? width / 150 : width / 50,
                          top: kIsWeb ? width / 150 : width / 50,
                        ),
                        child: Container(
                          height: kIsWeb ? 17.h : height / 5,
                          decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Stack(
                            children: [
                              Obx(() {
                                return Row(
                                  children: [
                                    SizedBox(width: width / 40),
                                    Container(
                                      height: height / 45,
                                      width: kIsWeb ? width / 35 : width / 10,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "-20%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                  color: AppColors.whiteColor,
                                                  fontSize: height / 70),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: GestureDetector(
                                        onTap: () {
                                          index == 0
                                              ? _homeScreenController
                                                      .like2.value =
                                                  !_homeScreenController
                                                      .like2.value
                                              : _homeScreenController
                                                      .like3.value =
                                                  !_homeScreenController
                                                      .like3.value;
                                        },
                                        child: CircleAvatar(
                                          radius: height / 55,
                                          backgroundColor: AppColors.whiteColor,
                                          child: Center(
                                            child: index == 0
                                                ? _homeScreenController
                                                        .like2.value
                                                    ? Image.asset(
                                                        IconImage.unfev,
                                                        height: height / 70,
                                                      )
                                                    : Image.asset(
                                                        IconImage.fev,
                                                        height: height / 70,
                                                      )
                                                : _homeScreenController
                                                        .like3.value
                                                    ? Image.asset(
                                                        IconImage.unfev,
                                                        height: height / 70,
                                                      )
                                                    : Image.asset(
                                                        IconImage.fev,
                                                        height: height / 70,
                                                      ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Image.asset(
                                    _homeScreenController
                                        .dealsofthedayimage[index],
                                    scale: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 100),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.w,
                          right: 3.w,
                          top: 1.1.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    _homeScreenController
                                        .dealsofthedaytitle[index],
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              _homeScreenController.dealsofthedayprice[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.lightBlueColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _homeScreenController.popularproductimage.length),
      ),
    );
  }

  Widget _hotSellingProducts(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 30),
      child: Container(
        color: Colors.transparent,
        height: kIsWeb ? height / 3.2 : height / 3.1,
        width: kIsWeb ? 400.w : 350.w,
        child: ListView.separated(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: kIsWeb ? 0.h : 34.h,
                  width: kIsWeb ? 40.h : 20.4.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indicatorGreyColor.withOpacity(0.2),
                        blurRadius: 4.0,
                      ),
                    ],
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: kIsWeb ? 17.h : 18.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Stack(
                            children: [
                              Obx(() {
                                return Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          index == 0
                                              ? _homeScreenController
                                                      .like4.value =
                                                  !_homeScreenController
                                                      .like4.value
                                              : _homeScreenController
                                                      .like5.value =
                                                  !_homeScreenController
                                                      .like5.value;
                                        },
                                        child: CircleAvatar(
                                          radius: height / 55,
                                          backgroundColor: AppColors.whiteColor,
                                          child: Center(
                                            child: index == 0
                                                ? _homeScreenController
                                                        .like4.value
                                                    ? Image.asset(
                                                        IconImage.unfev,
                                                        height: height / 70,
                                                      )
                                                    : Image.asset(
                                                        IconImage.fev,
                                                        height: height / 70,
                                                      )
                                                : _homeScreenController
                                                        .like5.value
                                                    ? Image.asset(
                                                        IconImage.unfev,
                                                        height: height / 70,
                                                      )
                                                    : Image.asset(
                                                        IconImage.fev,
                                                        height: height / 70,
                                                      ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              Center(
                                child: Image.asset(
                                  _homeScreenController
                                      .hotsellingproductimage[index],
                                  scale: 3.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 130),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.w,
                          right: 3.w,
                          top: 1.1.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    _homeScreenController
                                        .hotsellingproducttitle[index],
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              _homeScreenController
                                  .hotsellingproductprice[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize: 18,
                                      color: AppColors.lightBlueColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height / 65),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _homeScreenController.popularproductimage.length),
      ),
    );
  }
}
