import 'package:flutter/material.dart';

import 'package:jala_verification/app/modules/patungan/controllers/patungan_controller.dart';
import 'package:get/get.dart';

class BenurView extends GetView<PatunganController> {
  const BenurView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        print(controller.listBenur);  
        return const SizedBox();
      }),
    );
  }
}