import 'package:e_commerce_app_with_firebase/models/products_model.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/products_controller.dart';

class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    print(controller.productList.length);
    return Obx(() {
      if(controller.isLoading.value){
        return Center(child: CircularProgressIndicator(color: Get.isDarkMode?pinkClr:mainColor,));
      }else{
        return Expanded(
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.75,
                mainAxisSpacing: 15,
                crossAxisSpacing: 6,
                maxCrossAxisExtent: 250,
                // mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) => _buildCardItems(
                imgPath: controller.productList[index].image,
                price: controller.productList[index].price,
                rate: controller.productList[index].rating.rate
              )),
        );
      }

    });
  }

  Widget _buildCardItems({required String imgPath,required double price,required double rate}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15),
                color:Get.isDarkMode?Colors.black:Colors.white,
                boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Get.isDarkMode ? Colors.white : Colors.black45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Get.isDarkMode ? Colors.white : Colors.black45,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  image:  DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.fill
                  ),

                ),
                child: controller.isLoading.value?Center(child:  CircularProgressIndicator(color:Get.isDarkMode?pinkClr:mainColor,)):Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(text: '\$ $price',color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3,right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(text:rate.toString(), fontSize: 13, fontWeight: FontWeight.bold, color:Get.isDarkMode?Colors.white:Colors.black),
                          Icon(Icons.star_border_outlined,color:Get.isDarkMode?Colors.white:Colors.black,size: 15,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}