class MunicipalitiesResp {
  final int code;
  final String message;
  final Municipios data;

  MunicipalitiesResp({
    required this.code,
    required this.message,
    required this.data,
  });

  factory MunicipalitiesResp.fromJson(Map<String, dynamic> json) =>
      MunicipalitiesResp(
        code: json["code"],
        message: json["message"],
        data: Municipios.fromJson(json["data"]),
      );
}

class Municipios {
  final String departamento;
  final List<Municipio> municipios;

  Municipios({
    required this.departamento,
    required this.municipios,
  });

  factory Municipios.fromJson(Map<String, dynamic> json) => Municipios(
        departamento: json["departamento"],
        municipios: List<Municipio>.from(
            json["municipios"].map((x) => Municipio.fromJson(x))),
      );
}

class Municipio {
  final int id;
  final int codigo;
  final String nombre;
  final int idDepartamento;

  Municipio({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.idDepartamento,
  });

  factory Municipio.fromJson(Map<String, dynamic> json) => Municipio(
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        idDepartamento: json["id_departamento"],
      );
}
