import 'package:bobtail_assignment/app/data/model/response_model.dart';
import 'package:bobtail_assignment/app/data/provider/auth_provider.dart';
import 'package:bobtail_assignment/app/data/services/snackbar_manager.dart';
import 'package:bobtail_assignment/app/data/services/validator.dart';
import 'package:bobtail_assignment/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
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
      ResponseModel response = await AuthProvider().login(email, password);
      if (response.success) {
        SnackbarManager().showSuccessSnackbar('Login successfull');
        Get.to(() => HomeView());
      } else {
        SnackbarManager().showAlertSnackbar(response.error!);
      }
      isLoading.value = false;
    }
  }
}
