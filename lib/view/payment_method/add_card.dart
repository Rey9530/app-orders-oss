import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons.dart';
import '../../../../components/common_textfield.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';
import '../../controller/add_card_controller/add_card_controller.dart';

class AddCard extends StatelessWidget {
  AddCard({Key? key}) : super(key: key);

  final AddCardController _addCardController = Get.put(AddCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.addNewCard,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.kPadding20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: kIsWeb ? width / 5.5 : width / 2),
                    child: Text(
                      EnString.nameOnCard,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.blackColor,
                          fontSize: height / 50,
                          fontWeight: FontWeight.w600,
                          fontFamily: poppinsMedium),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.kPadding8),
                    child: CommonTextfield(
                      obscuretext: false,
                      hinttext: '',
                      controller: _addCardController.name,
                      validator: (value) {
                        return null;
                      },
                      onchange: (value) {
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.kPadding12,
                        right: kIsWeb ? width / 5.3 : width / 1.8),
                    child: Text(
                      EnString.cardNumber,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.blackColor,
                            fontSize: height / 50,
                            fontWeight: FontWeight.w600,
                            fontFamily: poppinsMedium,
                          ),
                    ),
                  ),
                  _cardTextField(),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.kPadding12),
                    child: Container(
                      color: Colors.transparent,
                      width: kIsWeb ? width / 4 : width / 1.1,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width / 88),
                                child: Text(
                                  EnString.expiryDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: AppColors.blackColor,
                                          fontSize: height / 50,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: poppinsMedium),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width / 88),
                                child: _smallTextField(
                                  hinttext: 'MM/YY',
                                  controller: _addCardController.expiryDate,
                                  validator: (value) {
                                    return null;
                                  },
                                  onchange: (value) {
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                EnString.cvvCode,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: height / 50,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: poppinsMedium),
                              ),
                              _smallTextField(
                                hinttext: '',
                                controller: _addCardController.cvvCode,
                                validator: (value) {
                                  return null;
                                },
                                onchange: (value) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 50),
            Obx(
              () => Padding(
                padding: EdgeInsets.only(left: SizeConfig.kPadding12),
                child: Center(
                  child: Container(
                    color: Colors.transparent,
                    width: kIsWeb ? width / 3.8 : width / 1,
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.lightBlueColor,
                          checkColor: AppColors.whiteColor,
                          value: _addCardController.checkValue.value,
                          onChanged: (bool? value) {
                            _addCardController.checkValue.value =
                                !_addCardController.checkValue.value;
                          },
                        ),
                        Text(
                          EnString.saveThisCard,
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: poppinsMedium,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.kPadding60),
              child: Buttons(
                btnText: EnString.addCard,
                buttonColor: AppColors.lightBlueColor,
                onTap: () {
                    Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _smallTextField({validator, controller, hinttext, onchange}) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.kPadding8),
      child: Container(
        color: Colors.transparent,
        width: kIsWeb ? width / 8.5 : width / 2.5,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: controller,
          style: TextStyle(
              color: AppColors.blackColor, fontFamily: poppinsRegular),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            counterText: '',
            hintText: hinttext,
            hintStyle: TextStyle(
                color: AppColors.indicatorGreyColor,
                fontFamily: poppinsRegular),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            filled: true,
            isDense: true,
            fillColor: AppColors.lightGreyFilledColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                  color: AppColors.indicatorGreyColor.withOpacity(0.7),
                  width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.lightBlueColor, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
          ),
          onChanged: onchange,
        ),
      ),
    );
  }

  Widget _cardTextField() {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.kPadding8),
      child: Container(
        color: Colors.transparent,
        width: kIsWeb ? width / 4 : width / 1.13,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            return null;
          },
          controller: _addCardController.cardNumber,
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: height / 50,
              fontFamily: poppinsRegular),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.kPadding12,left: SizeConfig.kPadding12
              ),
              child: Image.asset(IconImage.visa,
                  height: SizeConfig.kPadding8, width: SizeConfig.kPadding12),
            ),
            counterText: '',
            hintText: "",
            hintStyle: TextStyle(
                color: AppColors.indicatorGreyColor,
                fontSize: height / 50,
                fontWeight: FontWeight.w400,
                fontFamily: poppinsRegular),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            filled: true,
            isDense: true,
            fillColor: AppColors.lightGreyFilledColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                  color: AppColors.indicatorGreyColor.withOpacity(0.7),
                  width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.lightBlueColor, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
