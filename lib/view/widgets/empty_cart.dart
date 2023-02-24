import 'package:e_commerce_app_with_firebase/routes/app_routes.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 200,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Your Cart is ',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
            text: 'Add Items to get Started',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.main),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 0,
            ),
            child: TextUtils(
              text: 'Go To Home',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
