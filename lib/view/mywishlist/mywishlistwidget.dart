import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../controller/mywishlist_controller/mywishlist_controller.dart';

class MyWishListWidget extends StatelessWidget {
  MyWishListWidget({Key? key}) : super(key: key);

  final MyWishListController _myWishListController = Get.put(MyWishListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: kIsWeb ? height * 0.9 : height * 02.4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 33),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            // childAspectRatio: 050,
            childAspectRatio: _cardHeight(context),
            crossAxisSpacing: kIsWeb ? 10 : 0,
            mainAxisSpacing: kIsWeb ? 30 : 0,
          ),
          itemCount: _myWishListController.mensJeansImage.length,
          itemBuilder: (BuildContext ctx, index) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.transparent,
                    height: _fullCardHeight(context),
                    width: kIsWeb ? width / 3 : width / 1.7,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        alignment: Alignment.topLeft,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: height / 65),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: height / 5,
                                  width: width / 2.7,
                                  decoration: BoxDecoration(
                                      // color: Colors.yellow,
                                      color: const Color(0xffF3F3F3),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                _myWishListController.isSelect[index] =_myWishListController.isSelect[index] == true ? false :true;
                                              },
                                              child: CircleAvatar(
                                                radius: height / 55,
                                                backgroundColor:
                                                    AppColors.whiteColor,
                                                child: Obx(
                                                  ()=> Center(
                                                      child: Image.asset(_myWishListController.isSelect[index] == true ? IconImage.fev:
                                                        IconImage.unfev,
                                                        height: height / 70,
                                                      ),

                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Image.asset(
                                          _myWishListController
                                              .mensJeansImage[index],
                                          scale: 3.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 30,right: width/30),
                              child: Text(
                                _myWishListController.mensJeansTitle[index],
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize: _fontHeight(context),
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  _myWishListController.mensJeansPrice[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontSize: _fontHeight(context),
                                        color: AppColors.lightBlueColor,
                                      ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: AppColors.starColor),
                                    Text(
                                      _myWishListController
                                          .mensJeansRating[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontSize: _fontHeight(context),
                                            color: AppColors.blackColor,
                                            fontFamily: poppinsMedium,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _cardHeight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return width / 570;
    } else if (MediaQuery.of(context).size.width < 900) {
      return width / 1700;
    } else {
      return kIsWeb ? width / 2000 : width / 500;
    }
  }

  _fontHeight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return width / 30;
    } else if (MediaQuery.of(context).size.width < 900) {
      return height / 100;
    } else {
      return height / 50;
    }
  }

  _fullCardHeight(context) {
    if (MediaQuery.of(context).size.width < 900) {
      return kIsWeb ? height / 3 : height / 3.45;
    }
    if (MediaQuery.of(context).size.width < 500) {
      return height / 50;
    } else {
      return kIsWeb ? height / 3 : 35.h;
    }
  }
}
