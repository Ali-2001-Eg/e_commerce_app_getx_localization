import 'package:e_commerce_app_with_firebase/logic/controllers/products_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart_product_card.dart';
import '../widgets/cart_total.dart';
import '../widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.backspace_outlined))
        ],
      ),
      backgroundColor: context.theme.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 700,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10, bottom: 200),
                  itemBuilder: (context, index) => CartProductCard(
                        title: controller.productList[index].title,
                        imagePath: controller.productList[index].image,
                        price: controller.productList[index].price.toString(),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 15),
            ),
          ),
          Positioned(bottom: 0, child: CartTotal())
        ],
      ),
    ));
  }
}
