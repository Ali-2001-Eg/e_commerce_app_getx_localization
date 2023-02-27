import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = eng;

  @override
  void onInit() async {
    langLocal = await getLanguage;
    super.onInit();
  }

  String capitalize(String profileName) {
    return profileName.split(' ').map((e) => e.capitalize).join(' ');
  }

  //language
  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String lang) {
    //if lang is already english return null
    if (langLocal == lang) return;
    if (lang == fra) {
      langLocal = fra;
      saveLanguage(fra);
    } else if (lang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    }else{
      langLocal = eng;
      saveLanguage(eng);
    }
    update();
  }
}
