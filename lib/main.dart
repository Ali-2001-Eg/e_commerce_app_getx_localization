import 'package:e_commerce_app_with_firebase/logic/controllers/products_controller.dart';
import 'package:e_commerce_app_with_firebase/routes/app_routes.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logic/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    return GetMaterialApp(
      title: 'Ali Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().myTheme,
      // home:SignUpScreen(),
      //firebase saves data automatically
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? Routes.mainScreen
          : Routes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
