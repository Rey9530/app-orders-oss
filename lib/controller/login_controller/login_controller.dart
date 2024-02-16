import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isValidEmail = false.obs;
  RxBool isValidPassword = false.obs;

  setEmailValidation(bool value) {
    isValidEmail.value = value;
  }

  setPasswordValidation(bool value) {
    isValidPassword.value = value;
  }
}
