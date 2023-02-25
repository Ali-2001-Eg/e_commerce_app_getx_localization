import 'package:e_commerce_app_with_firebase/logic/controllers/products_controller.dart';
import 'package:e_commerce_app_with_firebase/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/details_page_widgets/add_to_cart.dart';
import '../widgets/details_page_widgets/clothes_info_widget.dart';
import '../widgets/details_page_widgets/image_slider.dart';
import '../widgets/details_page_widgets/size_list_widget.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductsDetailsScreen({Key? key, required this.productsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductsController>();
    return  SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productsModel.image,
              ),
              ClothesInfo(
                title: productsModel.title,
                productId: productsModel.id,
                rate: productsModel.rating.rate,
                description: productsModel.description,
              ),
              const SizeList(),
              AddToCart(
                price: productsModel.price.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
