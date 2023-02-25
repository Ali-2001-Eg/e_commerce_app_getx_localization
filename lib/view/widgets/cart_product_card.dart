import 'package:e_commerce_app_with_firebase/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app_with_firebase/models/products_model.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/theme.dart';

class CartProductCard extends StatelessWidget {
  final ProductsModel productsModel;
  final int index;

  const CartProductCard(
      {Key? key, required this.productsModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(productsModel.image),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                  text: productsModel.title,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: '\$ ${controller.totalProducts[index].toStringAsFixed(2)}',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeProductsFromCart(productsModel);
                      },
                      icon: Icon(
                        Icons.remove_circle_sharp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                  TextUtils(
                      text: controller.productsMap[productsModel].toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  IconButton(
                      onPressed: () {
                        controller.addProductsToCart(productsModel);
                      },
                      icon: Icon(
                        Icons.add_circle_sharp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: Colors.grey,
                      title: 'Log out From App',
                      titleStyle: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                      middleText: 'Are you sure you want to log out',
                      middleTextStyle: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                      radius: 10,
                      textCancel: ' No ',
                      cancelTextColor: Colors.white,
                      textConfirm: ' Yes ',
                      confirmTextColor: Colors.white,
                      onCancel: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      onConfirm: () {
                        controller.removeOneProduct(productsModel);
                        Get.back();
                      },
                      buttonColor: Get.isDarkMode?pinkClr:mainColor,

                    );


                  },
                  icon: Icon(
                    Icons.delete,
                    size: 20,
                    color: Get.isDarkMode ? Colors.black : Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
