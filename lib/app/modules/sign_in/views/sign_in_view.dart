import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return GetX<SignInController>(builder: (m) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Sign In')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Welcome to '.tr,
                      style: Theme.of(context).textTheme.headline5!),
                  TextSpan(
                      text: 'Bobtail'.tr,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: m.emailController,
                      decoration: InputDecoration(
                        errorText: m.emailError.value,
                        hintText: 'email'.tr,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.visiblePassword,
                    controller: m.passwordController,
                    obscureText: !m.passwordVisibility.value,
                    decoration: InputDecoration(
                        errorText: m.passwordError.value,
                        hintText: 'password'.tr,
                        suffixIcon: GestureDetector(
                          child: !m.passwordVisibility.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onTap: () {
                            //flip visibility icon
                            m.passwordVisibility(!m.passwordVisibility.value);
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                            pressedOpacity: 0.7,
                            color: Colors.blue,
                            child: m.isLoading.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'login'.tr,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                            onPressed: m.isLoading.value
                                ? () {}
                                : () {
                                    m.loginPressed();
                                  }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
