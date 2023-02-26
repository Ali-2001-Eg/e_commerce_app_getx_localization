import 'package:e_commerce_app_with_firebase/models/products_model.dart';
import 'package:e_commerce_app_with_firebase/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isCategoryProductsLoading = false.obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg"
  ];
  var categoryList = <ProductsModel>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.getAllCategories();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  Future getProductsCategories(String nameCategory) async {
    isCategoryProductsLoading(true);
    categoryList.value = await CategoryProductsServices.getAllCategoryProducts(nameCategory);
    isCategoryProductsLoading(false);
  }
//to wait again until data is rendered
  getCategoryIndex(int index) async {
    var categoryName = await getProductsCategories(categoryNameList[index]);
    if (categoryName.isNotEmpty) {
      // this is wrong => categoryList.addAll(categoryName); => redundant products
      categoryList.value = categoryName;
    }
  }
}
