import 'package:e_commerce_app_with_firebase/logic/controllers/products_controller.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class ProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.lazyPut(() => CartController());
  }
}