class UserModel {
  final int code;
  final String message;
  final UserData data;

  UserModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );
}

class UserData {
  final int idUsuario;
  final int idSucursal;
  final int idEmpleado;
  final String nombre;
  final String usuario;
  final int admin;
  final int precios;
  final int latitudUltima;
  final int longitudUltima;
  final String fechaTracking;
  final String horaTracking;
  final String email;

  UserData({
    required this.idUsuario,
    required this.idSucursal,
    required this.idEmpleado,
    required this.nombre,
    required this.usuario,
    required this.admin,
    required this.precios,
    required this.latitudUltima,
    required this.longitudUltima,
    required this.fechaTracking,
    required this.horaTracking,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        idUsuario: json["id_usuario"],
        idSucursal: json["id_sucursal"],
        idEmpleado: json["id_empleado"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        admin: json["admin"],
        precios: json["precios"],
        latitudUltima: json["latitud_ultima"],
        longitudUltima: json["longitud_ultima"],
        fechaTracking: json["fecha_tracking"],
        horaTracking: json["hora_tracking"],
        email: json["email"],
      );
}
