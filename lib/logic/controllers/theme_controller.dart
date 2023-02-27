import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {

  final GetStorage boxStorage = GetStorage();

   changeTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ?
        ThemeMode.light : ThemeMode.dark
    );
    //save result in this variable
    saveThemeDataInBox(!getThemeDataFromBox());
  }

  Future<void> saveThemeDataInBox(bool isDark) =>
      boxStorage.write('isDarkMode', isDark);

  bool getThemeDataFromBox() =>
      boxStorage.read<bool>('isDarkMode') ?? false;

  ThemeMode get myTheme => getThemeDataFromBox() ? ThemeMode.dark:ThemeMode.light;
}
