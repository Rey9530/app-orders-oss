import 'dart:async';

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
import '../../config/approutes/approutes.dart';
import '../../controller/customer_controller/customer_controller.dart';

// ignore: must_be_immutable
class CustumerView extends StatefulWidget {
  bool isBackButtonShow;
  CustumerView({
    super.key,
    required this.isBackButtonShow,
  });

  @override
  State<CustumerView> createState() => _CustumerViewState();
}

class _CustumerViewState extends State<CustumerView> {
  final CustomerController _myCartController = Get.put(CustomerController());
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      // Aquí va la lógica que quieres ejecutar después del debounce
      // Por ejemplo, una llamada a una API de búsqueda
      print("Ejecutando búsqueda: $query");
      _myCartController.customers.clear();
      _myCartController.pagination = null;
      await _myCartController.getcustomers(query);
    });
  }

  void _onScroll() {
    double porcentaje = _scrollController.position.maxScrollExtent * 0.1;
    double valorEvaluar =
        _scrollController.position.maxScrollExtent - porcentaje;
    if (_scrollController.position.pixels > valorEvaluar) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() async {
    await _myCartController.getcustomers(null);
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

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
              onTap: !widget.isBackButtonShow
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
                    color: widget.isBackButtonShow
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
          child: Obx(
            () => Column(
              children: [
                Center(
                  child: Container(
                    color: Colors.transparent,
                    width: kIsWeb ? width / 3.5 : width / 1.1,
                    child: TextField(
                      controller: _controller,
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.searchFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: EnString.search,
                        prefixIcon: Image.asset(IconImage.search, scale: 2.7),
                      ),
                    ),
                  ),
                ),
                carts(),
                if (_myCartController.loading.value)
                  const CircularProgressIndicator(),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.lightBlueColor.withOpacity(0.50),
          onPressed: () => Get.toNamed(AppRoute.addcustomerscreen),
          child: const Icon(
            Icons.add,
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
          controller: _scrollController,
          shrinkWrap: false,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: height / 200),
          itemCount: _myCartController.customers.length,
          itemBuilder: (context, index) {
            var element = _myCartController.customers[index];
            return Padding(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        element.nombre,
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
                                            element.negocio,
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
                                            element.telefono1,
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
            );
          },
        ),
      ),
    );
  }
}
