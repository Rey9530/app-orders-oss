import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/fontfamily.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/search/search_controller.dart';


// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchText = TextEditingController(text: EnString.jeansText);
  SearchTextController searchTextController = Get.put(SearchTextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height / 19),
          _searchField(),
          _allSearchText(),
        ],
      ),
    ));
  }

  Widget _searchField() {
    return Center(
      child: Container(
        color: Colors.transparent,
        width: kIsWeb ? width / 3.5 : width / 1.1,
        child: TextField(
          cursorColor: AppColors.indicatorGreyColor,
          autofocus: true,
          controller: searchText,
          style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontFamily: poppinsMedium),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.searchFieldColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            hintText: EnString.jeansText,
            hintStyle: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
                fontFamily: poppinsMedium),
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset(IconImage.search, scale: 3.0)),
            suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.close,
                  color: AppColors.indicatorGreyColor,
                  size: 22,
                )),
          ),
        ),
      ),
    );
  }

  Widget _allSearchText() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: searchTextController.searchText.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: width / 17, right: width / 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchTextController.searchText[index],
                  style: TextStyle(
                      color: AppColors.indicatorGreyColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: poppinsMedium,
                      fontSize: 16),
                ),
                SizedBox(
                  height: width / 10,
                ),
                Icon(
                  Icons.close,
                  color: AppColors.indicatorGreyColor,
                  size: 22,
                ),
              ],
            ),
          );
        });
  }
}
