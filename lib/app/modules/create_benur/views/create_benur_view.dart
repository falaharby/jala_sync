import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_benur_controller.dart';

class CreateBenurView extends GetView<CreateBenurController> {
  const CreateBenurView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateBenurView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateBenurView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
