import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/images/images.dart';
import 'completed.dart';
import 'ongoing.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: EnString.myOrders,
          action: [
            Padding(
              padding: const EdgeInsets.all(17),
              child: Image.asset(IconImage.search, color: AppColors.blackColor),
            ),
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
                controller: tabController,
                labelStyle: TextStyle(
                    color: AppColors.lightBlueColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                labelColor: AppColors.lightBlueColor,
                unselectedLabelColor: AppColors.indicatorGreyColor,
                indicatorColor: AppColors.lightBlueColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                tabs: const [
                  Tab(
                    text: "On Going",
                  ),
                  Tab(
                    text: "Completed",
                  )
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Ongoing(),
                Completed(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
