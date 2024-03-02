import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../config/colors/colors.dart';
import '../../models/models.dart';
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
    getDepartaments();
  }

  setFirstValidation(bool value) {
    isValidFirst.value = value;
  }

  setEmailValidation(bool value) {
    isValidEmail.value = value;
  }

  TextEditingController firstname = TextEditingController(text: "");
  TextEditingController negocio = TextEditingController(text: "");
  TextEditingController address = TextEditingController(text: "");
  TextEditingController dui = TextEditingController(text: "");
  TextEditingController nit = TextEditingController(text: "");
  TextEditingController nrc = TextEditingController(text: "");
  TextEditingController giro = TextEditingController(text: "");
  TextEditingController telefono1 = TextEditingController(text: "");
  TextEditingController telefono2 = TextEditingController(text: "");
  TextEditingController fechaNamimiento = TextEditingController(text: "");
  TextEditingController diasCredito = TextEditingController(text: "0");
  TextEditingController limiteCredito = TextEditingController(text: "0");
  TextEditingController email = TextEditingController(text: "");
  String? departamento;
  String? municipio;

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

  List<Departament> departamentos = [];
  getDepartaments() async {
    loading.value = true;
    var data = {"page": 1, "page_size": 50, "sort": "ASC"};
    var resp = await _api.postData("api/departamentoMH/index", data);
    if (resp.isOk) {
      departamentos = DepartamentsResp.fromJson(resp.body).data.records;
    }
    loading.value = false;
    return resp.isOk;
  }

  List<Municipio> municipalities = [];
  getMunicipalities(id) async {
    loading.value = true;
    var resp = await _api.getData("api/departamentoMH/$id/municipios");
    if (resp.isOk) {
      municipalities = MunicipalitiesResp.fromJson(resp.body).data.municipios;
    }
    loading.value = false;
    return resp.isOk;
  }

  List<GiroItem> giros = [];
  GiroItem giroSelected =
      GiroItem(id: 00, codigo: 00, descripcion: 'Seleccione');
  Future<List<GiroItem>> getGiros(String value) async {
    if (value.isEmpty) return [];
    loading.value = true;
    var data = {
      "page": 1,
      "page_size": 20,
      "sort": "ASC",
      "search": {"term": value}
    };
    var resp = await _api.postData("api/giroMH/index", data);
    if (resp.isOk) {
      giros = GirosResponse.fromJson(resp.body).data.records;
      giros = [giroSelected, ...giros];
    } else {
      giros = [];
    }
    loading.value = false;
    return giros;
  }

  saveCustomer() async {
    loading.value = true;
    var fechaNacimiento = '';
    var fechaArray = fechaNamimiento.text.split("-");
    if (fechaArray.length == 3) {
      fechaNacimiento = "${fechaArray[2]}-${fechaArray[1]}-${fechaArray[0]}";
    }
    var data = {
      "id_sucursal": box.read('id_sucursal'),
      "categoria": giroSelected.id,
      "nombre": firstname.text,
      "negocio": negocio.text,
      "direccion": address.text,
      "municipio": int.parse(municipio ?? "0"),
      "depto": int.parse(departamento ?? "0"),
      "pais": null,
      "dui": dui.text,
      "nit": nit.text,
      "nrc": nrc.text.toString(),
      "giro": giroSelected.descripcion,
      "telefono1": telefono1.text,
      "telefono2": telefono2.text,
      "codcliente": "1",
      "email": email.text,
      "ultventa": "0000-00-00",
      "acumulado": 1,
      "saldo": 2,
      "percibe": 0,
      "retiene": 0,
      "retiene10": 0,
      "inactivo": 0,
      "latitud": 0,
      "longitud": 0,
      "fecha_nac": fechaNacimiento,
      "id_vendedor": box.read('id_empleado'),
      "dias_credito": int.tryParse(diasCredito.text),
      "limite_credito": int.tryParse(limiteCredito.text),
      "consumo_interno": 100,
      "cod_act_eco": "NINGUNO"
    };
    var resp = await _api.postData("api/cliente", data);
    if (resp.isOk) {
      Get.back();
      Get.defaultDialog(
        title: "Exito",
        content: Lottie.asset('assets/lottie/success-animation.json'),
        backgroundColor: Colors.white,
        textConfirm: "Ok",
        onConfirm: () {
          Get.back();
        },
        buttonColor: AppColors.lightBlueColor,
      );
    } else {
      Get.snackbar(
        "Error",
        "Ha ocurrido un error, favor reintente nuevamente",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    }
    loading.value = false;
    return resp.isOk;
  }
}
