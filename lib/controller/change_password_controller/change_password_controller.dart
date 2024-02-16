import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  Rx<TextEditingController> currentPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<TextEditingController> confirmPassword = TextEditingController().obs;
}
