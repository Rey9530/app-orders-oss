import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/approutes/approutes.dart';
import '../../models/user.model.dart';
import '../base_controlle.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();
  final BaseController _api = BaseController();
  @override
  void onInit() async {
    super.onInit();
    await loadProfileData();
  }

  loadProfileData() async {
    var resp = await _api.getData("api/account");
    if (resp.isOk) {
      final user = UserModel.fromJson(resp.body).data;
      box.write('id_usuario', user.idUsuario);
      box.write('id_sucursal', user.idSucursal);
      box.write('id_empleado', user.idEmpleado);
      box.write('nombre', user.nombre);
      box.write('usuario', user.usuario);
      box.write('admin', user.admin);
      box.write('precios', user.precios);
      box.write('latitud_ultima', user.latitudUltima);
      box.write('longitud_ultima', user.longitudUltima);
      box.write('fecha_tracking', user.fechaTracking);
      box.write('hora_tracking', user.horaTracking);
      box.write('email', user.email);
    } else {
      box.erase();
    }
    Get.offAllNamed(resp.isOk ? AppRoute.bottomBar : AppRoute.loginscreen);
  }
}
