import 'package:get/get.dart';

class TrackOrderController extends GetxController {
  RxList index = <int>[].obs;
  var status = 'Order Confirmed';

  @override
  void onInit() async {
    storeIndex();
    super.onInit();
  }

  storeIndex() {
    index.clear();
    if (status == "Order Confirmed") {
      index.add(0);
    } else if (status == "Order Dispatched") {
      index.add(0);
      index.add(1);
    } else {
      index.add(0);
      index.add(1);
      index.add(2);
    }
  }
}
