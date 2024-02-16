import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customappbar/custom_appbar.dart';
import '../../../config/colors/colors.dart';
import '../../../config/enstring/enstring.dart';
import '../../../config/fontfamily.dart';
import '../../../config/mediaquery/mediaquery.dart';
import '../../../widget/rating_reviews_widget.dart';
import '../../controller/rating_review_controller/rating_review_controller.dart';

class RatingReviews extends StatelessWidget {
  RatingReviews({Key? key}) : super(key: key);

  final RatingReviewController ratingReviewController =
  Get.put(RatingReviewController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: AppColors.appBgColor,
          appBar: CustomAppBar(
            onPressed: () {
              Get.back();
            },
            title: EnString.ratingAndReviews,
            backgroundColor: AppColors.appBgColor,
          ),
          body: Column(
            children: [
              PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: Container(
                    height: height / 18,
                    color: Colors.transparent,
                    width: width,
                    child: TabBar(tabAlignment: TabAlignment.center,
                        dividerColor: Colors.transparent,
                        labelPadding: const EdgeInsets.only(left: 5, right: 5),
                        padding: EdgeInsets.only(left: width / 25,right:width / 20 ),
                        isScrollable: true,
                        unselectedLabelColor: AppColors.lightBlueColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.lightBlueColor,
                        ),
                        tabs: [
                          _tab("All"),
                          _tab("5"),
                          _tab("4"),
                          _tab("3"),
                          _tab("2"),
                          _tab("1"),
                        ]),
                  )),
              Expanded(
                child: TabBarView(children: [
                  RatingReviewsWidget(),
                  RatingReviewsWidget(),
                  RatingReviewsWidget(),
                  RatingReviewsWidget(),
                  RatingReviewsWidget(),
                  RatingReviewsWidget(),
                ]),
              ),
              SizedBox(height: height / 80),
              Text(
                EnString.viewAllReviews,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: height / 55, color: AppColors.lightBlueColor),
              ),
              SizedBox(height: height / 20),
            ],
          ),
        ));
  }

  Widget _tab(title) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.lightBlueColor, width: 2),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(width: width / 30),
              Icon(Icons.star, size: height / 40),
              SizedBox(width: width / 65),
              Text(
                title,
                style:
                    TextStyle(fontSize: height / 50, fontFamily: poppinsMedium),
              ),
              SizedBox(width: width / 30),
            ],
          ),
        ),
      ),
    );
  }
}
