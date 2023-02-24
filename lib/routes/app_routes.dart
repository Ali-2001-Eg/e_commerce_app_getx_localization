import 'package:e_commerce_app_with_firebase/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app_with_firebase/view/screens/auth/forgot_pass_page.dart';
import 'package:e_commerce_app_with_firebase/view/screens/auth/sign_in_page.dart';
import 'package:e_commerce_app_with_firebase/view/screens/auth/sign_up_page.dart';
import 'package:e_commerce_app_with_firebase/view/screens/main_page.dart';
import 'package:get/get.dart';
import '../logic/bindings/main_binding.dart';
import '../logic/bindings/products_binding.dart';
import '../view/screens/cart_page.dart';
import '../view/screens/welcome_page.dart';

class AppRoutes {
  static const welcome = Routes.welcome;
  static const signIn = Routes.login;
  static const signUp = Routes.register;
  static const forgotPass = Routes.forgotPassword;
  static const main = Routes.mainScreen;
  static const cart = Routes.cartScreen;

  static final routes = <GetPage>[
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(
        name: forgotPass,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: main,
        page: () => MainScreen(),
        bindings: [AuthBinding(), MainBinding(), ProductsBinding()]),
    GetPage(name: cart, page: ()=>  CartScreen(),bindings: [ProductsBinding(),]),
  ];
}

class Routes {
  static const welcome = '/welcomeScreen';
  static const login = '/sign-in';
  static const register = '/sign-up';
  static const forgotPassword = '/forgot-password';
  static const mainScreen = '/main-screen';
  static const cartScreen = '/cart-screen';
}
