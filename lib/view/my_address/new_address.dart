import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons.dart';
import '../../../../components/common_textfield.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../components/validation/validation.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../../../utils/sizeconfig/sizeconfig.dart';
import '../../controller/add_new_address_controller/add_new_address_controller.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({Key? key}) : super(key: key);

  final AddNewAddressController _addNewAddressController =
      Get.put(AddNewAddressController());
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.addAddress,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Form(
            key: _form,
            child: Column(
              children: [
                // DropDownDemo(
                //   data: _addNewAddressController.items,
                //   hint: 'Office/Home',
                // ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: EnString.name,
                    controller: _addNewAddressController.name,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: "Please Enter First Name");
                    },
                    onchange: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: EnString.houseNo,
                    controller: _addNewAddressController.houseno,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: "Please Enter ${EnString.houseNo}");
                    },
                    onchange: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: EnString.streetName,
                    controller: _addNewAddressController.streetname,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: "Please Enter ${EnString.streetName}");
                    },
                    onchange: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: EnString.pinCode,
                    controller: _addNewAddressController.pincode,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: "Please Enter ${EnString.pinCode}");
                    },
                    onchange: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: EnString.townCity,
                    controller: _addNewAddressController.towncity,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: "Please Enter ${EnString.townCity}");
                    },
                    onchange: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                // DropDownDemo(
                //   data: _addNewAddressController.countryitems,
                //   hint: 'Country',
                // ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: EnString.mobileNumber,
                    controller: _addNewAddressController.mobileno,
                    validator: (value) {
                      return Validation.phonenumbervalidation(value);
                    },
                    onchange: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kIsWeb ? width / 2.7 : width / 30,
                      right: kIsWeb ? width / 2.7 : width / 30),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                            thumbColor: _addNewAddressController.on.value
                                ? AppColors.lightBlueColor
                                : AppColors.whiteColor,
                            activeColor:
                                AppColors.lightBlueColor.withOpacity(0.3),
                            onChanged: (val) =>
                                _addNewAddressController.toggle(),
                            value: _addNewAddressController.on.value),
                      ),
                      const SizedBox(),
                      Text(
                        EnString.setAsDefualt,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: poppinsRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 55,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.kPadding12),
                  child: Buttons(
                    btnText: EnString.save,
                    buttonColor: AppColors.lightBlueColor,
                    onTap: () {
                      if (_form.currentState!.validate()) {
                        Get.back();
                      } else {}
                    },
                  ),
                ),
                SizedBox(
                  height: height / 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
