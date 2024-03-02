class CustomerResponse {
  final int code;
  final String message;
  final DataCustomerList data;

  CustomerResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      CustomerResponse(
        code: json["code"],
        message: json["message"],
        data: DataCustomerList.fromJson(json["data"]),
      );
}

class DataCustomerList {
  final List<CustomerItem> records;
  final CustomerPagination meta;

  DataCustomerList({
    required this.records,
    required this.meta,
  });

  factory DataCustomerList.fromJson(Map<String, dynamic> json) =>
      DataCustomerList(
        records: List<CustomerItem>.from(
            json["records"].map((x) => CustomerItem.fromJson(x))),
        meta: CustomerPagination.fromJson(json["meta"]),
      );
}

class CustomerPagination {
  final int from;
  final int lastPage;
  final int perPage;
  final int currentPage;
  final int offSet;
  final int totalRecords;

  CustomerPagination({
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.currentPage,
    required this.offSet,
    required this.totalRecords,
  });

  factory CustomerPagination.fromJson(Map<String, dynamic> json) =>
      CustomerPagination(
        from: json["from"],
        lastPage: json["last_page"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        offSet: json["off_set"],
        totalRecords: json["total_records"],
      );
}

class CustomerItem {
  final int idCliente;
  final int idSucursal;
  final String sucursal;
  final int categoria;
  final String categoriaNombre;
  final String nombre;
  final String negocio;
  final String direccion;
  final int municipio;
  final int depto;
  final String deptoNombre;
  final dynamic pais;
  final String dui;
  final String nit;
  final String nrc;
  final String giro;
  final String telefono1;
  final String telefono2;
  final String codcliente;
  final String email;
  final dynamic ultventa;
  final dynamic acumulado;
  final dynamic saldo;
  final int percibe;
  final int retiene;
  final int retiene10;
  final int inactivo;
  final int latitud;
  final int longitud;
  final String fechaNac;
  final int idVendedor;
  final int diasCredito;
  final int limiteCredito;
  final int consumoInterno;
  final dynamic codActEco;

  CustomerItem({
    required this.idCliente,
    required this.idSucursal,
    required this.sucursal,
    required this.categoria,
    required this.categoriaNombre,
    required this.nombre,
    required this.negocio,
    required this.direccion,
    required this.municipio,
    required this.depto,
    required this.deptoNombre,
    required this.pais,
    required this.dui,
    required this.nit,
    required this.nrc,
    required this.giro,
    required this.telefono1,
    required this.telefono2,
    required this.codcliente,
    required this.email,
    required this.ultventa,
    required this.acumulado,
    required this.saldo,
    required this.percibe,
    required this.retiene,
    required this.retiene10,
    required this.inactivo,
    required this.latitud,
    required this.longitud,
    required this.fechaNac,
    required this.idVendedor,
    required this.diasCredito,
    required this.limiteCredito,
    required this.consumoInterno,
    required this.codActEco,
  });

  factory CustomerItem.fromJson(Map<String, dynamic> json) => CustomerItem(
        idCliente: json["id_cliente"],
        idSucursal: json["id_sucursal"],
        sucursal: json["sucursal"],
        categoria: json["categoria"],
        categoriaNombre: json["categoria_nombre"],
        nombre: json["nombre"],
        negocio: json["negocio"],
        direccion: json["direccion"],
        municipio: json["municipio"],
        depto: json["depto"],
        deptoNombre: json["depto_nombre"],
        pais: json["pais"],
        dui: json["dui"],
        nit: json["nit"],
        nrc: json["nrc"],
        giro: json["giro"],
        telefono1: json["telefono1"],
        telefono2: json["telefono2"],
        codcliente: json["codcliente"].toString(),
        email: json["email"],
        ultventa: json["ultventa"],
        acumulado: json["acumulado"],
        saldo: json["saldo"],
        percibe: json["percibe"],
        retiene: json["retiene"],
        retiene10: json["retiene10"],
        inactivo: json["inactivo"] ?? 0,
        latitud: json["latitud"] ?? 0,
        longitud: json["longitud"] ?? 0,
        fechaNac: json["fecha_nac"],
        idVendedor: json["id_vendedor"],
        diasCredito: json["dias_credito"],
        limiteCredito: json["limite_credito"],
        consumoInterno: json["consumo_interno"] ?? 0,
        codActEco: json["cod_act_eco"],
      );
}
