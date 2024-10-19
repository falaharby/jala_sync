// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/widgets/app_modal.dart';
import 'package:jala_verification/app/widgets/app_text_field.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      AppTextField(
                        labelText: 'Name',
                        controller: nameController,
                        hintText: 'Input Name',
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        controller: emailController,
                        labelText: 'Email',
                        hintText: 'Input Email',
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        controller: passwordController,
                        hintText: 'Input Password',
                        labelText: 'Password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator(color: primaryColor);
                  }
                  return GestureDetector(
                    onTap: () async {
                      if (controller.isLoading.value == false) {
                        try {
                          await controller.register(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          );
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Success Register',
                              message: 'Please login to use our feature',
                              duration: Duration(seconds: 3),
                            ),
                          );
                          Get.offAllNamed(Routes.LOGIN);
                        } catch (e) {
                          final error = (e as AppwriteException).message;
                          if (error != null) {
                            if (error.contains('param')) {
                              showModalDialog(
                                  context: context,
                                  title: 'Failed Register',
                                  content: Text(
                                    error.split('param: ')[1],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: subtitleColor,
                                    ),
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                          color: primaryColor,
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        child: Center(
                                          child: Text(
                                            'Kembali'.tr,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]);
                            } else {}
                          }
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        border: Border(
                          top: BorderSide(color: borderColor, width: 1),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Obx(
                            () {
                              if (controller.isLoading.value) {
                                return const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 4),
                                );
                              }
                              return const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
