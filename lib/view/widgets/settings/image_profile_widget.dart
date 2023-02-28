import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app_with_firebase/logic/controllers/settings_controller.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Obx(
      () => Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration:  BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      controller.displayUserPhoto.value
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: Get.find<SettingsController>()
                    .capitalize(controller.displayUserName.value),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              TextUtils(
                text: controller.displayUserEmail.value,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
