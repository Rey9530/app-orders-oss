import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/buttons.dart';
import '../../components/common_textfield.dart';
import '../../components/customappbar/custom_appbar.dart';
import '../../components/password_textfield.dart';
import '../../components/validation/validation.dart';
import '../../config/approutes/approutes.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/fontfamily.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/create_account_controller/createaccount_controller.dart';
import '../../controller/textfild_controller/textfild_controller.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);

 final CreateAccountController _createAccountController =
      Get.put(CreateAccountController());
 final TextFieldController _textFieldController = Get.put(TextFieldController());

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: CustomAppBar(title: "", onPressed: (){
        Get.back();
      }),
        backgroundColor: AppColors.appBgColor,
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
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
                  EnString.createAccount,
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
                  EnString.signupAccount,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.indicatorGreyColor,
                      fontSize: height / 55,
                      fontWeight: FontWeight.w400,
                      fontFamily: poppinsRegular),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'First Name',
                    controller: _createAccountController.fname,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: "Please Enter First Name");
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                          value: value, errortext: "Please Enter First Name");
                      if (val == null) {
                        _createAccountController.setFnameValidation(true);
                      } else {
                        _createAccountController.setFnameValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Last Name',
                    controller: _createAccountController.lname,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: "Please Enter Last Name");
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                          value: value, errortext: "Please Enter Last Name");
                      if (val == null) {
                        _createAccountController.setLnameValidation(true);
                      } else {
                        _createAccountController.setLnameValidation(false);
                      }
                      return null;

                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Email',
                    controller: _createAccountController.email,
                    validator: (value) {
                      return Validation.emailvalidation(
                          value: value, errortext: "Please Enter Email");
                    },
                    onchange: (value) {
                      String? val = Validation.emailvalidation(
                          value: value, errortext: "Please Enter Email");
                      if (val == null) {
                        _createAccountController.setEmailValidation(true);
                      } else {
                        _createAccountController.setEmailValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: CommonTextfield(
                    keyboardType: TextInputType.number,
                    obscuretext: false,
                    hinttext: 'Phone Number',
                    controller: _createAccountController.phonenumber,
                    validator: (value) {
                      return Validation.phonenumbervalidation(value); 
                    },
                    onchange: (value) {
                      String? val = Validation.phonenumbervalidation(value);
                      if (val == null) {
                        _createAccountController.setphonenumberValidation(true);
                      } else {
                        _createAccountController.setphonenumberValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: PasswordTextField(
                    onTap: () {
                      _textFieldController.isObscure.value =
                          !_textFieldController.isObscure.value;
                    },
                    hintText: 'Password',
                    controller: _createAccountController.password,
                    validator: (value) {
                      return Validation.createpasswordvalidation(
                          value: value, errortext: "Please Enter Password");
                    },
                    onchange: (value) {
                      String? val = Validation.createpasswordvalidation(
                          value: value, errortext: "Please Enter Password");
                      if (val == null) {
                        _createAccountController.setPasswordValidation(true);
                      } else {
                        _createAccountController.setPasswordValidation(false);
                      }
                      return null;
                    },
                    obscureText: _textFieldController.isObscure.value,
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: PasswordTextField(
                    onTap: () {
                      _textFieldController.isObscureTwo.value =
                          !_textFieldController.isObscureTwo.value;
                    },
                    obscureText: _textFieldController.isObscureTwo.value,
                    hintText: 'Confirm Password',
                    controller: _createAccountController.confirmpassword,
                    validator: (value) {
                      return Validation.createconfirmpasswordvalidation(
                         value:  value,password:  _createAccountController.password,errortext: "Please Enter Confirm Password");
                    },
                    onchange: (value) {
                      String? val = Validation.createconfirmpasswordvalidation(
                          value:  value,password:  _createAccountController.password,errortext: "Please Enter Confirm Password");
                      if (val == null) {
                        _createAccountController
                            .setconfirmPasswordValidation(true);
                      } else {
                        _createAccountController
                            .setconfirmPasswordValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: height / 20),
                Buttons(
                  btnText: EnString.continues,
                  buttonColor: _createAccountController.isValidFName.value &&
                      _createAccountController.isValidLName.value &&
                      _createAccountController.isValidEmail.value &&
                      _createAccountController.isValidPhoneNumber.value &&
                      _createAccountController.isValidPassword.value &&
                      _createAccountController.isValidConfirmPassword.value
                      ? AppColors.lightBlueColor
                      : AppColors.lightBlueColor.withOpacity(0.3),
                  onTap: () {
                    if (_form.currentState!.validate()) {
                      Get.toNamed(AppRoute.otpscreen);
                    } else {}
                  },
                ),
                SizedBox(height: height / 20),
                Container(
                  color: Colors.transparent,
                  width: kIsWeb ? width / 4 : width / 1.1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.indicatorGreyColor,
                          height: 36,
                        ),
                      ),
                      SizedBox(width: width / 80),
                      Text(
                        EnString.continueWith,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.blackColor,
                            fontSize: height / 55,
                            fontWeight: FontWeight.w500,
                            fontFamily: poppinsMedium),
                      ),
                      SizedBox(width: width / 80),
                      Expanded(
                        child: Divider(
                          color: AppColors.indicatorGreyColor,
                          height: 36,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _signinothers(imgs: AppImage.google),
                      SizedBox(
                        width: width / 30,
                      ),
                      _signinothers(imgs: AppImage.apple),
                    ],
                  ),
                ),
                SizedBox(height: height / 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        EnString.alreadyAccount,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.indicatorGreyColor,
                            fontSize: height / 55,
                            fontWeight: FontWeight.w400,
                            fontFamily: poppinsRegular),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 100),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Text(
                              EnString.signIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: AppColors.lightBlueColor,
                                      fontSize: height / 55,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: poppinsRegular),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _signinothers({String? imgs}) {
    return Container(
      height: kIsWeb ? height / 12 : height / 13,
      width: kIsWeb ? width / 9.3 : width / 4,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: AppColors.indicatorGreyColor),
      ),
      child: Center(
        child: Image(
          image: AssetImage(
            imgs!,
          ),
          height: height / 30,
        ),
      ),
    );
  }
}
