import 'package:e_commerce_app_with_firebase/logic/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextForm extends StatelessWidget {
  final controller = Get.find<ProductsController>();

  SearchTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (_) {
      return TextField(
        controller: controller.searchController,
        onChanged: (searchName) {
          controller.addToSearchList(searchName);
        },
        decoration: InputDecoration(
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.search,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                controller.clearSearch();
              },
              icon: !(controller.searchController.text=='')?Icon(
                Icons.close,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ):Container()),
          hintText: 'Search with name or price',
          hintStyle: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w300),
          labelStyle: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          filled: true,
          fillColor: Colors.white30,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        //line color
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
      );
    });
  }
}
