import 'package:e_commerce_app_with_firebase/logic/controllers/settings_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changeTheme();
                controller.switchValue.value = value;
              },
              activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
              activeColor: Get.isDarkMode ? pinkClr : mainColor,

            )
          ],
        ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              text: 'Dark Mode'.tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ],
      ),
    );
  }
}
