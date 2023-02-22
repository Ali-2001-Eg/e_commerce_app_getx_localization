import 'package:http/http.dart'as http;

import '../models/products_model.dart';
import '../utils/my_string.dart';
class ProductServices{

  static Future<List<ProductsModel>> getAllProducts()async{
    //abstract method that has type of abstract class
   var response =  await http.get(Uri.parse('$baseUrl/products'));
   if(response.statusCode == 200){
     //to link models and repos
     var jsonData=response.body;
     return productsModelFromJson(jsonData);
   }else{
     return throw Exception('Failed to load products');
   }

  }
}