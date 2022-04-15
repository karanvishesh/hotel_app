import 'package:get/get.dart';
import 'package:hotel_app/helper/cart_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
