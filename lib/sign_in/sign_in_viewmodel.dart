import 'package:bobtail_assignment/utils/validator.dart';
import 'package:bobtail_assignment/widgets/snackbar_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInViewModel extends GetxController {
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
      SnackbarManager().showSuccessSnackbar('Login successfull');
      isLoading.value = false;
      // Get.to(() => const HomeView());
    }
  }
}
