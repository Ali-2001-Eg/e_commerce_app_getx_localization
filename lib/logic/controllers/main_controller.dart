import 'package:e_commerce_app_with_firebase/view/screens/category_page.dart';
import 'package:e_commerce_app_with_firebase/view/screens/favourite_page.dart';
import 'package:e_commerce_app_with_firebase/view/screens/home_page.dart';
import 'package:e_commerce_app_with_firebase/view/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class MainController extends  GetxController{
  var currentIndex = 0.obs;
  final  tabs =  [
    HomeScreen(),
    CategoryScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ].obs;
  final  titles =  [
    'Ali Shop',
    'Category',
    'Favourites',
    'Settings'
  ].obs;


}