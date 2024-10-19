// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/widgets/app_button.dart';
import 'package:jala_verification/app/widgets/app_modal.dart';
import 'package:jala_verification/app/widgets/app_text_field.dart';

import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                controller: emailController,
                hintText: 'Email',
                validator: (val) {
                  if(val == '') {
                    return 'Harap masukkan email';
                  }
                  if(!isEmail(val ?? '')){
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
                validator: (val) {
                  if(val == '') {
                    return 'Harap masukkan password';
                  }
                  if ((val?.length ?? 0) < 8) {
                    return 'Minimal password adalah 8 digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Obx(
                () => AppButtonWidget(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await controller.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Get.offAllNamed(Routes.HOME);
                      } catch (e) {
                        final error = (e as AppwriteException).message;
                        if (error != null) {
                          if (e.code == 401) {
                            showModalDialog(
                              context: context,
                              dismissable: true,
                              title: 'Gagal Login',
                              subtitle:  'Email atau Password salah, silahkan cek kembali',
                              actions: [
                                AppButtonWidget(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  text: 'Kembali',
                                  textSize: 12,
                                  textColor: whiteColor,
                                  isLoading: false,
                                )
                              ]
                            );
                          }
                        }
                      }
                    }
                  },
                  text: 'Login',
                  textColor: whiteColor,
                  isLoading: controller.isLoading.value,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.REGISTER);
                },
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
