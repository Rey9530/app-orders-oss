import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  RxBool isValidFName = false.obs;
  RxBool isValidLName = false.obs;
  RxBool isValidEmail = false.obs;
  RxBool isValidPhoneNumber = false.obs;
  RxBool isValidPassword = false.obs;
  RxBool isValidConfirmPassword = false.obs;

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

// ============== First Name ===============

  setFnameValidation(bool value) {
    isValidFName.value = value;
  }

// ============== Last Name ===============

  setLnameValidation(bool value) {
    isValidLName.value = value;
  }

  // ============== Email ===============

  setEmailValidation(bool value) {
    isValidEmail.value = value;
  }

  // ============== Phone Number ===============

  setphonenumberValidation(bool value) {
    isValidPhoneNumber.value = value;
  }

// ============== Password ===============

  setPasswordValidation(bool value) {
    isValidPassword.value = value;
  }

// ============== Confirm Password ===============

  setconfirmPasswordValidation(bool value) {
    isValidConfirmPassword.value = value;
  }
}
