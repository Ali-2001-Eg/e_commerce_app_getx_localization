import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: TextUtils(
                    text: 'Category',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white:Colors.black,
                  ),

                ),
              ),
              const SizedBox(height: 20,),
              CategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
