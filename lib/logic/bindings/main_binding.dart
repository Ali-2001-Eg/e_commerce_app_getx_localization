import 'package:e_commerce_app_with_firebase/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
  }

}