import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  RxBool isValidPassword = false.obs;
  RxBool isConfirmPassword = false.obs;

  RxBool isObscure = true.obs;
  RxBool isObscureTwo = true.obs;

  newPasswordValidation(bool value) {
    isValidPassword.value = value;
  }

  confirmPasswordValidation(bool value) {
    isConfirmPassword.value = value;
  }
}
