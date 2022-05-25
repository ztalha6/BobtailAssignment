import 'package:bobtail_assignment/app/data/services/snackbar_manager.dart';
import 'package:bobtail_assignment/app/data/services/validator.dart';
import 'package:bobtail_assignment/app/modules/home/views/home_view.dart';
import 'package:bobtail_assignment/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisibility = false.obs;
  RxBool isLoading = false.obs;

  RxnString emailError = RxnString();

  RxnString passwordError = RxnString();

  Future<void> loginPressed() async {
    String email = emailController.text;
    String password = passwordController.text;

    emailError.value = Validator.validateEmail(email);
    passwordError.value = Validator.validatePassword(password);

    if (emailError.value == null && passwordError.value == null) {
      isLoading.value = true;
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print(credential);
        SnackbarManager().showSuccessSnackbar('Login successfull');

        Get.to(() => HomeView());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
      isLoading.value = false;
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
