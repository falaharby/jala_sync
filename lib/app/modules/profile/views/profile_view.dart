import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:jala_verification/app/utils/colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body:  Center(
        child: GestureDetector(
          onTap: () {
            controller.logout();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
