import 'package:get/get.dart';

import '../../config/enstring/enstring.dart';
import '../../config/images/images.dart';

class PaymentController extends GetxController {
  List cardImage = [AppImage.credit, AppImage.debit];
  RxInt index = 0.obs;
  RxString option = EnString.applePay.obs;
}
