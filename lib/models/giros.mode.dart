class GirosResponse {
  final int code;
  final String message;
  final GirosData data;

  GirosResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GirosResponse.fromJson(Map<String, dynamic> json) => GirosResponse(
        code: json["code"],
        message: json["message"],
        data: GirosData.fromJson(json["data"]),
      );
}

class GirosData {
  final List<GiroItem> records;
  final GirosMeta meta;

  GirosData({
    required this.records,
    required this.meta,
  });

  factory GirosData.fromJson(Map<String, dynamic> json) => GirosData(
        records: List<GiroItem>.from(
            json["records"].map((x) => GiroItem.fromJson(x))),
        meta: GirosMeta.fromJson(json["meta"]),
      );
}

class GirosMeta {
  final int from;
  final int lastPage;
  final int perPage;
  final int currentPage;
  final int offSet;
  final int totalRecords;

  GirosMeta({
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.currentPage,
    required this.offSet,
    required this.totalRecords,
  });

  factory GirosMeta.fromJson(Map<String, dynamic> json) => GirosMeta(
        from: json["from"],
        lastPage: json["last_page"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        offSet: json["off_set"],
        totalRecords: json["total_records"],
      );
}

class GiroItem {
  final int id;
  final int codigo;
  final String descripcion;

  GiroItem({
    required this.id,
    required this.codigo,
    required this.descripcion,
  });

  factory GiroItem.fromJson(Map<String, dynamic> json) => GiroItem(
        id: json["id"],
        codigo: json["codigo"],
        descripcion: json["descripcion"],
      );
}
