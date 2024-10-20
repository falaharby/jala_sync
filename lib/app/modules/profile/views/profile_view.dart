import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_verification/app/modules/patungan/controllers/patungan_controller.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/widgets/participant_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final patungan = Get.find<PatunganController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.listHistory
                        .map(
                          (e) => ParticipantWidget(
                            name: e.data['tipe'] == 'pakan' ? patungan.listPakan.where((x) => e.data['order_id'] == x.$id).first.data['name'] : '',
                            location: e.data['tipe'] == 'pakan' ? patungan.listPakan.where((x) => e.data['order_id'] == x.$id).first.data['location'] : '',
                            total: e.data['total'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                controller.logout();
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Container(
                margin: const EdgeInsets.all(24),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, color: whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
