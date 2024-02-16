import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons.dart';
import '../../../../components/common_textfield.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../components/validation/validation.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../controller/change_password_controller/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final ChangePasswordController _changePasswordController = Get.put(ChangePasswordController());
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        title: EnString.changePassword,
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: height / 50),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kIsWeb ? 0 : width / 20),
                      child: Center(
                        child: CommonTextfield(
                          obscuretext: false,
                          hinttext: 'Current Password',
                          controller:
                          _changePasswordController.currentPassword.value,
                          validator: (value) {
                            return Validation.normalvalidation(
                                value: value,
                                errortext: 'Please enter current password');
                          },
                          onchange: (value) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kIsWeb ? 0 : width / 20),
                      child: Center(
                        child: CommonTextfield(
                          obscuretext: false,
                          hinttext: 'New password',
                          controller:
                          _changePasswordController.newPassword.value,
                          validator: (value) {
                            return Validation.normalvalidation(
                                value: value,
                                errortext: 'Please enter New password');
                          },
                          onchange: (value) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height / 50),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kIsWeb ? 0 : width / 20),
                      child: CommonTextfield(
                        obscuretext: false,
                        hinttext: 'Confirm Password',
                        controller:
                        _changePasswordController.confirmPassword.value,
                        validator: (value) {
                          if (value == null) {
                            return 'Please Enter new password';
                          } else if (value !=
                              _changePasswordController.newPassword.value.text) {
                            return 'Please Enter currect password';
                          }
                          return null;
                        },
                        onchange: (value) {
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: height / 12,
                    ),
                  ],
                ),
                Buttons(
                  btnText: EnString.saveChange,
                  buttonColor: AppColors.lightBlueColor,
                  onTap: () {
                    if (_form.currentState!.validate()) {
                      Get.back();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
