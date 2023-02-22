import 'package:e_commerce_app_with_firebase/routes/app_routes.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/facebook-model.dart';

class AuthController extends GetxController {
  var isConfirmedShown = false.obs;

  var isPasswordShown = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  var displayUserName = '';
  var displayUserPhoto = '';

  var googleSignIn = GoogleSignIn();
  FacebookModel? facebookModel;

  var isSignedIn = false;
  final GetStorage authBox = GetStorage();


  changeSuffixIcon() {
    isPasswordShown.value = !isPasswordShown.value;
  }

  changeSuffixConfirmedIcon() {
    isConfirmedShown.value = !isConfirmedShown.value;
  }

  void signUpUsingFirebase(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        //to send data after registration success
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Password', 'Weak Password',
            backgroundColor: languageSettings,
            colorText: Colors.white70,
            barBlur: 5);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Email', 'Email Already in Use',
            backgroundColor: languageSettings,
            colorText: Colors.white70,
            barBlur: 15);
      } else {
        Get.snackbar('Firebase Error!', e.toString());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: languageSettings,
          colorText: Colors.white70,
          barBlur: 5); //errors not conducted because of fire base
    }
  }

  void signInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        auth.currentUser!.email;
      });
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' &&
          e.code == 'wrong password provided for that user') {
        Get.snackbar('Login', 'Invalid Email or Password',
            backgroundColor: languageSettings,
            colorText: Colors.white70,
            barBlur: 5);
      } else {
        Get.snackbar(
            e.code.replaceAll(RegExp('-'), ' ').capitalize!, e.message!,
            backgroundColor: languageSettings,
            colorText: Colors.white70,
            barBlur: 5);
      }
    } catch (e) {
      Get.snackbar(
          'Network Error Please Try again', e.toString(),
          backgroundColor: languageSettings,
          colorText: Colors.white70,
          barBlur: 5);
    }

  }

  void resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        auth.currentUser!.email;
      });
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.code.replaceAll(RegExp('-'), ' ').capitalize!, e.message!,
          backgroundColor: languageSettings,
          colorText: Colors.white70,
          barBlur: 5);
    } catch (e) {
      print(e);
    }
  }

  void googleSignInUsingFirebase() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      print(googleUser.email);
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(AppRoutes.main);
    } catch (e) {
      Get.snackbar(
          'Error!', e.toString().replaceAll(RegExp('-'), ' ').capitalize!,
          backgroundColor: languageSettings,
          colorText: Colors.white70,
          barBlur: 5);
    }
  }

  void facebookSignInUsingFirebase() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if(loginResult.status == LoginStatus.success){
        final data = await FacebookAuth.instance.getUserData();
        facebookModel = FacebookModel.fromJson(data);
        isSignedIn = true;
        authBox.write('auth', isSignedIn);
        update();
        Get.offNamed(AppRoutes.main);
      }

    } catch (e) {
      Get.snackbar(
          'Error!', e.toString().replaceAll(RegExp('-'), ' ').capitalize!,
          backgroundColor: languageSettings,
          colorText: Colors.white70,
          barBlur: 5);
    }
  }

  Future<void> signOut() async{
    try{
      await auth.signOut();
      await googleSignIn.signOut();
      // await FacebookAuth.i.logOut();
      displayUserName = '';
      displayUserPhoto = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offNamed(Routes.welcome);
    }catch(e){
      Get.snackbar(
          'Error!', e.toString().replaceAll(RegExp('-'), ' ').capitalize!,
          backgroundColor: languageSettings,
          colorText: Colors.white70,
          barBlur: 5);
    }
    }
  }

