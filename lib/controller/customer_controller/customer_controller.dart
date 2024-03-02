import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/images/images.dart';
import '../../models/models.dart';
import '../base_controlle.dart';

class CustomerController extends GetxController {
  RxList n = [0, 0, 0, 0].obs;
  RxBool loading = false.obs;
  final BaseController _api = BaseController();

  ///add quantity
  void add(int index) {
    n[index]++;
  }

  @override
  void onInit() async {
    super.onInit();
    await getcustomers(null);
  }

  ///minus quantity
  void minus(int index) {
    if (n[index] > 0) n[index]--;
  }

  List cartImages = [
    AppImage.designjeans,
    AppImage.nokia,
  ];

  List cartColors = [
    AppColors.blueColor,
    AppColors.pinkColor,
  ];

  List description = [
    "SUPER LACTEOS METAPAN",
    "LACTEOS DAYSI",
  ];

  List names = [
    "ROBERTO ULISES FIGUEROA CASTILLO",
    "LOS QUESITOS",
  ];
  // List<CustomerItem> customers = [];
  final RxList<CustomerItem> customers = RxList<CustomerItem>([]);
  CustomerPagination? pagination;
  getcustomers(String? term) async {
    if (loading.value == true) return [];
    if (pagination != null &&
        pagination!.currentPage == (pagination!.lastPage - 1)) {
      return;
    }
    loading.value = true;
    var data = {
      "page": (pagination != null) ? (pagination!.currentPage + 1) : 1,
      "page_size": 10,
      "sort": "ASC",
      if (term != null && term.isNotEmpty) "search": {"term": term}
    };
    var resp = await _api.postData("api/cliente/index", data);
    loading.value = false;
    print(resp.body['data']['records']);
    if (resp.body['data'] != null &&
        resp.body['data']['records'] != null &&
        resp.body['data']['records']['id_cliente'] != null) {
      var cliente = CustomerItem.fromJson(resp.body['data']['records']);
      customers.addAll([cliente]);
    } else if (resp.isOk) {
      // customers = CustomerResponse.fromJson(resp.body).data.records;
      customers.addAll(CustomerResponse.fromJson(resp.body).data.records);
      pagination = CustomerResponse.fromJson(resp.body).data.meta;
    }
    return resp.isOk;
  }
}
