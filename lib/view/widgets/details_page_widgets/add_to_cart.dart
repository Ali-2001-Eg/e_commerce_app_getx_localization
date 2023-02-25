import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class AddToCart extends StatelessWidget {
  final String price;
  const AddToCart({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                text: 'Price',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              Text(
                '\$ $price',
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                ),
              )
            ],
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton.icon(

                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    elevation: 0,
                  ),
                  icon:  Icon(Icons.shopping_cart_outlined,color:Get.isDarkMode? Colors.white:Colors.black,),
                  label: TextUtils(
                    text: 'Check out',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  )),
            ),
          )

        ],
      ),
    );
  }
}
