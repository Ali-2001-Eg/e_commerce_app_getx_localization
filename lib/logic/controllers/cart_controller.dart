import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/products_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {
//map because item could be selected more than once
  var productsMap = {}.obs;

  void addProductsToCart(ProductsModel productsModel) {
    if (productsMap.containsKey(productsModel)) {
      //to add it again
      //operator [] returns key and value
      productsMap[productsModel] += 1;
      /*  print(productsMap);
      => {Instance of 'ProductsModel': 2, Instance of 'ProductsModel': 1, Instance of 'ProductsModel': 2}
      print(productsMap.entries.map((e) => e.key.price * e.value).toList());//to calculate total price for each item [219.9, 22.3, 55.99]
      print(productsMap.entries
          .map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2)); //returns all price*/
    } else {
      //if it doesn't exist add it
      productsMap[productsModel] = 1;
      /* print(productsMap.entries.map((e) => e.key.price * e.value).toList());//to calculate total price
      print(productsMap.entries
          .map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element)
         .toStringAsFixed(2));*/
    }
  }

  void removeProductsFromCart(ProductsModel productsModel) {
    if (productsMap.containsKey(productsModel) &&
        productsMap[productsModel] == 1) {
      //if it's only one item of this product => remove it 
      productsMap.removeWhere((key, value) => key == productsModel);
    } else {
      productsMap[productsModel] -= 1;
    }
  }

  //for trash icon
  void removeOneProduct(ProductsModel productsModel) {
    productsMap.removeWhere((key, value) => key == productsModel);
  }

  //clear all cart
  void clearCart() {
    if (productsMap.isEmpty) {
      Get.snackbar('Already Empty', 'Please Add some products to your cart');
    } else {
      Get.defaultDialog(
        backgroundColor: Colors.grey,
        title: 'Clear cart!',
        titleStyle: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        middleText: 'Are you sure you want to remove all products',
        middleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        radius: 10,
        textCancel: ' No ',
        cancelTextColor: Colors.white,
        textConfirm: ' Yes ',
        confirmTextColor: Colors.white,
        onCancel: ()  {
          Get.toNamed(Routes.cartScreen);
        },
        onConfirm: ()  {
        productsMap.clear();
        Get.back();
      },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor,

      );
    }
  }

  get totalPrice =>
      productsMap.entries
          .map((e) => e.key.price * e.value) // to go inside our map
          .toList()
          .reduce((value, element) => value + element) // => add all elements
          .toStringAsFixed(2); //to keep only two numbers => .01

  get totalProducts =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();
}
