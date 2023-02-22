import 'package:get/get.dart';

import '../../models/products_model.dart';
import '../../services/products_services.dart';

class ProductsController extends GetxController{

  var productList = <ProductsModel>[].obs;
  var isLoading = true.obs;

//required to get all products
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future<void> getAllProducts()async {
    var products = await ProductServices.getAllProducts();
    try{
      isLoading(true);
      if(products.isNotEmpty){
      productList.addAll(products);
      }
    }finally{
      isLoading(false);
    }
  }


}