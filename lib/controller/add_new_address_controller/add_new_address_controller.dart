import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAddressController extends GetxController {
  RxString dropdownValue = 'Office'.obs;
  RxString dropdownCountryValue = 'India'.obs;

  var items = [
    'Office',
    'Home',
  ];

  RxBool on = false.obs; // our observable

  void toggle() => on.value = on.value ? false : true;

  var countryitems = [
    'India',
    'Canada',
    'Australia',
    'Afghanistan',
    'Brazil',
    'Indonesia',
    'Mexico',
  ];

  TextEditingController name = TextEditingController();
  TextEditingController houseno = TextEditingController();
  TextEditingController streetname = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController towncity = TextEditingController();
  TextEditingController mobileno = TextEditingController();
}
