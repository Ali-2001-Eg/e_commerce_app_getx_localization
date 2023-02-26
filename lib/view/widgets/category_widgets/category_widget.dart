import 'package:e_commerce_app_with_firebase/logic/controllers/category_controller.dart';
import 'package:e_commerce_app_with_firebase/services/category_services.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/category_widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    return Obx(
      () {
        if (controller.isCategoryLoading.value) {
          return Center(
            child: SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                    color: Colors.white70,
                    backgroundColor: Get.isDarkMode ? pinkClr : mainColor)),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.categoryNameList.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                     controller.getCategoryIndex(index);
                    Get.to(() => CategoryItem(
                      categoryName: controller.categoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                          controller.imageCategory[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNameList[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.black26,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
