import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor:Colors.green[100],
        borderRadius: BorderRadius.circular(5),
        customBorder: const StadiumBorder(),
        onTap: () {
          Get.defaultDialog(
            backgroundColor: Colors.grey,
            title: 'Log out From App',
            titleStyle: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            middleText: 'Are you sure you want to log out',
            middleTextStyle: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            radius: 10,
            textCancel: ' No ',
            cancelTextColor: Colors.white,
            textConfirm: ' Yes ',
            confirmTextColor: Colors.white,
            onCancel: () => Navigator.pop(context),
            onConfirm: () {
              Get.find<AuthController>().signOut();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: logOutSettings,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
                text: 'Log out'.tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
