import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/buttons.dart';
import '../../components/common_textfield.dart';
import '../../components/password_textfield.dart';
import '../../components/validation/validation.dart';
import '../../config/approutes/approutes.dart';
import '../../config/colors/colors.dart';
import '../../config/enstring/enstring.dart';
import '../../config/fontfamily.dart';
import '../../config/images/images.dart';
import '../../config/mediaquery/mediaquery.dart';
import '../../controller/login_controller/login_controller.dart';
import '../../controller/textfild_controller/textfild_controller.dart';
import '../../utils/sizeconfig/sizeconfig.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();

  final LoginController _loginController = Get.put(LoginController());
  final TextFieldController _textFieldController =
      Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.appBgColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.kPadding100),
                    Center(
                      child: Image(
                        image: const AssetImage(
                          AppImage.logosmall,
                        ),
                        height: SizeConfig.kPadding75,
                      ),
                    ),
                    SizedBox(height: SizeConfig.kPadding30),
                    Text(
                      EnString.loginAccount,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: height / 35,
                              fontWeight: FontWeight.w600,
                              fontFamily: poppinsMedium),
                    ),
                    SizedBox(height: SizeConfig.kPadding15),
                    Text(
                      EnString.enterYourDetails,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: AppColors.indicatorGreyColor,
                              fontSize: height / 55,
                              fontWeight: FontWeight.w400,
                              fontFamily: poppinsRegular),
                    ),
                    SizedBox(height: height / 30),
                    CommonTextfield(
                      obscuretext: false,
                      hinttext: 'Email',
                      controller: _loginController.email,
                      validator: (value) {
                        return Validation.emailvalidation(
                            value: value,
                            errortext: "Ingresa un correo electrónico válido");
                      },
                      onchange: (value) {
                        String? val = Validation.emailvalidation(
                            value: value,
                            errortext: "Ingresa un correo electrónico válido");
                        if (val == null) {
                          _loginController.setEmailValidation(true);
                        } else {
                          _loginController.setEmailValidation(false);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height / 50),
                    PasswordTextField(
                      onTap: () {
                        _textFieldController.isObscureThree.value =
                            !_textFieldController.isObscureThree.value;
                      },
                      obscureText: _textFieldController.isObscureThree.value,
                      hintText: 'Contraseña',
                      controller: _loginController.password,
                      validator: (value) {
                        return Validation.passwordvalidation(
                            value: value, errortext: "Ingresa una contraseña");
                      },
                      onchange: (value) {
                        String? val = Validation.passwordvalidation(
                            value: value, errortext: "Ingresa una contraseña");
                        if (val == null) {
                          _loginController.setPasswordValidation(true);
                        } else {
                          _loginController.setPasswordValidation(false);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height / 80),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.forgotpassword);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: kIsWeb ? 290 : width / 1.5),
                        child: Text(
                          EnString.forgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.lightBlueColor,
                                fontSize: height / 55,
                                fontWeight: FontWeight.w500,
                                fontFamily: poppinsMedium,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 25),
                    Buttons(
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          Get.toNamed(AppRoute.otpscreen);
                        } else {}
                      },
                      btnText: EnString.signIn,
                      buttonColor: _loginController.isValidEmail.value &&
                              _loginController.isValidPassword.value
                          ? AppColors.lightBlueColor
                          : AppColors.lightBlueColor.withOpacity(0.3),
                    ),
                    SizedBox(height: height / 20),
                    // // // Container(
                    // // //   color: Colors.transparent,
                    // // //   width: kIsWeb ? width / 4 : width / 1.1,
                    // // //   child: Row(
                    // // //     children: [
                    // // //       Expanded(
                    // // //         child: Divider(
                    // // //           color: AppColors.indicatorGreyColor,
                    // // //           height: 36,
                    // // //         ),
                    // // //       ),
                    // // //       SizedBox(width: width / 80),
                    // // //       Text(
                    // // //         EnString.continueWith,
                    // // //         style: Theme.of(context)
                    // // //             .textTheme
                    // // //             .headlineSmall
                    // // //             ?.copyWith(
                    // // //                 color: AppColors.blackColor,
                    // // //                 fontSize: height / 55,
                    // // //                 fontWeight: FontWeight.w500,
                    // // //                 fontFamily: poppinsMedium),
                    // // //       ),
                    // // //       SizedBox(width: width / 80),
                    // // //       Expanded(
                    // // //         child: Divider(
                    // // //           color: AppColors.indicatorGreyColor,
                    // // //           height: 36,
                    // // //         ),
                    // // //       ),
                    // // //     ],
                    // // //   ),
                    // // // ),
                    // // SizedBox(height: height / 30),
                    // // Center(
                    // //   child: Row(
                    // //     mainAxisAlignment: MainAxisAlignment.center,
                    // //     children: [
                    // //       signInOthers(imgs: AppImage.google),
                    // //       SizedBox(width: width / 30),
                    // //       signInOthers(imgs: AppImage.apple),
                    // //     ],
                    // //   ),
                    // // ),
                    // SizedBox(height: height / 30),
                    // Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         EnString.doNotAccount,
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .headlineSmall
                    //             ?.copyWith(
                    //                 color: AppColors.indicatorGreyColor,
                    //                 fontSize: height / 55,
                    //                 fontWeight: FontWeight.w400,
                    //                 fontFamily: poppinsRegular),
                    //       ),
                    //       Padding(
                    //         padding:
                    //             EdgeInsets.symmetric(horizontal: width / 100),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Get.toNamed(AppRoute.createaccount);
                    //           },
                    //           child: Container(
                    //             color: Colors.transparent,
                    //             child: Text(
                    //               EnString.signup,
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .headlineSmall
                    //                   ?.copyWith(
                    //                       color: AppColors.lightBlueColor,
                    //                       fontSize: height / 55,
                    //                       fontWeight: FontWeight.w500,
                    //                       fontFamily: poppinsMedium),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: height / 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget signInOthers({String? imgs}) {
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
