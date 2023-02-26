import 'package:e_commerce_app_with_firebase/models/category_model.dart';
import 'package:http/http.dart' as http;
import '../models/products_model.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getAllCategories() async {
    //abstract method that has type of abstract class
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      //to link models and repos
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load categories');
    }
  }
}

class CategoryProductsServices {
  static Future<List<ProductsModel>> getAllCategoryProducts(String categoryName) async {
    //abstract method that has type of abstract class
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (response.statusCode == 200) {
      //to link models and repos
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load products');
    }
  }
}
