import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/products_model.dart';
import '../../services/products_services.dart';

class ProductsController extends GetxController {
  var productList = <ProductsModel>[].obs;
  var favouriteList = <ProductsModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  var searchList = <ProductsModel>[].obs;
  TextEditingController searchController = TextEditingController();
//required to get all products
  @override
  void onInit() {
    getAllProducts();
    List? storedFavouriteProducts = storage.read<List>('favourite');
    //required to save a list in get storage
    if (storedFavouriteProducts != null) {
      favouriteList.value = storedFavouriteProducts
          .map((e) => ProductsModel.fromJson(e))
          .toList();
    }
    super.onInit();
  }

  Future<void> getAllProducts() async {
    var products = await ProductServices.getAllProducts();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //logic for favourites screen
  Future<void> manageFavouriteList(int productId) async {
    //we need to add each item to the list with its id
    int redundantItem = //to get index
        favouriteList.indexWhere((element) => element.id == productId);
    if (redundantItem >= 0) {
      favouriteList
          .removeAt(redundantItem); //to remove redundant items by index
      await storage.remove('favourite');
    } else {
      favouriteList.add(
        productList.firstWhere((element) => element.id == productId),
      );
      await storage.write('favourite', favouriteList);
    }
  }

  //to find any list item in the list
  bool isFavourite(int productId) =>
      favouriteList.any((element) => element.id == productId);

  //search bar logic
  void addToSearchList(String searchName) {
    //to search if title or price is sub text of search text
    searchList.value = productList
        .where((search) =>
            search.title.contains(searchName.toLowerCase()) ||
            search.price.toString().contains(searchName.toLowerCase()))
        .toList();
    update();
  }

  void clearSearch() {
    searchController.clear();
    addToSearchList('');
    update();
  }
}
