import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/card_items.dart';
import '../widgets/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                   TextUtils(
                      text: 'Find Your',
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 25),
                   SizedBox(
                    height: 5,
                  ),
                   TextUtils(
                      text: 'INSPIRATION',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                   SizedBox(
                    height: 20,
                  ),
                   SearchTextForm(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    text: 'Categories',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode ? Colors.white : Colors.black)),
          ),
          const SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    ));
  }
}
