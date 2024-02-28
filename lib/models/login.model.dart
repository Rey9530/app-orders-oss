class LoginModel {
  final int code;
  final String message;
  final Usuario data;

  LoginModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: Usuario.fromJson(json["data"]),
      );
}

class Usuario {
  final String token;
  final int expires;

  Usuario({
    required this.token,
    required this.expires,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        token: json["token"],
        expires: json["expires"],
      );
}
