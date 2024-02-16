import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/delivery_address/delivery_address_controller.dart';

import '../../../../components/buttons.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/approutes/approutes.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';

// ignore: must_be_immutable
class DeliveryAddress extends StatelessWidget {
   DeliveryAddress({Key? key}) : super(key: key);

  DeliveryAddressController deliveryAddressController = Get.put(DeliveryAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.deliveryAddress,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _officeaddress(context, IconImage.office, EnString.office, 0),
              _officeaddress(context, IconImage.homes, EnString.home, 1),
              Padding(
                padding: EdgeInsets.only(top: height / 14),
                child: Buttons(
                  btnText: EnString.addNewAddress,
                  buttonColor: AppColors.lightBlueColor,
                  onTap: () {
                    Get.toNamed(AppRoute.addnewaddress);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _officeaddress(context, String imgs, String title, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 50),
      child: GestureDetector(
        onTap: (){
          deliveryAddressController.isSelect.value = index;
        },
        child: Obx(
            ()=> Container(
            padding: const EdgeInsets.only(bottom: 5),
            width: kIsWeb ? 400 : width / 1.1,
            decoration: BoxDecoration(
                border:
                deliveryAddressController.isSelect.value == index ? Border.all(color: AppColors.lightBlueColor) : null,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.indicatorGreyColor.withOpacity(0.3),
                    blurRadius: 4.0,
                  ),
                ],
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.kPadding20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    children: [
                      Container(
                        height: height / 18,
                        width: kIsWeb ? width / 30 : width / 10,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lightBlueColor.withOpacity(0.5),
                              blurRadius: 6.0,
                            ),
                          ],
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(height / 90),
                            child: Image.asset(
                              imgs,
                              color: AppColors.lightBlueColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width / 40),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.blackColor,
                            fontSize: height / 47,
                            fontWeight: FontWeight.w500,
                            fontFamily: poppinsMedium),
                      ),
                      const Spacer(),
                      Text(
                        EnString.edit,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.indicatorGreyColor,
                            fontSize: height / 50,
                            fontWeight: FontWeight.w500,
                            fontFamily: poppinsRegular),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 45,
                  ),
                  Text(
                    EnString.estherHoward,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: height / 47,
                        fontWeight: FontWeight.w500,
                        fontFamily: poppinsRegular),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Text(
                    EnString.santaAna,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.indicatorGreyColor,
                        fontSize: height / 50,
                        fontWeight: FontWeight.w400,
                        fontFamily: poppinsRegular),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
