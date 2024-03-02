class DepartamentsResp {
  final int code;
  final String message;
  final DataResponse data;

  DepartamentsResp({
    required this.code,
    required this.message,
    required this.data,
  });

  factory DepartamentsResp.fromJson(Map<String, dynamic> json) =>
      DepartamentsResp(
        code: json["code"],
        message: json["message"],
        data: DataResponse.fromJson(json["data"]),
      );
}

class DataResponse {
  final List<Departament> records;
  final Meta meta;

  DataResponse({
    required this.records,
    required this.meta,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
        records: List<Departament>.from(
            json["records"].map((x) => Departament.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );
}

class Meta {
  final int from;
  final int lastPage;
  final int perPage;
  final int currentPage;
  final int offSet;
  final int totalRecords;

  Meta({
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.currentPage,
    required this.offSet,
    required this.totalRecords,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        from: json["from"],
        lastPage: json["last_page"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        offSet: json["off_set"],
        totalRecords: json["total_records"],
      );
}

class Departament {
  final int idDepartamento;
  final String nombre;

  Departament({
    required this.idDepartamento,
    required this.nombre,
  });

  factory Departament.fromJson(Map<String, dynamic> json) => Departament(
        idDepartamento: json["id_departamento"],
        nombre: json["nombre"],
      );
}
