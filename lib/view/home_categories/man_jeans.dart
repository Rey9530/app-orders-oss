import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../search/search_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/approutes/approutes.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/images/images.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../utils/textstyle/textstyle.dart';
import '../../controller/mens_jeans_controller/mens_jeans_controller.dart';

// ignore: must_be_immutable
class MensJeans extends StatelessWidget {
  MensJeans({Key? key}) : super(key: key);

 final MensJeansController _mensJeansController = Get.put(MensJeansController());
 final RxString _startValue = "0".obs;
 final RxString _endValue = "0".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        backgroundColor: AppColors.appBgColor,
        title: EnString.mensjeans,
        onPressed: () {
          Get.back();
        },
        action: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: GestureDetector(
                onTap:(){
              Get.to(SearchScreen());
            },child: Image.asset(IconImage.search, color: AppColors.blackColor,scale: 2.5,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => filterby(context),
                  child: Container(
                    height: height / 20,
                    width: kIsWeb ? width / 8.4 : width / 2.4,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppColors.lightBlueColor),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconImage.filter,
                            height: height / 45,
                            color: AppColors.lightBlueColor),
                        SizedBox(width: width / 45),
                        Text(
                          EnString.filter,
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: height / 50,
                                    color: AppColors.lightBlueColor,
                                    fontFamily: poppinsMedium,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: kIsWeb ? width / 110 : width / 20),
                GestureDetector(
                  onTap: () => shortby(context),
                  child: Container(
                    height: height / 20,
                    width: kIsWeb ? width / 8.4 : width / 2.4,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.lightBlueColor,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconImage.filtericon,
                            height: height / 45,
                            color: AppColors.lightBlueColor),
                        SizedBox(width: width / 45),
                        Text(
                          EnString.sort,
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: height / 50,
                                    color: AppColors.lightBlueColor,
                                    fontFamily: poppinsMedium,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            mensJeans(context),
          ],
        ),
      ),
    );
  }

  cardheight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return width / 570;
    } else if (MediaQuery.of(context).size.width < 900) {
      return width / 1700;
    } else {
      return kIsWeb ? width / 2000 : width / 500;
    }
  }

  fontheight(context) {
    if (MediaQuery.of(context).size.width < 400) {
      return width / 30;
    } else if (MediaQuery.of(context).size.width < 900) {
      return height / 100;
    } else {
      return height / 50;
    }
  }

  fullcardheight(context) {
    if (MediaQuery.of(context).size.width < 900) {
      return kIsWeb ? height / 3 : height / 3.45;
    }
    if (MediaQuery.of(context).size.width < 500) {
      return height / 50;
    } else {
      return kIsWeb ? height / 3 : 35.h;
    }
  }

  Widget mensJeans(context) {
    return Container(
      color: Colors.transparent,
      height: kIsWeb ? height * 0.9 : height * 02.4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 28),

        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: height / 3.15,
            childAspectRatio: cardheight(context),
            crossAxisSpacing: kIsWeb ? 27 : width * 0.02,

          ),
          itemCount: _mensJeansController.mensJeansImage.length,
          itemBuilder: (BuildContext ctx, index) {

            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.transparent,
                    height: fullcardheight(context),
                    width: kIsWeb ? width / 3 : width / 1.7,
                    // color: Colors.red,
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoute.productdetails);
                      },
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
                                              onTap: () {},
                                              child: CircleAvatar(
                                                radius: height / 55,
                                                backgroundColor:
                                                    AppColors.whiteColor,
                                                child: Center(
                                                  child: Image.asset(
                                                    IconImage.unfev,
                                                    height: height / 70,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Image.asset(
                                          _mensJeansController
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
                                _mensJeansController.mensJeansTitle[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleConfig.styleBlackGridTitle,
                              ),
                            ),
                            SizedBox(height: height / 130),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      _mensJeansController.mensJeansPrice[index],
                                    style: TextStyleConfig.styleBluePrice
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.star_rounded,
                                          color: AppColors.starColor, size: 20),
                                      Text(
                                          _mensJeansController
                                            .mensJeansRating[index],
                                        style: TextStyleConfig.blackSmallReviewText
                                      ),
                                    ],
                                  )
                                ],
                              ),
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

  Future filterby(context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.appBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SafeArea(
              child: Wrap(
                children: [
                  Column(
                    children: [
                      SizedBox(height: height / 150),
                      Center(
                        child: Container(
                          height: height / 200,
                          width: width / 4,
                          decoration: BoxDecoration(
                            color: AppColors.indicatorGreyColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 70),
                      Text(
                        EnString.filters,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.blackColor,
                            fontSize: height / 40,
                            fontFamily: poppinsMedium,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: height / 60),
                      Divider(color: AppColors.dividerColor, thickness: 2),
                      SizedBox(height: height / 100),
                      Row(
                        children: [
                          SizedBox(width: width / 20),
                          Text(
                            EnString.size,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontFamily: poppinsMedium,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: width / 20),
                          Container(
                            color: Colors.transparent,
                            height: height / 13,
                            width: width / 1.1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _mensJeansController.sortBy.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _mensJeansController.selected.value = index;
                                    },
                                    child: Obx(() {
                                      return Container(
                                        height: height / 150,
                                        width: width / 10,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: _mensJeansController
                                                          .selected.value ==
                                                      index
                                                  ? Colors.transparent
                                                  : AppColors.blackColor,
                                              width: 2),
                                          color: _mensJeansController
                                                      .selected.value ==
                                                  index
                                              ? AppColors.lightBlueColor
                                              : Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            _mensJeansController.sortBy[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                    color: _mensJeansController
                                                                .selected.value ==
                                                            index
                                                        ? AppColors.whiteColor
                                                        : AppColors.blackColor,
                                                    fontSize: height / 60,
                                                    fontFamily: poppinsMedium),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 130),
                      Row(
                        children: [
                          SizedBox(width: width / 20),
                          Text(
                            EnString.color,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 45,
                                    fontFamily: poppinsMedium,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: height / 70),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: width / 20),
                          Container(
                            color: Colors.transparent,
                            height: height / 13,
                            width: width / 1.1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _mensJeansController.colorList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _mensJeansController.selectedColor.value =
                                          index;
                                    },
                                    child: Obx(() {
                                      return Container(
                                        height: height / 150,
                                        width: width / 11,
                                        decoration: BoxDecoration(
                                          color: _mensJeansController
                                              .colorList[index],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.done,
                                            color: _mensJeansController
                                                        .selectedColor.value ==
                                                    index
                                                ? AppColors.whiteColor
                                                : Colors.transparent,
                                            size: height / 40,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 130),
                      Row(
                        children: [
                          SizedBox(width: width / 20),
                          Text(
                            EnString.price,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 42,
                                    fontFamily: poppinsMedium,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: height / 50),
                        ],
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                '\$${_setText(_startValue).value}',
                                textAlign: TextAlign.end,
                                style:
                                    const TextStyle(fontWeight: FontWeight.w500),
                              )),
                              Text(
                                '\$${_setText(_endValue).value}',
                                textAlign: TextAlign.end,
                                style:
                                    const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 0.5,
                          ),
                          child: RangeSlider(
                            activeColor: AppColors.blackColor,
                            inactiveColor: AppColors.blackColor.withOpacity(0.7),
                            values: _mensJeansController.currentRangeValues,
                            max: 5000,
                            divisions: 100,
                            min: 0,
                            labels: RangeLabels(
                              _startValue.value = _mensJeansController
                                  .currentRangeValues.start
                                  .round()
                                  .toString(),
                              _endValue.value = _mensJeansController
                                  .currentRangeValues.end
                                  .round()
                                  .toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _mensJeansController.currentRangeValues = values;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              height: height / 15,
                              width: width / 2.4,
                              decoration: BoxDecoration(
                                color: const Color(0xffE7E7E7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  EnString.reset,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          fontSize: height / 50,
                                          fontFamily: poppinsMedium),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width / 35),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoute.productdetails);
                            },
                            child: Container(
                              height: height / 15,
                              width: width / 2.4,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  EnString.apply,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize: height / 50,
                                          fontFamily: poppinsMedium),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 8)
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  final RxInt _value = 1.obs;
  List<String> title = [
    EnString.popularity,
    EnString.newProduct,
    EnString.priceLowToHigh,
    EnString.priceHighToLow,
  ];

  Future shortby(context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.appBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Column(
                  children: [
                    SizedBox(height: height / 150),
                    Center(
                      child: Container(
                        height: height / 200,
                        width: width / 4,
                        decoration: BoxDecoration(
                          color: AppColors.indicatorGreyColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 70),
                    Text(
                      EnString.sortBy,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.blackColor,
                          fontSize: height / 40,
                          fontFamily: poppinsMedium,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: height / 60),
                    Divider(color: AppColors.dividerColor, thickness: 2),
                    Obx(
                      () => Column(
                        children: <Widget>[
                          for (int i = 0; i < title.length; i++)
                            ListTile(
                              title: Text(
                                title[i],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: height / 48,
                                        fontFamily: poppinsMedium,
                                        fontWeight: FontWeight.w500),
                              ),
                              trailing: Radio<int>(
                                value: i,
                                groupValue: _value.value,
                                activeColor: AppColors.lightBlueColor,
                                onChanged: (int? value) {
                                  _value.value = value!;
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: height / 30),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  RxString _setText(val) {
    if (val == 20) {
      return val;
    }
    return val;
  }
}
