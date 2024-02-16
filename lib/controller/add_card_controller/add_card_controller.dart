import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardController extends GetxController {
  RxBool checkValue = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cvvCode = TextEditingController();
}
