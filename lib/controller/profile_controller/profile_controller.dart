import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../base_controlle.dart';

class ProfileController extends GetxController {
  final BaseController _api = BaseController();
  GetStorage box = GetStorage();
  RxBool isValidFirst = false.obs;
  RxBool isValidEmail = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    firstname.text = box.read("nombre");
    email.text = box.read("email");
  }

  setFirstValidation(bool value) {
    isValidFirst.value = value;
  }

  setEmailValidation(bool value) {
    isValidEmail.value = value;
  }

  TextEditingController firstname = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");

  updateProfile() async {
    loading.value = true;
    var data = {"email": email.text, "nombre": firstname.text};
    var resp = await _api.putData("api/account", data);
    loading.value = false;
    if (resp.isOk) {
      Get.snackbar(
        "Exito",
        "Datos actualizados exitosamente",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      box.write('nombre', firstname.text);
      box.write('email', email.text);
    } else {
      Get.snackbar(
        "Error",
        "Credenciales incorrectas",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    return resp.isOk;
  }
}
