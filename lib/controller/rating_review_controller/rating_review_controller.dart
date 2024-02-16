import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingReviewController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }
}
