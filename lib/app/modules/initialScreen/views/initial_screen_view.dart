import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';

import 'package:get/get.dart';

import '../controllers/initial_screen_controller.dart';

class InitialScreenView extends GetView<InitialScreenController> {
  const InitialScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.initScreen();

    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: CircularProgressIndicator(color: whiteColor,),
        ),
    );
  }
}
