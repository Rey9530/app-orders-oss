import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/approutes/approutes.dart';
import '../../models/models.dart';
import '../base_controlle.dart';
import '../splash_controller/splash_controller.dart';

class LoginController extends GetxController {
  final BaseController _api = BaseController();
  final SplashController splash = SplashController();
  final box = GetStorage();

  // LoginController(this._api);

  TextEditingController email = TextEditingController(text: 'admin@gmail.com');
  TextEditingController password = TextEditingController(text: "admin\$");

  RxBool isValidEmail = false.obs;
  RxBool loading = false.obs;
  RxBool isValidPassword = false.obs;

  setEmailValidation(bool value) {
    isValidEmail.value = value;
  }

  setPasswordValidation(bool value) {
    isValidPassword.value = value;
  }

  login() async {
    loading.value = true;
    var data = {"email": email.text, "password": password.text};
    var resp = await _api.postData("api/token", data);
    loading.value = false;
    if (resp.isOk) {
      final user = LoginModel.fromJson(resp.body).data;
      box.write('token', user.token);
      await splash.loadProfileData();
      Get.toNamed(AppRoute.bottomBar);
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
