import 'package:e_commerce_app_with_firebase/routes/app_routes.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../logic/controllers/main_controller.dart';
import 'cart_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  var controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Scaffold(
            backgroundColor: context.theme.colorScheme.background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(controller.titles[controller.currentIndex.value]),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: Image.asset('assets/images/shop.png'))
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: 'Home',
                    activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category_outlined,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: 'Category',
                    activeIcon: Icon(
                      Icons.category_outlined,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: 'Favourite',
                    activeIcon: Icon(
                      Icons.favorite_outline,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: 'Settings',
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    )),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          )),
    );
  }
}
