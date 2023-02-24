import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/products_controller.dart';

class FavouritesScreen extends StatelessWidget {
   FavouritesScreen({Key? key}) : super(key: key);
final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
         if(controller.favouriteList.isEmpty){
           return Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(
                       height: 200,
                       width: 200,
                       child: Image.asset('assets/images/heart.png',fit: BoxFit.cover,),
                     ),
                     const SizedBox(height: 20,),
                     TextUtils(
                         text:
                         'Please, Add your Favourite Products.',
                         textOverFlow: TextOverflow.clip,
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                         color: Get.isDarkMode ? Colors.white : Colors.black),
                   ],
                 ),);
         }else{
           return ListView.separated(
                   itemBuilder: (context, index) => _buildFavItems(
                     imagePath: controller.favouriteList[index].image,
                     title: controller.favouriteList[index].title,
                     price: controller.favouriteList[index].price.toString(),
                     productId: controller.favouriteList[index].id,
                   ),
                   separatorBuilder: (context, index) => const Divider(color: Colors.grey,thickness: 3,),
                   itemCount: controller.favouriteList.length);
         }
      }),

    );
  }

  Widget _buildFavItems({required String imagePath , required String title , required String price, required int productId}) => Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        text:
                            title,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    const SizedBox(height: 10,),
                    TextUtils(
                        text:
                            '\$ $price',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ],
                ),
              ),
              IconButton(onPressed: (){
                controller.manageFavouriteList(productId);
              }, icon: const Icon(Icons.favorite,color: Colors.red,size: 30,))
            ],
          ),
        ),
      );
}
