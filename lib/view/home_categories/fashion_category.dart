import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/approutes/approutes.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../controller/bottombar_controller/bottombar_controller.dart';
import '../../../controller/fashion_controller/fashion_controller.dart';

class FashionCategory extends StatelessWidget {
  final bool isClick;
  FashionCategory({this.isClick = false,Key? key}) : super(key: key);

  final FashionController _fashionController = Get.put(FashionController());
  final BottomBarController _bottomBarController = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () async {
        isClick ? _bottomBarController.changePageList(false):Navigator.pop(context);
        return true;
      },
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: CustomAppBar(title: EnString.fashion, onPressed: () {
          isClick ? _bottomBarController.changePageList(false):Navigator.pop(context);

        },),
        body: SingleChildScrollView(
          child: Obx(
                () =>
                Column(
                  children: [
                    _serchFild(),
                    SizedBox(height: height / 35),
                    Container(
                      color: Colors.transparent,
                      width: kIsWeb ? width / 3.5 : width /  1.1,
                      child: Image.asset(AppImage.fashionOfferImage,fit: BoxFit.fitWidth,),
                    ),
                    SizedBox(height: height / 42),
                    Container(
                      height: height / 20,
                      width: kIsWeb ? width / 3.5 : width / 1.1,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,

                        labelStyle: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                            fontSize: height / 55, fontFamily: poppinsMedium),
                        controller: _fashionController.tabController,
                        indicatorWeight: 0,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          color: AppColors.whiteColor,
                        ),
                        automaticIndicatorColorAdjustment: false,
                        indicatorPadding: const EdgeInsets.symmetric(
                            horizontal: 5.0),
                        overlayColor: MaterialStateProperty.all(
                            Colors.transparent),
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColors.indicatorGreyColor,
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 5.0),
                        tabs: [
                          Tab(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: _fashionController.selectedIndex
                                      .value == 0
                                      ? AppColors.lightBlueColor
                                      : AppColors.searchFieldColor),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("All"),
                              ),
                            ),
                          ),
                          Tab(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: _fashionController.selectedIndex.value ==
                                    1
                                    ? AppColors.lightBlueColor
                                    : AppColors.searchFieldColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("Men"),
                              ),
                            ),
                          ),
                          Tab(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: _fashionController.selectedIndex.value ==
                                    2
                                    ? AppColors.lightBlueColor
                                    : AppColors.searchFieldColor,
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("Women"),
                              ),
                            ),
                          ),
                          Tab(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: _fashionController.selectedIndex
                                      .value == 3
                                      ? AppColors.lightBlueColor
                                      : AppColors.searchFieldColor),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("Kids"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // tab bar view here
                    SizedBox(
                      height: kIsWeb ? height * 2 : height * 2.25,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _fashionController.tabController,
                        children: [
                          tabAllFashion(context),
                          tabAllFashion(context),
                          tabAllFashion(context),
                          tabAllFashion(context),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
  Widget tabAllFashion(context) {
    return Column(
      children: [
        SizedBox(height: height / 40),
        Row(
          children: [
            SizedBox(width: width / 20),
            Text(
              EnString.topRatedMen,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                fontSize: height / 44,
                fontFamily: poppinsMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: height / 45),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: kIsWeb ? width / 3 : width,
            color: Colors.transparent,
            height: _cardheight(context),
            child: GridView.builder(
              // shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: height / 3,
                childAspectRatio: _cardheight(context),
                crossAxisSpacing: kIsWeb ? 27 : width * 0.02,
              ),
              itemCount: _fashionController.topRatedMenClothImage.length,
              itemBuilder: (BuildContext ctx, index) {
                return Wrap(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.mansjeans);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: kIsWeb ? 25.h : 30.h,
                          width: kIsWeb ? 32.h : width / 2.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: AppColors.indicatorGreyColor
                                    .withOpacity(0.2),
                                blurRadius: 4.0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: height / 65),
                              Container(
                                height: kIsWeb ? 17.h : 22.5.h,
                                width: kIsWeb ? width / 9.1 : width / 2.7,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    _fashionController
                                        .topRatedMenClothImage[index],
                                    scale: 3.5,
                                  ),
                                ),
                              ),
                              SizedBox(height: height / 50),
                              Text(
                                _fashionController.topRatedMenClothTitle[index],
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                  fontSize: height / 50,
                                  color: AppColors.lightBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: height / 50),
        Row(
          children: [
            SizedBox(width: width / 20),
            Text(
              EnString.topRatedWomen,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                fontSize: height / 44,
                fontFamily: poppinsMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: height / 45),
        Container(
          width: kIsWeb ? width / 3 : width,
          color: Colors.transparent,
          height: _cardheight(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 22),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: height / 3,
                childAspectRatio: _cardheight(context),
                crossAxisSpacing: kIsWeb ? 27 : width * 0.045,
              ),
              itemCount: _fashionController.topRatedWomenClothImage.length,
              itemBuilder: (BuildContext ctx, index) {
                return Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        height: kIsWeb ? 25.h : 30.h,
                        width: kIsWeb ? 32.h : width / 2.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                              AppColors.indicatorGreyColor.withOpacity(0.2),
                              blurRadius: 4.0,
                            ),
                          ],
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height / 65),
                            Container(
                              height: kIsWeb ? 17.h : 22.5.h,
                              width: kIsWeb ? width / 9.1 : width / 2.7,
                              decoration: BoxDecoration(
                                color: const Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  _fashionController
                                      .topRatedWomenClothImage[index],
                                  scale: 3.5,
                                ),
                              ),
                            ),
                            SizedBox(height: height / 50),
                            Flexible(
                              child: Text(
                                _fashionController
                                    .topRatedWomenClothTitle[index],
                                overflow: TextOverflow.ellipsis,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                  fontSize: height / 50,
                                  color: AppColors.lightBlueColor,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: height / 40),
        Row(
          children: [
            SizedBox(width: width / 20),
            Text(
              EnString.topRatedChildren,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: height / 44, fontFamily: poppinsMedium),
            ),
          ],
        ),
        SizedBox(height: height / 45),
        Container(
          width: kIsWeb ? width / 3 : width,
          color: Colors.transparent,
          height: _cardheight(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 22,),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: height / 3,
                childAspectRatio: _cardheight(context),
                crossAxisSpacing: kIsWeb ? 27 : width * 0.045,

              ),
              itemCount: _fashionController.topRatedChildrenClothImage.length,
              itemBuilder: (BuildContext ctx, index) {
                return Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        height: kIsWeb ? 25.h : 30.h,
                        width: kIsWeb ? 32.h : width / 2.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                              AppColors.indicatorGreyColor.withOpacity(0.2),
                              blurRadius: 4.0,
                            ),
                          ],
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height / 65),
                            Container(
                              height: kIsWeb ? 17.h : 22.5.h,
                              width: kIsWeb ? width / 9.1 : width / 2.7,
                              decoration: BoxDecoration(
                                color: const Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  _fashionController
                                      .topRatedChildrenClothImage[index],
                                  scale: 3.5,
                                ),
                              ),
                            ),
                            SizedBox(height: height / 50),
                            Flexible(
                              child: Text(
                                _fashionController
                                    .topRatedChildrenClothTitle[index],
                                overflow: TextOverflow.ellipsis,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                  fontSize: height / 50,
                                  color: AppColors.lightBlueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _serchFild() {
    return Center(
      child: Container(
        color: Colors.transparent,
        width: kIsWeb ? width / 3.5 : width / 1.1,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.searchFieldColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: EnString.search,
            prefixIcon: Image.asset(IconImage.search, scale: 2.7),
          ),
        ),
      ),
    );
  }

  _cardheight(context) {
    if (MediaQuery
        .of(context)
        .size
        .width < 900) {
      return MediaQuery
          .of(context)
          .size
          .height / 1.55;
    }
    else {
      return MediaQuery
          .of(context)
          .size
          .height / 2.8;
    }
  }
}
