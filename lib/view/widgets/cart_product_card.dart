import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
class CartProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  const CartProductCard({Key? key, required this.imagePath, required this.title, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
     margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.isDarkMode? pinkClr.withOpacity(0.7):mainColor.withOpacity(0.4),
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
                image: NetworkImage(imagePath),
                fit: BoxFit.cover
              )
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(text: title, fontSize: 14, fontWeight: FontWeight.bold, color: Get.isDarkMode? Colors.white:Colors.black,),
                SizedBox(height: 20,),
                TextUtils(text: '\$ $price', fontSize: 16, fontWeight: FontWeight.bold, color: Get.isDarkMode? Colors.white:Colors.black,),

              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_sharp,color: Get.isDarkMode? Colors.white:Colors.black,)),
                TextUtils(text: '1', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_sharp,color:Get.isDarkMode? Colors.white:Colors.black,)),
              ],),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 20,color: Get.isDarkMode?Colors.black:Colors.red,))
            ],
          ),
          
        ],
      ),
    );
  }
}
