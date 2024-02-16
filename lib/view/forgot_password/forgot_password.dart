
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/buttons.dart';
import '../../components/customappbar/custom_appbar.dart';
import '../../components/password_textfield.dart';
import '../../components/validation/validation.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/fontfamily.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/forgot_password_controller/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

 final TextEditingController _newPassword = TextEditingController();
 final TextEditingController _confirmPassword = TextEditingController();
 final ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: CustomAppBar(
        onPressed: (){
          Get.back();
        },
        backgroundColor: AppColors.appBgColor,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Form(
                key: _form,
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 50,
                    ),
                    Center(
                      child: Image(
                        image: const AssetImage(
                          AppImage.logosmall,
                        ),
                        height: height / 7,
                        width: width / 7,
                      ),
                    ),
                    SizedBox(
                      height: height / 70,
                    ),
                    Text(
                      EnString.setNewPassword,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.blackColor,
                          fontSize: height / 35,
                          fontWeight: FontWeight.w600,
                          fontFamily: poppinsMedium),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Text(
                      EnString.enterPassword,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.indicatorGreyColor,
                          fontSize: height / 55,
                          fontWeight: FontWeight.w400,
                          fontFamily: poppinsRegular),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: PasswordTextField(
                        onTap: () {
                          _forgotPasswordController.isObscure.value =
                          !_forgotPasswordController.isObscure.value;
                        },
                        hintText: 'New password',
                        controller: _newPassword,
                        validator: (value) {
                          return Validation.passwordvalidation(value: value,errortext: "Please Enter New Password");
                        },
                        onchange: (value) {
                          String? val = Validation.passwordvalidation(value: value,errortext: "Please Enter New Password");
                          if (val == null) {
                            _forgotPasswordController.newPasswordValidation(true);
                          } else {
                            _forgotPasswordController.newPasswordValidation(false);
                          }
                          return null;
                        },
                        obscureText: _forgotPasswordController.isObscure.value,
                      ),

                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                   child:  PasswordTextField(
                     onTap: () {
                       _forgotPasswordController.isObscureTwo.value =
                       !_forgotPasswordController.isObscureTwo.value;
                     },
                     hintText: 'Confirm password',
                     controller: _confirmPassword,
                     validator: (value) {
                       return Validation.passwordvalidation(value: value,errortext: "Please Enter Confirm Password");
                     },
                     onchange: (value) {
                       String? val = Validation.passwordvalidation(value: value,errortext: "Please Enter New Password");
                       if (val == null) {
                         _forgotPasswordController
                             .confirmPasswordValidation(true);
                       } else {
                         _forgotPasswordController
                             .confirmPasswordValidation(false);
                       }
                       return null;
                     },
                     obscureText: _forgotPasswordController.isObscureTwo.value,
                   ),

                    ),
                    SizedBox(
                      height: height / 4,
                    ),
                    Buttons(
                      btnText: EnString.saveChange,
                      buttonColor: _forgotPasswordController
                                  .isValidPassword.value &&
                          _forgotPasswordController.isConfirmPassword.value
                          ? AppColors.lightBlueColor
                          : AppColors.lightBlueColor.withOpacity(0.3),
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          Get.back();
                        } else {}
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
